import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../services/progress_service.dart';
import '../widgets/animations.dart';

class NameInputScreen extends StatefulWidget {
  final VoidCallback onComplete;

  const NameInputScreen({super.key, required this.onComplete});

  @override
  State<NameInputScreen> createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  final _controller = TextEditingController();
  bool _isValid = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    setState(() {
      _isValid = value.trim().length >= 2;
    });
  }

  void _submit() async {
    if (_isValid) {
      await ProgressService.setUserName(_controller.text.trim());
      widget.onComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 1),
              // Animated owl emoji
              FadeSlideIn(
                delay: 0,
                child: Center(
                  child: FloatingAnimation(
                    amplitude: 8,
                    child: PulseAnimation(
                      minScale: 1.0,
                      maxScale: 1.05,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.primary.withAlpha(25),
                        ),
                        child: const Center(
                          child: Text('🦉', style: TextStyle(fontSize: 60)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Animated title
              FadeSlideIn(
                delay: 150,
                child: Text(
                  "What's your name?",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textMain,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              FadeSlideIn(
                delay: 200,
                child: Text(
                  "We'll use this to personalize your learning experience.",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.textSub,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Animated name input
              FadeSlideIn(
                delay: 300,
                child: CupertinoTextField(
                  controller: _controller,
                  placeholder: 'Enter your name',
                  padding: const EdgeInsets.all(18),
                  style: TextStyle(fontSize: 18, color: AppTheme.textMain),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _isValid ? AppTheme.primary : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  onChanged: _onChanged,
                  onSubmitted: (_) => _submit(),
                ),
              ),
              const Spacer(flex: 2),
              // Animated continue button
              FadeSlideIn(
                delay: 400,
                child: ScaleOnTap(
                  onTap: _isValid ? _submit : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      color: _isValid ? AppTheme.primary : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: _isValid ? [
                        BoxShadow(
                          color: AppTheme.primary.withAlpha(75),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ] : null,
                    ),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
