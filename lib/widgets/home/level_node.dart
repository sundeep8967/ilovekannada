import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/course_model.dart';
import 'dart:math' as math;

class LevelNode extends StatelessWidget {
  final Level level;
  final int index;
  final VoidCallback onTap;
  final Color unitColor;

  const LevelNode({
    super.key,
    required this.level,
    required this.index,
    required this.onTap,
    required this.unitColor,
  });

  @override
  Widget build(BuildContext context) {
    final double offset = 70.0 * math.sin(index * math.pi / 2.5);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      child: Transform.translate(
        offset: Offset(offset, 0),
        child: GestureDetector(
          onTap: level.status == LevelStatus.locked ? null : onTap,
          child: Column(
            children: [
               _buildCircleNode(),
               // Floating Start Bubble for Active Level
               if (level.status == LevelStatus.active)
                 _buildfloatingStartBubble(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleNode() {
    Color fillColor;
    Color shadowColor;
    Widget icon;

    switch (level.status) {
      case LevelStatus.locked:
        fillColor = AppTheme.duoGrey;
        shadowColor = const Color(0xFFC7C7C7);
        icon = const SizedBox.shrink(); // Empty or Lock
        break;
      case LevelStatus.active:
        fillColor = unitColor;
        shadowColor = AppTheme.duoGreenShadow; // Simplified
        icon = const Icon(Icons.star, color: Colors.white, size: 40);
        break;
      case LevelStatus.completed:
        fillColor = AppTheme.duoGreen;
        shadowColor = AppTheme.duoGreenShadow;
        icon = const Icon(Icons.check, color: Colors.white, size: 40, weight: 800);
        break;
    }

    return Container(
      width: 80,
      height: 74, // Height diff for 3D effect
      decoration: BoxDecoration(
        color: shadowColor, // Bottom layer (shadow)
        shape: BoxShape.circle,
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 6), // Push top layer up
        decoration: BoxDecoration(
          color: fillColor,
          shape: BoxShape.circle,
        ),
        child: Center(child: icon),
      ),
    );
  }

  Widget _buildfloatingStartBubble() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.duoGrey, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 4,
          )
        ]
      ),
      child: Column(
        children: [
          Text(
            "START +10 XP",
            style: AppTheme.heading.copyWith(
              color: AppTheme.duoGreen,
              fontSize: 14,
            ),
          ),
          // Tooltip arrow would go here
        ],
      ),
    );
  }
}
