import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';

class SpeakingScreen extends StatefulWidget {
  const SpeakingScreen({super.key});

  @override
  State<SpeakingScreen> createState() => _SpeakingScreenState();
}

class _SpeakingScreenState extends State<SpeakingScreen> with SingleTickerProviderStateMixin {
  bool _isRecording = false;
  bool _hasRecording = false;
  late AnimationController _pulseController;

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
    super.dispose();
  }

  void _toggleRecording() {
    setState(() {
      if (_isRecording) {
        _isRecording = false;
        _hasRecording = true;
      } else {
        _isRecording = true;
      }
    });
  }

  void _playRecording() {
    // Play recorded audio
  }

  void _retryRecording() {
    setState(() {
      _hasRecording = false;
      _isRecording = false;
    });
  }

  void _submit() {
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
                    const SizedBox(height: 32),
                    _buildWordCard(),
                    const SizedBox(height: 40),
                    _buildWaveform(),
                    const SizedBox(height: 32),
                    _buildMicrophoneSection(),
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
          // Close button
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
          // Progress bar
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: 0.75,
                minHeight: 12,
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation(AppTheme.primary),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Hearts
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

  Widget _buildQuestionSection() {
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
      ],
    );
  }

  Widget _buildWordCard() {
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
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Gradient top line
          Container(
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.primary.withOpacity(0.3),
                  AppTheme.primary,
                  AppTheme.primary.withOpacity(0.3),
                ],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Audio button
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // Play audio
            },
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
          // Word
          Text(
            'Namaskara',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: AppTheme.textMain,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          // Translation
          Text(
            'Hello',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppTheme.textSub,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaveform() {
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

  Widget _buildMicrophoneSection() {
    return Column(
      children: [
        // Control buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Play button
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _hasRecording ? _playRecording : null,
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
            // Microphone button
            AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                final scale = 1.0 + (_pulseController.value * 0.1);
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // Pulsing ring
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
                    // Main button
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: _toggleRecording,
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
            // Retry button
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _hasRecording ? _retryRecording : null,
              child: Opacity(
                opacity: _hasRecording ? 1.0 : 0.0,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                  ),
                  child: Icon(
                    CupertinoIcons.refresh,
                    color: Colors.grey.shade500,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Hint text
        Text(
          _isRecording
              ? 'Recording... Tap to stop'
              : (_hasRecording ? 'Recording complete!' : 'Tap microphone to record'),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _isRecording ? AppTheme.primary : AppTheme.textSub,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        border: Border(top: BorderSide(color: Colors.grey.shade100)),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: _hasRecording ? _submit : null,
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: _hasRecording ? AppTheme.primary : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
            boxShadow: _hasRecording
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
              'SUBMIT',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: _hasRecording ? Colors.white : Colors.grey.shade400,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
