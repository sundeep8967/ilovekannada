import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';

enum LessonType { quiz, speaking, listening, reading }

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> with SingleTickerProviderStateMixin {
  int _currentStep = 0;
  final int _totalSteps = 4;
  
  // Current lesson type based on step
  LessonType get _currentType {
    switch (_currentStep) {
      case 0: return LessonType.quiz;
      case 1: return LessonType.speaking;
      case 2: return LessonType.listening;
      case 3: return LessonType.reading;
      default: return LessonType.quiz;
    }
  }

  double get _progress => (_currentStep + 0.5) / _totalSteps;

  // Quiz state
  int? _selectedQuizAnswer;
  bool _showQuizFeedback = false;
  final int _correctQuizAnswer = 1;
  final List<String> _quizOptions = ['Dhanyavaada', 'Namaskara', 'Shubhodaya'];

  // Speaking state
  bool _isRecording = false;
  bool _hasRecording = false;
  late AnimationController _pulseController;

  // Listening state
  int? _selectedListeningAnswer;
  bool _showListeningFeedback = false;
  bool _isPlaying = false;
  double _playbackSpeed = 1.0;
  final int _correctListeningAnswer = 1;
  final List<String> _listeningOptions = [
    'Nanu ondu pustakavannu odu-tiddene',
    'Nanu ondu pustakavannu barediddene',
    'Nanu ondu pustakavannu nod-tiddene',
  ];

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
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _readingAnswerController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
        // Reset states for next lesson
        _selectedQuizAnswer = null;
        _showQuizFeedback = false;
        _hasRecording = false;
        _isRecording = false;
        _selectedListeningAnswer = null;
        _showListeningFeedback = false;
        _readingAnswerController.clear();
        _showReadingFeedback = false;
      });
    } else {
      // Lesson complete - go back
      Navigator.pop(context);
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
                child: _buildCurrentLesson(),
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

  Widget _buildCurrentLesson() {
    switch (_currentType) {
      case LessonType.quiz:
        return _buildQuizLesson();
      case LessonType.speaking:
        return _buildSpeakingLesson();
      case LessonType.listening:
        return _buildListeningLesson();
      case LessonType.reading:
        return _buildReadingLesson();
    }
  }

  // ==================== QUIZ LESSON ====================
  Widget _buildQuizLesson() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildQuizQuestion(),
        const SizedBox(height: 32),
        _buildQuizIllustration(),
        const SizedBox(height: 32),
        _buildQuizAnswerOptions(),
      ],
    );
  }

  Widget _buildQuizQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'BASIC KANNADA GREETINGS',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textSub,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppTheme.textMain,
              height: 1.3,
            ),
            children: [
              const TextSpan(text: 'Select the correct translation for\n'),
              TextSpan(
                text: '"Hello"',
                style: TextStyle(color: AppTheme.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuizIllustration() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
          const Positioned.fill(
            child: Center(
              child: Text('👋', style: TextStyle(fontSize: 80)),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primary.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(CupertinoIcons.volume_up, color: Colors.white, size: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizAnswerOptions() {
    return Column(
      children: List.generate(_quizOptions.length, (index) {
        final isSelected = _selectedQuizAnswer == index;
        final isCorrect = index == _correctQuizAnswer;
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
                      _quizOptions[index],
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
    );
  }

  // ==================== SPEAKING LESSON ====================
  Widget _buildSpeakingLesson() {
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
          'Read this sentence aloud',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: AppTheme.textMain,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        _buildSpeakingWordCard(),
        const SizedBox(height: 40),
        _buildSpeakingWaveform(),
        const SizedBox(height: 32),
        _buildSpeakingMicSection(),
      ],
    );
  }

  Widget _buildSpeakingWordCard() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppTheme.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(CupertinoIcons.volume_up, color: AppTheme.primary, size: 26),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Namaskara',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: AppTheme.textMain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Hello',
            style: TextStyle(
              fontSize: 18,
              color: AppTheme.textSub,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpeakingWaveform() {
    final heights = [10.0, 16.0, 8.0, 22.0, 14.0, 28.0, 18.0, 24.0, 10.0, 18.0, 12.0];
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: heights.map((h) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: 6,
            height: _isRecording ? h * 1.5 : h,
            decoration: BoxDecoration(
              color: _isRecording ? AppTheme.primary : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSpeakingMicSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _hasRecording ? () {} : null,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _hasRecording ? Colors.grey.shade300 : Colors.grey.shade200,
                    width: 2,
                  ),
                ),
                child: Icon(
                  CupertinoIcons.play_fill,
                  color: _hasRecording ? Colors.grey.shade500 : Colors.grey.shade300,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 24),
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
            const SizedBox(width: 24),
            Opacity(
              opacity: _hasRecording ? 1.0 : 0.0,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: _hasRecording ? () => setState(() { _hasRecording = false; _isRecording = false; }) : null,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                  ),
                  child: Icon(CupertinoIcons.refresh, color: Colors.grey.shade500, size: 24),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          _isRecording ? 'Recording... Tap to stop' : (_hasRecording ? 'Recording complete!' : 'Tap microphone to record'),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _isRecording ? AppTheme.primary : AppTheme.textSub,
          ),
        ),
      ],
    );
  }

  // ==================== LISTENING LESSON ====================
  Widget _buildListeningLesson() {
    return Column(
      children: [
        Text(
          'LISTENING EXERCISE',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textSub,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Listen and select what you hear',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppTheme.textMain,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        _buildListeningAudioPlayer(),
        const SizedBox(height: 32),
        _buildListeningAnswerOptions(),
      ],
    );
  }

  Widget _buildListeningAudioPlayer() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [20.0, 30.0, 40.0, 25.0, 15.0].map((h) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 6,
                  height: _isPlaying ? h * 1.3 : h,
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(_isPlaying ? 1.0 : 0.5),
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => setState(() => _isPlaying = !_isPlaying),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppTheme.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withOpacity(0.3),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Icon(
                _isPlaying ? CupertinoIcons.pause_fill : CupertinoIcons.play_fill,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: 12),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => setState(() {
              _playbackSpeed = _playbackSpeed == 1.0 ? 0.75 : (_playbackSpeed == 0.75 ? 0.5 : 1.0);
            }),
            child: Text(
              '${_playbackSpeed}x Speed',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppTheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListeningAnswerOptions() {
    return Column(
      children: List.generate(_listeningOptions.length, (index) {
        final isSelected = _selectedListeningAnswer == index;
        final isCorrect = index == _correctListeningAnswer;
        final showCorrect = _showListeningFeedback && isCorrect;
        final showWrong = _showListeningFeedback && isSelected && !isCorrect;

        Color borderColor = Colors.grey.shade200;
        Color bgColor = Colors.white;

        if (isSelected && !_showListeningFeedback) {
          borderColor = AppTheme.primary;
          bgColor = AppTheme.primary.withOpacity(0.05);
        } else if (showCorrect) {
          borderColor = AppTheme.greenAccent;
          bgColor = AppTheme.greenAccent.withOpacity(0.1);
        } else if (showWrong) {
          borderColor = Colors.red;
          bgColor = Colors.red.withOpacity(0.1);
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _showListeningFeedback ? null : () => setState(() => _selectedListeningAnswer = index),
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
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected || showCorrect || showWrong
                            ? (showCorrect ? AppTheme.greenAccent : (showWrong ? Colors.red : AppTheme.primary))
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                      color: isSelected || showCorrect || showWrong
                          ? (showCorrect ? AppTheme.greenAccent : (showWrong ? Colors.red : AppTheme.primary))
                          : Colors.transparent,
                    ),
                    child: isSelected || showCorrect || showWrong
                        ? Center(
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      _listeningOptions[index],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textMain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  // ==================== READING LESSON ====================
  Widget _buildReadingLesson() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'READING COMPREHENSION',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textSub,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Read the paragraph and answer the question',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppTheme.textMain,
          ),
        ),
        const SizedBox(height: 24),
        // Reading passage card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 16,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Blue accent line
              Container(
                width: 4,
                height: 180,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'KANNADA',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.primary,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Icon(CupertinoIcons.volume_up, color: AppTheme.textSub, size: 22),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'ನಮಸ್ಕಾರ! ನನ್ನ ಹೆಸರು ರಾಜು. ನಾನು ಬೆಂಗಳೂರಿನಲ್ಲಿ ವಾಸಿಸುತ್ತಿದ್ದೇನೆ. ನನಗೆ ಕ್ರಿಕೆಟ್ ಆಡುವುದು ತುಂಬಾ ಇಷ್ಟ.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textMain,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey.shade100)),
                      ),
                      child: Text(
                        'Hint: He is introducing himself and talking about his hobby.',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: AppTheme.textSub,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Question
        Text(
          'What is Raju\'s favorite hobby?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppTheme.textMain,
          ),
        ),
        const SizedBox(height: 12),
        // Text input
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _readingAnswerController.text.isNotEmpty ? AppTheme.primary : Colors.grey.shade200,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
              ),
            ],
          ),
          child: TextField(
            controller: _readingAnswerController,
            maxLines: 4,
            onChanged: (v) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Type your answer in English...',
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppTheme.textMain,
            ),
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

    switch (_currentType) {
      case LessonType.quiz:
        canProceed = _selectedQuizAnswer != null;
        showFeedback = _showQuizFeedback;
        isCorrect = _selectedQuizAnswer == _correctQuizAnswer;
        break;
      case LessonType.speaking:
        canProceed = _hasRecording;
        showFeedback = _hasRecording;
        isCorrect = true;
        break;
      case LessonType.listening:
        canProceed = _selectedListeningAnswer != null;
        showFeedback = _showListeningFeedback;
        isCorrect = _selectedListeningAnswer == _correctListeningAnswer;
        break;
      case LessonType.reading:
        canProceed = _readingAnswerController.text.trim().isNotEmpty;
        showFeedback = _showReadingFeedback;
        isCorrect = _readingAnswerController.text.toLowerCase().contains('cricket');
        break;
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
          if (showFeedback && _currentType != LessonType.speaking)
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
                    child: Text(
                      isCorrect ? 'Amazing!' : 'Not quite right',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: isCorrect ? Colors.green.shade800 : Colors.red.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: canProceed
                ? () {
                    if (_currentType == LessonType.quiz && !_showQuizFeedback) {
                      setState(() => _showQuizFeedback = true);
                    } else if (_currentType == LessonType.listening && !_showListeningFeedback) {
                      setState(() => _showListeningFeedback = true);
                    } else if (_currentType == LessonType.reading && !_showReadingFeedback) {
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
                    ? (showFeedback && isCorrect ? AppTheme.greenAccent : AppTheme.primary)
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
                boxShadow: canProceed
                    ? [BoxShadow(color: AppTheme.primary.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))]
                    : null,
              ),
              child: Center(
                child: Text(
                  showFeedback || _currentType == LessonType.speaking
                      ? (_currentStep == _totalSteps - 1 ? 'FINISH' : 'CONTINUE')
                      : 'CHECK ANSWER',
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
