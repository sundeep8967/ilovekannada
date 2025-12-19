import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';

class ListeningScreen extends StatefulWidget {
  const ListeningScreen({super.key});

  @override
  State<ListeningScreen> createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  int? _selectedAnswer;
  bool _isPlaying = false;
  double _playbackSpeed = 1.0;
  double _progress = 0.45;
  bool _showFeedback = false;
  final int _correctAnswer = 1;

  final List<String> _options = [
    'Nanu ondu pustakavannu odu-tiddene',
    'Nanu ondu pustakavannu barediddene',
    'Nanu ondu pustakavannu nod-tiddene',
  ];

  void _togglePlay() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _changeSpeed() {
    setState(() {
      if (_playbackSpeed == 1.0) {
        _playbackSpeed = 0.75;
      } else if (_playbackSpeed == 0.75) {
        _playbackSpeed = 0.5;
      } else {
        _playbackSpeed = 1.0;
      }
    });
  }

  void _checkAnswer() {
    if (_selectedAnswer != null) {
      setState(() {
        _showFeedback = true;
      });
    }
  }

  void _nextQuestion() {
    Navigator.pop(context);
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
                child: Column(
                  children: [
                    _buildQuestionSection(),
                    const SizedBox(height: 24),
                    _buildAudioPlayer(),
                    const SizedBox(height: 32),
                    _buildAnswerOptions(),
                  ],
                ),
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
                value: 0.45,
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
                '2',
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

  Widget _buildQuestionSection() {
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
      ],
    );
  }

  Widget _buildAudioPlayer() {
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
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Waveform visualization
          _buildWaveform(),
          const SizedBox(height: 20),
          // Progress slider
          Row(
            children: [
              Text(
                '0:12',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSub,
                ),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 4,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                  ),
                  child: Slider(
                    value: _progress,
                    onChanged: (v) => setState(() => _progress = v),
                    activeColor: AppTheme.primary,
                    inactiveColor: Colors.grey.shade200,
                  ),
                ),
              ),
              Text(
                '0:28',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSub,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Play button
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _togglePlay,
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
                    offset: const Offset(0, 4),
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
          const SizedBox(height: 16),
          // Speed button
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _changeSpeed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(CupertinoIcons.speedometer, color: AppTheme.primary, size: 18),
                const SizedBox(width: 6),
                Text(
                  '${_playbackSpeed}x Speed',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primary,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaveform() {
    final heights = [20.0, 30.0, 40.0, 25.0, 15.0];
    final opacities = [0.4, 0.6, 1.0, 0.8, 0.5];

    return SizedBox(
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(heights.length, (i) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 6,
            height: _isPlaying ? heights[i] * 1.3 : heights[i],
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(opacities[i]),
              borderRadius: BorderRadius.circular(3),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildAnswerOptions() {
    return Column(
      children: List.generate(_options.length, (index) {
        final isSelected = _selectedAnswer == index;
        final isCorrect = index == _correctAnswer;
        final showCorrect = _showFeedback && isCorrect;
        final showWrong = _showFeedback && isSelected && !isCorrect;

        Color borderColor = Colors.grey.shade200;
        Color bgColor = Colors.white;

        if (isSelected && !_showFeedback) {
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
            onPressed: _showFeedback
                ? null
                : () {
                    setState(() {
                      _selectedAnswer = index;
                    });
                  },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor, width: 2),
              ),
              child: Row(
                children: [
                  // Radio button
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected || showCorrect
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
                  // Option text
                  Expanded(
                    child: Text(
                      _options[index],
                      style: TextStyle(
                        fontSize: 16,
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

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        border: Border(top: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_showFeedback)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _selectedAnswer == _correctAnswer
                    ? AppTheme.greenAccent.withOpacity(0.1)
                    : Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(
                    _selectedAnswer == _correctAnswer
                        ? CupertinoIcons.checkmark_circle_fill
                        : CupertinoIcons.xmark_circle_fill,
                    color: _selectedAnswer == _correctAnswer
                        ? AppTheme.greenAccent
                        : Colors.red,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _selectedAnswer == _correctAnswer ? 'Correct!' : 'Not quite!',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: _selectedAnswer == _correctAnswer
                                ? Colors.green.shade800
                                : Colors.red.shade800,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'The sentence means "I am writing a book"',
                          style: TextStyle(
                            fontSize: 14,
                            color: _selectedAnswer == _correctAnswer
                                ? Colors.green.shade700
                                : Colors.red.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _selectedAnswer == null
                ? null
                : (_showFeedback ? _nextQuestion : _checkAnswer),
            child: Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: _selectedAnswer == null
                    ? Colors.grey.shade200
                    : (_showFeedback
                        ? (_selectedAnswer == _correctAnswer ? AppTheme.greenAccent : AppTheme.primary)
                        : AppTheme.primary),
                borderRadius: BorderRadius.circular(16),
                boxShadow: _selectedAnswer != null
                    ? [
                        BoxShadow(
                          color: AppTheme.primary.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Center(
                child: Text(
                  _showFeedback ? 'CONTINUE' : 'CHECK ANSWER',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: _selectedAnswer == null ? Colors.grey.shade400 : Colors.white,
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
