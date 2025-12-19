import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../data/lesson_models.dart';
import '../data/kannada_content.dart';
import '../services/progress_service.dart';
import 'matching_screen.dart';
import 'dart:math';

/// Lesson screen with all 5 exercise types
class LessonScreen extends StatefulWidget {
  final String? unitId;
  final String? lessonId;

  const LessonScreen({super.key, this.unitId, this.lessonId});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late Lesson _lesson;
  late List<Word> _words;
  
  // Exercise flow: 0-4 = vocab cards, 5 = matching, 6 = quiz, 7 = speaking, 8 = listening
  int _currentStep = 0;
  int get _totalSteps => _words.length + 4; // vocab + match + quiz + speak + listen
  
  // Quiz state
  int? _selectedAnswer;
  bool _showFeedback = false;
  late Word _quizWord;
  late List<String> _quizOptions;
  late int _correctIndex;
  
  // Speaking state
  bool _hasRecorded = false;
  
  // Listening state
  bool _hasListened = false;
  int? _listeningAnswer;
  late Word _listeningWord;
  late List<String> _listeningOptions;
  late int _listeningCorrectIndex;

  @override
  void initState() {
    super.initState();
    _loadLesson();
    _setupQuiz();
    _setupListening();
  }

  void _loadLesson() {
    final units = KannadaCurriculum.getAllUnits();
    LessonUnit targetUnit;
    
    if (widget.unitId != null) {
      targetUnit = units.firstWhere(
        (u) => u.id == widget.unitId,
        orElse: () => units.first,
      );
    } else {
      targetUnit = units.first;
    }
    
    if (widget.lessonId != null) {
      _lesson = targetUnit.lessons.firstWhere(
        (l) => l.id == widget.lessonId,
        orElse: () => targetUnit.lessons.first,
      );
    } else {
      _lesson = targetUnit.lessons.first;
    }
    
    _words = _lesson.words;
  }

  void _setupQuiz() {
    if (_words.isEmpty) return;
    final rand = Random();
    _quizWord = _words[rand.nextInt(_words.length)];
    _quizOptions = [_quizWord.english];
    
    // Add 3 wrong answers from other words
    final otherWords = _words.where((w) => w != _quizWord).toList()..shuffle();
    for (var w in otherWords.take(3)) {
      _quizOptions.add(w.english);
    }
    // If not enough words, add some defaults
    while (_quizOptions.length < 4) {
      _quizOptions.add(['Good', 'Bad', 'Big', 'Small'][_quizOptions.length - 1]);
    }
    _quizOptions.shuffle();
    _correctIndex = _quizOptions.indexOf(_quizWord.english);
  }

  void _setupListening() {
    if (_words.isEmpty) return;
    final rand = Random();
    _listeningWord = _words[rand.nextInt(_words.length)];
    _listeningOptions = [_listeningWord.kannada];
    
    final otherWords = _words.where((w) => w != _listeningWord).toList()..shuffle();
    for (var w in otherWords.take(3)) {
      _listeningOptions.add(w.kannada);
    }
    while (_listeningOptions.length < 4) {
      _listeningOptions.add(['Namaskara', 'Houdu', 'Illa', 'Dhanyavada'][_listeningOptions.length - 1]);
    }
    _listeningOptions.shuffle();
    _listeningCorrectIndex = _listeningOptions.indexOf(_listeningWord.kannada);
  }

  double get _progress => (_currentStep + 1) / _totalSteps;

  void _nextStep() {
    if (_currentStep < _words.length - 1) {
      // Still showing vocab cards
      setState(() => _currentStep++);
    } else if (_currentStep == _words.length - 1) {
      // Go to matching
      _goToMatching();
    } else if (_currentStep == _words.length) {
      // After matching, go to quiz
      setState(() {
        _currentStep++;
        _selectedAnswer = null;
        _showFeedback = false;
      });
    } else if (_currentStep == _words.length + 1) {
      // After quiz, go to speaking
      setState(() => _currentStep++);
    } else if (_currentStep == _words.length + 2) {
      // After speaking, go to listening
      setState(() {
        _currentStep++;
        _listeningAnswer = null;
        _showFeedback = false;
      });
    } else {
      // Complete! Save progress
      _completeLesson();
    }
  }

  void _completeLesson() async {
    await ProgressService.markLessonCompleted(_lesson.id, _lesson.xpReward);
    if (mounted) Navigator.pop(context, true);
  }

  void _goToMatching() async {
    final result = await Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => MatchingScreen(words: _words)),
    );
    if (result == true && mounted) {
      setState(() => _currentStep = _words.length); // Move past matching
      _nextStep(); // Go to quiz
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.backgroundLight,
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(24),
                child: _buildContent(),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.pop(context),
            child: Container(
              width: 40, height: 40,
              decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle),
              child: const Icon(CupertinoIcons.xmark, color: AppTheme.textSub, size: 20),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: _progress,
                minHeight: 12,
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation(AppTheme.primary),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Row(
            children: [
              Icon(CupertinoIcons.heart_fill, color: Colors.red.shade400, size: 22),
              const SizedBox(width: 4),
              Text('3', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.red.shade400)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_currentStep < _words.length) {
      return _buildVocabCard(_words[_currentStep]);
    } else if (_currentStep == _words.length + 1) {
      return _buildQuiz();
    } else if (_currentStep == _words.length + 2) {
      return _buildSpeaking();
    } else if (_currentStep == _words.length + 3) {
      return _buildListening();
    }
    return const SizedBox();
  }

  // ==================== VOCAB CARD ====================
  Widget _buildVocabCard(Word word) {
    return Column(
      children: [
        Text('NEW WORD', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSub, letterSpacing: 1)),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
          ),
          child: Column(
            children: [
              Container(
                width: 60, height: 60,
                decoration: BoxDecoration(color: AppTheme.primary.withOpacity(0.1), shape: BoxShape.circle),
                child: const Icon(CupertinoIcons.volume_up, color: AppTheme.primary, size: 28),
              ),
              const SizedBox(height: 24),
              Text(word.kannada, style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: AppTheme.primary)),
              const SizedBox(height: 8),
              Text(word.english, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppTheme.textMain)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
                child: Text('🎤 ${word.pronunciation}', style: TextStyle(fontSize: 14, color: AppTheme.textSub)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ==================== QUIZ ====================
  Widget _buildQuiz() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('QUIZ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSub, letterSpacing: 1)),
        const SizedBox(height: 12),
        Text('What does "${_quizWord.kannada}" mean?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppTheme.textMain)),
        const SizedBox(height: 24),
        ...List.generate(_quizOptions.length, (i) {
          final isSelected = _selectedAnswer == i;
          final isCorrect = i == _correctIndex;
          final showCorrect = _showFeedback && isCorrect;
          final showWrong = _showFeedback && isSelected && !isCorrect;
          
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _showFeedback ? null : () => setState(() => _selectedAnswer = i),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: showCorrect ? AppTheme.greenAccent.withOpacity(0.1) : (showWrong ? Colors.red.withOpacity(0.1) : (isSelected ? AppTheme.primary.withOpacity(0.05) : Colors.white)),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: showCorrect ? AppTheme.greenAccent : (showWrong ? Colors.red : (isSelected ? AppTheme.primary : Colors.grey.shade200)), width: 2),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36, height: 36,
                      decoration: BoxDecoration(
                        color: showCorrect ? AppTheme.greenAccent : (showWrong ? Colors.red : (isSelected ? AppTheme.primary : Colors.grey.shade100)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('${i + 1}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: isSelected || showCorrect || showWrong ? Colors.white : AppTheme.textSub))),
                    ),
                    const SizedBox(width: 14),
                    Expanded(child: Text(_quizOptions[i], style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: AppTheme.textMain))),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  // ==================== SPEAKING ====================
  Widget _buildSpeaking() {
    final word = _words.isNotEmpty ? _words[0] : Word(kannada: 'Namaskara', english: 'Hello', pronunciation: 'nuh-mus-KAH-ruh');
    return Column(
      children: [
        Text('SPEAKING', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSub, letterSpacing: 1)),
        const SizedBox(height: 12),
        Text('Say this word', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppTheme.textMain)),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              Text(word.kannada, style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: AppTheme.primary)),
              const SizedBox(height: 8),
              Text(word.english, style: TextStyle(fontSize: 18, color: AppTheme.textSub)),
              const SizedBox(height: 8),
              Text('🎤 ${word.pronunciation}', style: TextStyle(fontSize: 14, color: AppTheme.textSub)),
            ],
          ),
        ),
        const SizedBox(height: 32),
        CupertinoButton(
          onPressed: () => setState(() => _hasRecorded = true),
          child: Container(
            width: 96, height: 96,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: _hasRecorded ? [AppTheme.greenAccent, AppTheme.greenAccent] : [AppTheme.primary, AppTheme.primaryDark]),
              shape: BoxShape.circle,
            ),
            child: Icon(_hasRecorded ? CupertinoIcons.checkmark : CupertinoIcons.mic_fill, color: Colors.white, size: 44),
          ),
        ),
        const SizedBox(height: 16),
        Text(_hasRecorded ? 'Great job!' : 'Tap to record', style: TextStyle(fontSize: 14, color: AppTheme.textSub)),
      ],
    );
  }

  // ==================== LISTENING ====================
  Widget _buildListening() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('LISTENING', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSub, letterSpacing: 1)),
        const SizedBox(height: 12),
        Text('What word means "${_listeningWord.english}"?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppTheme.textMain)),
        const SizedBox(height: 24),
        Center(
          child: CupertinoButton(
            onPressed: () => setState(() => _hasListened = true),
            child: Container(
              width: 80, height: 80,
              decoration: BoxDecoration(color: AppTheme.primary, shape: BoxShape.circle),
              child: const Icon(CupertinoIcons.volume_up, color: Colors.white, size: 36),
            ),
          ),
        ),
        const SizedBox(height: 24),
        ...List.generate(_listeningOptions.length, (i) {
          final isSelected = _listeningAnswer == i;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => setState(() => _listeningAnswer = i),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.primary.withOpacity(0.05) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: isSelected ? AppTheme.primary : Colors.grey.shade200, width: 2),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 24, height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: isSelected ? AppTheme.primary : Colors.grey.shade300, width: 2),
                        color: isSelected ? AppTheme.primary : Colors.transparent,
                      ),
                      child: isSelected ? const Icon(Icons.check, color: Colors.white, size: 16) : null,
                    ),
                    const SizedBox(width: 14),
                    Expanded(child: Text(_listeningOptions[i], style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: AppTheme.textMain))),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  // ==================== FOOTER ====================
  Widget _buildFooter() {
    bool canProceed = false;
    String buttonText = 'CONTINUE';
    
    if (_currentStep < _words.length) {
      canProceed = true;
      buttonText = 'GOT IT';
    } else if (_currentStep == _words.length + 1) {
      // Quiz
      canProceed = _selectedAnswer != null;
      buttonText = _showFeedback ? 'CONTINUE' : 'CHECK';
    } else if (_currentStep == _words.length + 2) {
      // Speaking
      canProceed = _hasRecorded;
    } else if (_currentStep == _words.length + 3) {
      // Listening
      canProceed = _listeningAnswer != null;
      buttonText = _currentStep == _totalSteps - 1 ? 'FINISH' : 'CONTINUE';
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppTheme.backgroundLight, border: Border(top: BorderSide(color: Colors.grey.shade100))),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: canProceed ? () {
          if (_currentStep == _words.length + 1 && !_showFeedback) {
            setState(() => _showFeedback = true);
          } else {
            _nextStep();
          }
        } : null,
        child: Container(
          width: double.infinity, height: 56,
          decoration: BoxDecoration(
            color: canProceed ? AppTheme.primary : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(child: Text(buttonText, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: canProceed ? Colors.white : Colors.grey.shade400, letterSpacing: 1))),
        ),
      ),
    );
  }
}
