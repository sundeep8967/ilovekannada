import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../data/lesson_models.dart';
import '../data/kannada_content.dart';
import 'matching_screen.dart';

/// Dynamic lesson screen that uses the Kannada curriculum content
class LessonScreen extends StatefulWidget {
  final String? unitId;
  final String? lessonId;

  const LessonScreen({super.key, this.unitId, this.lessonId});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> with SingleTickerProviderStateMixin {
  late List<LessonContent> _contentItems;
  int _currentStep = 0;
  late AnimationController _pulseController;

  // Quiz state
  int? _selectedQuizAnswer;
  bool _showQuizFeedback = false;

  // Speaking state
  bool _isRecording = false;
  bool _hasRecording = false;

  // Listening state
  bool _isPlaying = false;

  // Reading state
  final TextEditingController _readingAnswerController = TextEditingController();
  bool _showReadingFeedback = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    // Load lesson content
    _loadContent();
  }

  void _loadContent() {
    // Get content from the first unit's first lesson by default
    // Or use the passed unitId/lessonId
    final units = KannadaCurriculum.getAllUnits();
    Lesson? targetLesson;

    if (widget.unitId != null && widget.lessonId != null) {
      final unit = units.firstWhere(
        (u) => u.id == widget.unitId,
        orElse: () => units.first,
      );
      targetLesson = unit.lessons.firstWhere(
        (l) => l.id == widget.lessonId,
        orElse: () => unit.lessons.first,
      );
    } else {
      // Default: first lesson of first unit
      targetLesson = units.first.lessons.first;
    }

    _contentItems = targetLesson.content;
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _readingAnswerController.dispose();
    super.dispose();
  }

  double get _progress => (_currentStep + 1) / (_contentItems.length + 1); // +1 for matching

  LessonContent get _currentContent => _contentItems[_currentStep];

  void _nextStep() {
    if (_currentStep < _contentItems.length - 1) {
      setState(() {
        _currentStep++;
        _resetStates();
      });
    } else {
      // All vocabulary done - now go to matching exercise
      _goToMatchingExercise();
    }
  }

  void _goToMatchingExercise() async {
    final result = await Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => const MatchingScreen()),
    );
    
    if (result == true && mounted) {
      // Lesson complete!
      Navigator.pop(context, true);
    }
  }

  void _resetStates() {
    _selectedQuizAnswer = null;
    _showQuizFeedback = false;
    _hasRecording = false;
    _isRecording = false;
    _readingAnswerController.clear();
    _showReadingFeedback = false;
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
                child: _buildCurrentContent(),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
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
              Text(
                '3',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.red.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentContent() {
    final content = _currentContent;

    if (content is VocabWord) {
      return _buildVocabCard(content);
    } else if (content is QuizQuestion) {
      return _buildQuizContent(content);
    } else if (content is SpeakingExercise) {
      return _buildSpeakingContent(content);
    } else if (content is ListeningExercise) {
      return _buildListeningContent(content);
    } else if (content is ReadingExercise) {
      return _buildReadingContent(content);
    }

    return const Center(child: Text('Unknown content type'));
  }

  // ==================== VOCAB CARD ====================
  Widget _buildVocabCard(VocabWord word) {
    return Column(
      children: [
        Text(
          'NEW WORD',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textSub,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
              ),
            ],
          ),
          child: Column(
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  // Play pronunciation
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(CupertinoIcons.volume_up, color: AppTheme.primary, size: 28),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                word.kannada,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textMain,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                word.transliteration,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                word.english,
                style: TextStyle(
                  fontSize: 18,
                  color: AppTheme.textSub,
                ),
              ),
              if (word.pronunciation != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(CupertinoIcons.speaker_1, size: 16, color: AppTheme.textSub),
                      const SizedBox(width: 8),
                      Text(
                        word.pronunciation!,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.textSub,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (word.example != null) ...[
                const SizedBox(height: 16),
                Text(
                  word.example!,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.textSub,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  // ==================== QUIZ CONTENT ====================
  Widget _buildQuizContent(QuizQuestion quiz) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'QUIZ',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textSub,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          quiz.question,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppTheme.textMain,
          ),
        ),
        if (quiz.kannadaText != null) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              quiz.kannadaText!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppTheme.primary,
              ),
            ),
          ),
        ],
        const SizedBox(height: 32),
        ...List.generate(quiz.options.length, (index) {
          final isSelected = _selectedQuizAnswer == index;
          final isCorrect = index == quiz.correctIndex;
          final showCorrect = _showQuizFeedback && isCorrect;
          final showWrong = _showQuizFeedback && isSelected && !isCorrect;

          Color borderColor = Colors.grey.shade200;
          Color bgColor = Colors.white;
          Color numberBgColor = Colors.grey.shade100;
          Color numberColor = AppTheme.textSub;

          if (isSelected && !_showQuizFeedback) {
            borderColor = AppTheme.primary;
            bgColor = AppTheme.primary.withOpacity(0.05);
            numberBgColor = AppTheme.primary;
            numberColor = Colors.white;
          } else if (showCorrect) {
            borderColor = AppTheme.greenAccent;
            bgColor = AppTheme.greenAccent.withOpacity(0.1);
            numberBgColor = AppTheme.greenAccent;
            numberColor = Colors.white;
          } else if (showWrong) {
            borderColor = Colors.red;
            bgColor = Colors.red.withOpacity(0.1);
            numberBgColor = Colors.red;
            numberColor = Colors.white;
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _showQuizFeedback
                  ? null
                  : () => setState(() => _selectedQuizAnswer = index),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor, width: 2),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: numberBgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: numberColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        quiz.options[index],
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textMain,
                        ),
                      ),
                    ),
                    if (isSelected || showCorrect)
                      Icon(
                        showCorrect
                            ? CupertinoIcons.checkmark_circle_fill
                            : (showWrong ? CupertinoIcons.xmark_circle_fill : CupertinoIcons.checkmark_circle),
                        color: showCorrect ? AppTheme.greenAccent : (showWrong ? Colors.red : AppTheme.primary),
                        size: 26,
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  // ==================== SPEAKING CONTENT ====================
  Widget _buildSpeakingContent(SpeakingExercise exercise) {
    return Column(
      children: [
        Text(
          'SPEAKING PRACTICE',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textSub,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Say this out loud',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppTheme.textMain,
          ),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
          ),
          child: Column(
            children: [
              Text(
                exercise.kannada,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: AppTheme.textMain),
              ),
              const SizedBox(height: 8),
              Text(
                exercise.transliteration,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppTheme.primary),
              ),
              const SizedBox(height: 4),
              Text(
                exercise.english,
                style: TextStyle(fontSize: 16, color: AppTheme.textSub),
              ),
              const SizedBox(height: 16),
              Text(
                '💡 ${exercise.tip}',
                style: TextStyle(fontSize: 14, color: AppTheme.textSub, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        // Mic button
        AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            final scale = 1.0 + (_pulseController.value * 0.1);
            return Stack(
              alignment: Alignment.center,
              children: [
                if (!_hasRecording)
                  Transform.scale(
                    scale: scale,
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.primary.withOpacity(0.15 * (1 - _pulseController.value)),
                      ),
                    ),
                  ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      if (_isRecording) {
                        _isRecording = false;
                        _hasRecording = true;
                      } else {
                        _isRecording = true;
                      }
                    });
                  },
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: _isRecording
                            ? [Colors.red.shade400, Colors.red.shade600]
                            : [AppTheme.primary, AppTheme.primaryDark],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: (_isRecording ? Colors.red : AppTheme.primary).withOpacity(0.4),
                          blurRadius: 20,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Icon(
                      _isRecording ? CupertinoIcons.stop_fill : CupertinoIcons.mic_fill,
                      color: Colors.white,
                      size: 44,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 16),
        Text(
          _isRecording ? 'Recording...' : (_hasRecording ? 'Great job!' : 'Tap to record'),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _isRecording ? AppTheme.primary : AppTheme.textSub,
          ),
        ),
      ],
    );
  }

  // ==================== LISTENING CONTENT ====================
  Widget _buildListeningContent(ListeningExercise exercise) {
    return Column(
      children: [
        Text(
          'LISTENING',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textSub,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'What do you hear?',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppTheme.textMain),
        ),
        const SizedBox(height: 32),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => setState(() => _isPlaying = !_isPlaying),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppTheme.primary,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: AppTheme.primary.withOpacity(0.3), blurRadius: 20)],
            ),
            child: Icon(
              _isPlaying ? CupertinoIcons.pause_fill : CupertinoIcons.play_fill,
              color: Colors.white,
              size: 48,
            ),
          ),
        ),
        const SizedBox(height: 32),
        ...List.generate(exercise.options.length, (index) {
          final isSelected = _selectedQuizAnswer == index;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => setState(() => _selectedQuizAnswer = index),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.primary.withOpacity(0.05) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? AppTheme.primary : Colors.grey.shade200,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? AppTheme.primary : Colors.grey.shade300,
                          width: 2,
                        ),
                        color: isSelected ? AppTheme.primary : Colors.transparent,
                      ),
                      child: isSelected
                          ? const Center(child: Icon(Icons.check, color: Colors.white, size: 16))
                          : null,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        exercise.options[index],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textMain),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  // ==================== READING CONTENT ====================
  Widget _buildReadingContent(ReadingExercise exercise) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'READING',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSub, letterSpacing: 1),
        ),
        const SizedBox(height: 12),
        Text(
          'Read and answer',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppTheme.textMain),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 4, height: 120, decoration: BoxDecoration(color: AppTheme.primary, borderRadius: BorderRadius.circular(2))),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.kannadaText,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppTheme.textMain, height: 1.6),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '💡 ${exercise.hint}',
                      style: TextStyle(fontSize: 13, color: AppTheme.textSub, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          exercise.question,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.textMain),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _readingAnswerController.text.isNotEmpty ? AppTheme.primary : Colors.grey.shade200, width: 2),
          ),
          child: TextField(
            controller: _readingAnswerController,
            maxLines: 3,
            onChanged: (v) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Type your answer...',
              hintStyle: TextStyle(color: Colors.grey.shade400),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
            style: TextStyle(fontSize: 16, color: AppTheme.textMain),
          ),
        ),
      ],
    );
  }

  // ==================== FOOTER ====================
  Widget _buildFooter() {
    bool canProceed = false;
    bool showFeedback = false;
    bool isCorrect = false;
    String? explanation;

    final content = _currentContent;

    if (content is VocabWord) {
      canProceed = true;
      showFeedback = true;
    } else if (content is QuizQuestion) {
      canProceed = _selectedQuizAnswer != null;
      showFeedback = _showQuizFeedback;
      isCorrect = _selectedQuizAnswer == content.correctIndex;
      explanation = content.explanation;
    } else if (content is SpeakingExercise) {
      canProceed = _hasRecording;
      showFeedback = _hasRecording;
      isCorrect = true;
    } else if (content is ListeningExercise) {
      canProceed = _selectedQuizAnswer != null;
      showFeedback = _showQuizFeedback;
      isCorrect = _selectedQuizAnswer == content.correctIndex;
    } else if (content is ReadingExercise) {
      canProceed = _readingAnswerController.text.trim().isNotEmpty;
      showFeedback = _showReadingFeedback;
      isCorrect = _readingAnswerController.text.toLowerCase().contains(content.expectedAnswer.toLowerCase());
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        border: Border(top: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showFeedback && content is! VocabWord && content is! SpeakingExercise)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isCorrect ? AppTheme.greenAccent.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(
                    isCorrect ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.xmark_circle_fill,
                    color: isCorrect ? AppTheme.greenAccent : Colors.red,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isCorrect ? 'Correct!' : 'Not quite',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: isCorrect ? Colors.green.shade800 : Colors.red.shade800,
                          ),
                        ),
                        if (explanation != null)
                          Text(
                            explanation,
                            style: TextStyle(fontSize: 14, color: isCorrect ? Colors.green.shade700 : Colors.red.shade700),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: canProceed
                ? () {
                    if (content is QuizQuestion && !_showQuizFeedback) {
                      setState(() => _showQuizFeedback = true);
                    } else if (content is ListeningExercise && !_showQuizFeedback) {
                      setState(() => _showQuizFeedback = true);
                    } else if (content is ReadingExercise && !_showReadingFeedback) {
                      setState(() => _showReadingFeedback = true);
                    } else {
                      _nextStep();
                    }
                  }
                : null,
            child: Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: canProceed
                    ? (showFeedback && isCorrect && content is! VocabWord ? AppTheme.greenAccent : AppTheme.primary)
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
                boxShadow: canProceed
                    ? [BoxShadow(color: AppTheme.primary.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))]
                    : null,
              ),
              child: Center(
                child: Text(
                  content is VocabWord
                      ? 'GOT IT'
                      : (showFeedback ? (_currentStep == _contentItems.length - 1 ? 'FINISH' : 'CONTINUE') : 'CHECK'),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: canProceed ? Colors.white : Colors.grey.shade400,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
