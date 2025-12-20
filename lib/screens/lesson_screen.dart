import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'; // for listEquals
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/lesson_models.dart';
import '../services/progress_service.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';

enum LessonStepType { intro, matching, quiz, speaking, listening, assemble, typeInput, grammar, summary }

class LessonStep {
  final LessonStepType type;
  final String title;
  final String? question;
  final Word? word; 
  final List<String>? options;
  final dynamic correctAnswer;
  final int? correctIndex;
  final List<Map<String, String>>? matchPairs;
  final List<String>? correctOrder;
  final String? feedback;

  LessonStep({
    required this.type,
    required this.title,
    this.question,
    this.word,
    this.options,
    this.correctAnswer,
    this.correctIndex,
    this.matchPairs,
    this.correctOrder,
    this.feedback,
  });

  factory LessonStep.fromJson(Map<String, dynamic> json) {
    LessonStepType getType(String t) {
      return LessonStepType.values.firstWhere((e) => e.name == t, orElse: () => LessonStepType.intro);
    }

    Word? parseWord(Map<String, dynamic>? wordJson) {
      if (wordJson == null) return null;
      return Word(
        kannada: wordJson['kannada'] ?? '',
        english: wordJson['english'] ?? '',
        pronunciation: wordJson['pronunciation'] ?? '',
      );
    }

    return LessonStep(
      type: getType(json['type']),
      title: json['title'] ?? 'Lesson',
      question: json['question'],
      word: parseWord(json['word']),
      options: json['options'] != null ? List<String>.from(json['options']) : null,
      correctAnswer: json['correctAnswer'],
      correctIndex: json['correctIndex'],
      matchPairs: json['matchPairs'] != null ? List<Map<String, String>>.from(json['matchPairs'].map((x) => Map<String, String>.from(x))) : null,
      correctOrder: json['correctOrder'] != null ? List<String>.from(json['correctOrder']) : null,
      feedback: json['feedback'],
    );
  }
}

class LessonScreen extends StatefulWidget {
  final Lesson lesson;
  const LessonScreen({super.key, required this.lesson});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> with TickerProviderStateMixin {
  List<LessonStep> _steps = [];
  int _currentStepIndex = 0;
  bool _isLoading = true;
  String? _error;

  // State for specific steps
  int? _selectedAnswer;
  int? _listeningAnswer;
  bool _showFeedback = false;
  bool _isAnswerCorrect = false;
  bool _hasRecorded = false;
  
  // Matching state
  List<String> _matchKannada = [];
  List<String> _matchEnglish = [];
  Set<int> _matchedKannada = {};
  Set<int> _matchedEnglish = {};
  int? _selectedKannadaIndex;
  int? _selectedEnglishIndex;
  
  // Assemble state
  List<String> _assembledWords = [];
  
  // TypeInput state
  String _typedInput = '';

  @override
  void initState() {
    super.initState();
    _loadLessonData();
  }

  Future<void> _loadLessonData() async {
    try {
      // Logic to pick correct file based on lesson ID
      // Defaulting to our new JSON file for Unit 1 Lesson 1
      String assetPath = 'assets/data/lesson_u1_l1.json';
       if (widget.lesson.id == 'u1_l1') {
         assetPath = 'assets/data/lesson_u1_l1.json';
       } else if (widget.lesson.id == 'u1_l2') {
         assetPath = 'assets/data/lesson_u1_l2.json';
       } else if (widget.lesson.id == 'u1_l3') {
         assetPath = 'assets/data/lesson_u1_l3.json';
       } else if (widget.lesson.id == 'u1_l4') {
         assetPath = 'assets/data/lesson_u1_l4.json';
       } else if (widget.lesson.id == 'u1_l5') {
         assetPath = 'assets/data/lesson_u1_l5.json';
       } else if (widget.lesson.id == 'u2_l1') {
         assetPath = 'assets/data/lesson_u2_l1.json';
       } else if (widget.lesson.id == 'u2_l2') {
         assetPath = 'assets/data/lesson_u2_l2.json';
       } else if (widget.lesson.id == 'u2_l3') {
         assetPath = 'assets/data/lesson_u2_l3.json';
       } else if (widget.lesson.id == 'u2_l4') {
         assetPath = 'assets/data/lesson_u2_l4.json';
       } else if (widget.lesson.id == 'u2_l5') {
         assetPath = 'assets/data/lesson_u2_l5.json';
       } else if (widget.lesson.id == 'u3_l1') {
         assetPath = 'assets/data/lesson_u3_l1.json';
       } else if (widget.lesson.id == 'u3_l2') {
         assetPath = 'assets/data/lesson_u3_l2.json';
       } else if (widget.lesson.id == 'u3_l3') {
         assetPath = 'assets/data/lesson_u3_l3.json';
       } else if (widget.lesson.id == 'u3_l4') {
         assetPath = 'assets/data/lesson_u3_l4.json';
       } else if (widget.lesson.id == 'u3_l5') {
         assetPath = 'assets/data/lesson_u3_l5.json';
       } else if (widget.lesson.id == 'u3_l6') {
         assetPath = 'assets/data/lesson_u3_l6.json';
       } else if (widget.lesson.id == 'u3_l7') {
         assetPath = 'assets/data/lesson_u3_l7.json';
       } else if (widget.lesson.id == 'u3_l9') {
         assetPath = 'assets/data/lesson_u3_l9.json';
       } else if (widget.lesson.id == 'u3_l10') {
         assetPath = 'assets/data/lesson_u3_l10.json';
       } else {
         // Fallback default
         assetPath = 'assets/data/lesson_u1_l1.json';
       }

      final String jsonString = await rootBundle.loadString(assetPath);
      final Map<String, dynamic> data = json.decode(jsonString);
      
      final List<dynamic> stepsJson = data['steps'] ?? [];
      final List<LessonStep> loadedSteps = stepsJson.map((s) => LessonStep.fromJson(s)).toList();

      setState(() {
        _steps = loadedSteps;
        _isLoading = false;
      });
      
      // Setup initial step state
      if (_steps.isNotEmpty) {
        _setupStep(_steps[0]);
      }
      
    } catch (e) {
      if (kDebugMode) print("Error loading lesson: $e");
      setState(() {
        _error = "Could not load lesson content. $e";
        _isLoading = false;
      });
    }
  }

  void _setupStep(LessonStep step) {
    _resetStepState();
    
    // Specific setup per type
    if (step.type == LessonStepType.matching) {
       _setupMatching(step);
    }
    
    // Auto-audio for intro/words
    if (step.word != null && (step.type == LessonStepType.intro || step.type == LessonStepType.speaking)) {
      AudioService.speak(step.word!.kannada);
    }
  }

  void _setupMatching(LessonStep step) {
    final pairs = step.matchPairs ?? [];
    if (pairs.isEmpty) return;
    
    _matchKannada = pairs.map((p) => p['kannada']!).toList()..shuffle();
    _matchEnglish = pairs.map((p) => p['english']!).toList()..shuffle();
  }

  void _resetStepState() {
    _selectedAnswer = null;
    _listeningAnswer = null;
    _showFeedback = false;
    _isAnswerCorrect = false;
    _hasRecorded = false;
    _matchedKannada = {};
    _matchedEnglish = {};
    _selectedKannadaIndex = null;
    _selectedEnglishIndex = null;
    _assembledWords = [];
    _typedInput = '';
  }

  void _nextStep() {
    if (_currentStepIndex < _steps.length - 1) {
      setState(() {
        _currentStepIndex++;
        _setupStep(_steps[_currentStepIndex]);
      });
    } else {
      _completeLesson();
    }
  }

  void _completeLesson() async {
    // Play sound?
    // AudioService.playFinish(); 
    await ProgressService.markLessonCompleted(widget.lesson.id, widget.lesson.xpReward);
    if (mounted) Navigator.pop(context, true);
  }

  double get _progress => _steps.isEmpty ? 0 : (_currentStepIndex + 1) / _steps.length;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.backgroundLight,
      child: SafeArea(
        child: _isLoading 
            ? const Center(child: CupertinoActivityIndicator())
            : _error != null 
                ? Center(child: Text(_error!)) 
                : Column(
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
    if (_steps.isEmpty) return const SizedBox();
    final step = _steps[_currentStepIndex];
    
    switch (step.type) {
      case LessonStepType.intro: return _buildVocabCard(step);
      case LessonStepType.matching: return _buildMatching(step);
      case LessonStepType.quiz: return _buildQuiz(step);
      case LessonStepType.speaking: return _buildSpeaking(step);
      case LessonStepType.listening: return _buildListening(step);
      case LessonStepType.assemble: return _buildAssemble(step);

      case LessonStepType.typeInput: return _buildTypeInput(step);
      case LessonStepType.grammar: return _buildGrammar(step);
      case LessonStepType.summary: return _buildSummary(step);
    }
  }

  // ==================== INTRO ====================
  Widget _buildVocabCard(LessonStep step) {
    if (step.word == null) return const SizedBox();
    final word = step.word!;
    return Column(
      children: [
        Text(step.title.toUpperCase(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSub, letterSpacing: 1)),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20)],
          ),
          child: Column(
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => AudioService.speak(word.kannada),
                child: Container(
                  width: 60, height: 60,
                  decoration: BoxDecoration(color: AppTheme.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
                  child: const Icon(CupertinoIcons.volume_up, color: AppTheme.primary, size: 28),
                ),
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

  // ==================== MATCHING ====================
  Widget _buildMatching(LessonStep step) {
     final pairs = step.matchPairs ?? [];
     final allMatched = _matchedKannada.length == _matchKannada.length && _matchKannada.isNotEmpty;
     
     if (pairs.isEmpty) return const Text("No pairs defined");

     return Column(
       children: [
         Text(step.title.toUpperCase(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSub, letterSpacing: 1)),
         const SizedBox(height: 16),
         Text('Tap Kannada, then match English', style: TextStyle(fontSize: 14, color: AppTheme.textSub)),
         const SizedBox(height: 24),
         
         ...List.generate(_matchKannada.length, (i) {
           final kannadaMatched = _matchedKannada.contains(i);
           final englishMatched = _matchedEnglish.contains(i);
           final kSelected = _selectedKannadaIndex == i;
           final eSelected = _selectedEnglishIndex == i;
           
           return Padding(
             padding: const EdgeInsets.only(bottom: 10),
             child: Row(
               children: [
                 // Kannada Side
                 Expanded(
                   child: CupertinoButton(
                     padding: EdgeInsets.zero,
                     onPressed: kannadaMatched ? null : () => _selectKannada(i, step),
                     child: Container(
                       height: 50,
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         color: kannadaMatched ? AppTheme.greenAccent.withValues(alpha: 0.2) : (kSelected ? AppTheme.primary.withValues(alpha: 0.1) : Colors.white),
                         borderRadius: BorderRadius.circular(12),
                         border: Border.all(color: kannadaMatched ? AppTheme.greenAccent : (kSelected ? AppTheme.primary : Colors.grey.shade300), width: 2),
                       ),
                       child: Text(_matchKannada[i], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: kannadaMatched ? AppTheme.greenAccent : AppTheme.textMain)),
                     ),
                   ),
                 ),
                 const SizedBox(width: 12),
                 // English Side
                 Expanded(
                   child: CupertinoButton(
                     padding: EdgeInsets.zero,
                     onPressed: englishMatched ? null : () => _selectEnglish(i, step),
                     child: Container(
                       height: 50,
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         color: englishMatched ? AppTheme.greenAccent.withValues(alpha: 0.2) : (eSelected ? AppTheme.primary.withValues(alpha: 0.1) : Colors.white),
                         borderRadius: BorderRadius.circular(12),
                         border: Border.all(color: englishMatched ? AppTheme.greenAccent : (eSelected ? AppTheme.primary : Colors.grey.shade300), width: 2),
                       ),
                       child: Text(_matchEnglish[i], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: englishMatched ? AppTheme.greenAccent : AppTheme.textMain)),
                     ),
                   ),
                 ),
               ],
             ),
           );
         }),
         
         if (allMatched) ...[
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppTheme.greenAccent.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                   const Icon(CupertinoIcons.checkmark_circle_fill, color: AppTheme.greenAccent, size: 28),
                   const SizedBox(width: 12),
                   Text('All pairs matched!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.greenAccent)),
                ],
              ),
            ),
         ]
       ],
     );
  }

  void _selectKannada(int index, LessonStep step) {
    setState(() => _selectedKannadaIndex = index);
    _checkMatch(step);
  }

  void _selectEnglish(int index, LessonStep step) {
    setState(() => _selectedEnglishIndex = index);
    _checkMatch(step);
  }

  void _checkMatch(LessonStep step) {
    if (_selectedKannadaIndex != null && _selectedEnglishIndex != null) {
      final kText = _matchKannada[_selectedKannadaIndex!];
      final eText = _matchEnglish[_selectedEnglishIndex!];
      
      // Verify match using canonical map
      final pairs = step.matchPairs ?? [];
      bool isMatch = false;
      for (var p in pairs) {
        if (p['kannada'] == kText && p['english'] == eText) {
          isMatch = true;
          break;
        }
      }
      
      if (isMatch) {
        setState(() {
          _matchedKannada.add(_selectedKannadaIndex!);
          _matchedEnglish.add(_selectedEnglishIndex!);
          _selectedKannadaIndex = null;
          _selectedEnglishIndex = null;
        });
        AudioService.playCorrect();
      } else {
        AudioService.playIncorrect();
        // Reset selection automatically after short delay
        Future.delayed(const Duration(milliseconds: 500), () {
           if (mounted) setState(() {
             _selectedKannadaIndex = null;
             _selectedEnglishIndex = null;
           });
        });
      }
    }
  }

  // ==================== QUIZ ====================
  Widget _buildQuiz(LessonStep step) {
    final options = step.options ?? [];
    return Column(
      children: [
        Text(step.title.toUpperCase(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSub, letterSpacing: 1)),
        const SizedBox(height: 24),
        Text(step.question ?? '', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: AppTheme.textMain), textAlign: TextAlign.center),
        const SizedBox(height: 32),
        ...List.generate(options.length, (i) {
          final isSelected = _selectedAnswer == i;
          final isCorrect = i == step.correctIndex;
          final showResult = _showFeedback;
          
          Color bgColor = Colors.white;
          Color borderColor = Colors.grey.shade200;
          Color textColor = AppTheme.textMain;
          
          if (showResult) {
            if (isCorrect) {
               bgColor = AppTheme.greenAccent.withValues(alpha: 0.1);
               borderColor = AppTheme.greenAccent;
               textColor = AppTheme.greenAccent;
            } else if (isSelected) {
               bgColor = Colors.red.withValues(alpha: 0.1);
               borderColor = Colors.red;
               textColor = Colors.red;
            }
          } else if (isSelected) {
             bgColor = AppTheme.primary.withValues(alpha: 0.05);
             borderColor = AppTheme.primary;
             textColor = AppTheme.primary;
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: showResult ? null : () => setState(() => _selectedAnswer = i),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor, width: 2),
                ),
                child: Text(options[i], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textColor), textAlign: TextAlign.center),
              ),
            ),
          );
        }),
      ],
    );
  }

  // ==================== LISTENING ====================
  Widget _buildListening(LessonStep step) {
     final options = step.options ?? [];
     return Column(
       children: [
        Text(step.title.toUpperCase(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSub, letterSpacing: 1)),
        const SizedBox(height: 24),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
             if (step.word != null) AudioService.speak(step.word!.kannada);
             else AudioService.speak(step.question ?? "Listen");
          },
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(color: AppTheme.primary, borderRadius: BorderRadius.circular(24)),
            child: const Icon(CupertinoIcons.speaker_2_fill, color: Colors.white, size: 40),
          ),
        ),
        const SizedBox(height: 32),
         ...List.generate(options.length, (i) {
           final isSelected = _listeningAnswer == i;
           final isCorrect = i == step.correctIndex;
           final showResult = _showFeedback;
           
           return Padding(
             padding: const EdgeInsets.only(bottom: 12),
             child: CupertinoButton(
               padding: EdgeInsets.zero,
               onPressed: showResult ? null : () => setState(() => _listeningAnswer = i),
               child: Container(
                 padding: const EdgeInsets.all(16),
                 decoration: BoxDecoration(
                   color: isSelected ? AppTheme.primary.withValues(alpha: 0.05) : Colors.white,
                   borderRadius: BorderRadius.circular(16),
                   border: Border.all(color: (showResult && isCorrect) ? AppTheme.greenAccent : (isSelected ? AppTheme.primary : Colors.grey.shade200), width: 2),
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
                     Expanded(child: Text(options[i], style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: AppTheme.textMain))),
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
  Widget _buildSpeaking(LessonStep step) {
    if (step.word == null) return const SizedBox();
    return Column(
      children: [
         Text(step.title.toUpperCase(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSub, letterSpacing: 1)),
         const SizedBox(height: 40),
         Container(
           padding: const EdgeInsets.all(40),
           decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.grey.shade100, width: 2)),
           child: const Icon(CupertinoIcons.mic_fill, size: 60, color: AppTheme.primary),
         ),
         const SizedBox(height: 30),
         Text('Say "${step.word!.kannada}"', style: TextStyle(fontSize: 20, color: AppTheme.textSub), textAlign: TextAlign.center),
         const SizedBox(height: 40),
         CupertinoButton(
           child: Container(
             padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
             decoration: BoxDecoration(color: _hasRecorded ? AppTheme.greenAccent : AppTheme.primary, borderRadius: BorderRadius.circular(30)),
             child: Text(_hasRecorded ? 'Recorded!' : 'Tap to Record', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
           ),
           onPressed: () {
             setState(() => _hasRecorded = true);
           },
         ),
      ],
    );
  }

  // ==================== ASSEMBLE ====================
  Widget _buildAssemble(LessonStep step) {
    final options = step.options ?? [];
    
    return Column(
      children: [
        Text(step.title.toUpperCase(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSub, letterSpacing: 1)),
        const SizedBox(height: 16),
        Text(step.question ?? "Form the sentence", style: TextStyle(fontSize: 18, color: AppTheme.textMain), textAlign: TextAlign.center),
        const SizedBox(height: 32),
        
        // Assembled Area
        Container(
          width: double.infinity,
          height: 80,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 2))),
          child: Wrap(
            spacing: 8, runSpacing: 8,
            children: _assembledWords.map((word) => GestureDetector(
              onTap: () {
                 if(!_showFeedback) setState(() => _assembledWords.remove(word));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade300)),
                child: Text(word, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            )).toList(),
          ),
        ),
        const SizedBox(height: 32),
        
        // Options Area
        Wrap(
          spacing: 12, runSpacing: 12,
          alignment: WrapAlignment.center,
          children: options.map((word) {
            final isUsed = _assembledWords.contains(word);
            return Opacity(
              opacity: isUsed ? 0.0 : 1.0, 
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: isUsed || _showFeedback ? null : () => setState(() => _assembledWords.add(word)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300, width: 1.5),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))],
                  ),
                  child: Text(word, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textMain)),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // ==================== TYPE INPUT ====================
  Widget _buildTypeInput(LessonStep step) {
     return Column(
       children: [
        Text(step.title.toUpperCase(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSub, letterSpacing: 1)),
        const SizedBox(height: 24),
        Text(step.question ?? "Type the answer", style: TextStyle(fontSize: 18, color: AppTheme.textMain), textAlign: TextAlign.center),
        const SizedBox(height: 32),
        
        CupertinoTextField(
          placeholder: "Type here...",
          padding: const EdgeInsets.all(16),
          style: TextStyle(fontSize: 18, color: AppTheme.textMain),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade300)),
          onChanged: (val) {
             if (!_showFeedback) setState(() => _typedInput = val);
          },
          readOnly: _showFeedback,
        ),
       ],
     );
  }

  // ==================== GRAMMAR ====================
  Widget _buildGrammar(LessonStep step) {
    return Column(
      children: [
        Text(step.title.toUpperCase(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSub, letterSpacing: 1)),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade200)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   const Icon(CupertinoIcons.lightbulb_fill, color: Colors.amber, size: 28),
                   const SizedBox(width: 12),
                   Text(step.question ?? "Tip", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppTheme.textMain)),
                ],
              ),
              const SizedBox(height: 16),
              Text(step.feedback ?? "", style: const TextStyle(fontSize: 16, height: 1.5, color: AppTheme.textMain)),
            ],
          ),
        ),
      ],
    );
  }

  // ==================== SUMMARY ====================
  Widget _buildSummary(LessonStep step) {
    final points = step.options ?? [];
    return Column(
      children: [
         const Icon(CupertinoIcons.check_mark_circled_solid, color: AppTheme.greenAccent, size: 80),
         const SizedBox(height: 24),
         Text(step.title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: AppTheme.textMain)),
         const SizedBox(height: 8),
         Text(step.question ?? "Great job!", style: TextStyle(fontSize: 18, color: AppTheme.textSub)),
         const SizedBox(height: 32),
         Container(
           padding: const EdgeInsets.all(20),
           decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
           child: Column(
             children: points.map((p) => Padding(
               padding: const EdgeInsets.symmetric(vertical: 8),
               child: Row(
                 children: [
                   const Icon(CupertinoIcons.star_fill, color: Colors.amber, size: 16),
                   const SizedBox(width: 12),
                   Expanded(child: Text(p, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textMain))),
                 ],
               ),
             )).toList(),
           ),
         ),
      ],
    );
  }

  // ==================== FOOTER ====================
  Widget _buildFooter() {
    final step = _steps.isEmpty ? null : _steps[_currentStepIndex];
    if (step == null) return const SizedBox();

    bool canProceed = false;
    String buttonText = 'CHECK';

    // Logic for button state
    if (step.type == LessonStepType.intro || step.type == LessonStepType.grammar || step.type == LessonStepType.summary) {
      canProceed = true;
      buttonText = step.type == LessonStepType.summary ? 'FINISH' : 'GOT IT';
    } else if (step.type == LessonStepType.matching) {
       canProceed = _matchedKannada.length == _matchKannada.length && _matchKannada.isNotEmpty;
       buttonText = 'CONTINUE';
    } else if (step.type == LessonStepType.speaking) {
       canProceed = _hasRecorded;
       buttonText = 'CONTINUE';
    } else {
       // Quiz, Listening, Assemble, TypeInput
       if (_showFeedback) {
          canProceed = true;
          buttonText = 'CONTINUE';
          if (_currentStepIndex == _steps.length - 1) buttonText = 'FINISH';
       } else {
          // Check enable condition
          if (step.type == LessonStepType.quiz) canProceed = _selectedAnswer != null;
          if (step.type == LessonStepType.listening) canProceed = _listeningAnswer != null;
          if (step.type == LessonStepType.assemble) canProceed = _assembledWords.isNotEmpty;
          if (step.type == LessonStepType.typeInput) canProceed = _typedInput.trim().isNotEmpty;
          buttonText = 'CHECK';
       }
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppTheme.backgroundLight, border: Border(top: BorderSide(color: Colors.grey.shade100))),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: canProceed ? () => _handleFooterAction(step) : null,
        child: Container(
          width: double.infinity, height: 56,
          decoration: BoxDecoration(
            color: canProceed 
                 ? (_showFeedback && _isAnswerCorrect ? AppTheme.greenAccent : (_showFeedback && !_isAnswerCorrect ? Colors.orange : AppTheme.primary)) 
                 : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(child: Text(buttonText, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: canProceed ? Colors.white : Colors.grey.shade400, letterSpacing: 1))),
        ),
      ),
    );
  }

  void _handleFooterAction(LessonStep step) {
    // Intro/Matching/Speaking/Grammar/Summary just proceed
    if (step.type == LessonStepType.intro || step.type == LessonStepType.matching || step.type == LessonStepType.speaking || step.type == LessonStepType.grammar || step.type == LessonStepType.summary) {
       _nextStep();
       return;
    }
    
    // Others have Check -> Feedback -> Continue flow
    if (_showFeedback) {
       // Move next
       _nextStep();
    } else {
       // Validate
       _checkAnswer(step);
    }
  }

  void _checkAnswer(LessonStep step) {
    bool correct = false;
    
    if (step.type == LessonStepType.quiz) {
       if (step.correctIndex != null) {
          correct = _selectedAnswer == step.correctIndex;
       } else if (step.correctAnswer != null && step.options != null) {
          // Resolve string answer to index
          final correctStr = step.correctAnswer.toString();
          final index = step.options!.indexOf(correctStr);
          if (index != -1) {
             correct = _selectedAnswer == index;
          }
       }
    } else if (step.type == LessonStepType.listening) {
       if (step.correctIndex != null) {
          correct = _listeningAnswer == step.correctIndex;
       } else if (step.correctAnswer != null && step.options != null) {
          final correctStr = step.correctAnswer.toString();
          final index = step.options!.indexOf(correctStr);
          if (index != -1) {
             correct = _listeningAnswer == index;
          }
       }
    } else if (step.type == LessonStepType.assemble) {
       if (step.correctOrder != null) {
          correct = listEquals(_assembledWords, step.correctOrder!);
       }
    } else if (step.type == LessonStepType.typeInput) {
       if (step.correctAnswer != null) {
          final input = _typedInput.trim().toLowerCase();
          if (step.correctAnswer is List) {
             correct = (step.correctAnswer as List).any((ans) => ans.toString().toLowerCase() == input);
          } else {
             correct = input == step.correctAnswer.toString().toLowerCase();
          }
       }
    }
    
    setState(() {
      _isAnswerCorrect = correct;
      _showFeedback = true;
    });
    
    if (correct) {
       AudioService.playCorrect();
    } else {
       AudioService.playIncorrect();
    }
  }
}
