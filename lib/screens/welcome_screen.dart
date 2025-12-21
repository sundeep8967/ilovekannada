import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../widgets/animations.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onSignIn;

  const WelcomeScreen({super.key, required this.onSignIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Animated mascot
              FadeSlideIn(
                delay: 0,
                child: FloatingAnimation(
                  amplitude: 10,
                  child: _buildMascot(),
                ),
              ),
              const SizedBox(height: 48),
              // Animated welcome text
              FadeSlideIn(
                delay: 200,
                child: _buildWelcomeText(),
              ),
              const Spacer(flex: 2),
              // Animated button
              FadeSlideIn(
                delay: 400,
                child: ScaleOnTap(
                  onTap: onSignIn,
                  child: _buildSignInButton(),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMascot() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background glow with pulse
        PulseAnimation(
          minScale: 1.0,
          maxScale: 1.08,
          duration: const Duration(milliseconds: 2000),
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.primary.withAlpha(25),
            ),
          ),
        ),
        // Main mascot circle
        Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.primary.withAlpha(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(25),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipOval(
                child: Container(
                  color: AppTheme.primary.withAlpha(50),
                  child: const Center(
                    child: Text('🦉', style: TextStyle(fontSize: 80)),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Animated school badge
        Positioned(
          bottom: 0,
          right: 8,
          child: ScaleBounceIn(
            delay: 400,
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppTheme.primary,
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.backgroundLight, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(38),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(CupertinoIcons.book_fill, color: Colors.white, size: 24),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      children: [
        Text(
          'Learn Kannada',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: AppTheme.textMain,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Start your language\njourney today!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: AppTheme.textSub,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withAlpha(75),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          "LET'S GO",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
