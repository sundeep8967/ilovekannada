import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/course_model.dart';

class LessonCard extends StatelessWidget {
  final Unit unit;
  final VoidCallback onTap;

  const LessonCard({
    super.key,
    required this.unit,
    required this.onTap,
  });

  // Calculate progress from levels
  int get completedLevels => unit.levels.where((l) => l.status == LevelStatus.completed).length;
  double get progress => unit.levels.isEmpty ? 0 : (completedLevels / unit.levels.length) * 100;
  bool get isCompleted => progress == 100;
  bool get isUnlocked => unit.levels.any((l) => l.status != LevelStatus.locked);

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color borderColor;

    if (isCompleted) {
      bgColor = AppTheme.duoYellow;
      borderColor = const Color(0xFFD9AA00);
    } else if (isUnlocked) {
      bgColor = AppTheme.duoGreen;
      borderColor = AppTheme.duoGreenShadow;
    } else {
      bgColor = const Color(0xFFE5E5E5);
      borderColor = const Color(0xFFAFAFAF);
    }

    return GestureDetector(
      onTap: isUnlocked ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 260,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 4),
          boxShadow: [
            BoxShadow(
              color: borderColor,
              offset: const Offset(0, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  unit.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                _buildStatusIcon(),
              ],
            ),
            const SizedBox(height: 4),
            // Subtitle
            Text(
              unit.description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            // Progress bar
            if (isUnlocked)
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress / 100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIcon() {
    if (isCompleted) {
      return Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Color(0xFFD9AA00),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.check, color: Colors.white, size: 20),
      );
    } else if (isUnlocked) {
      return Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.star, color: AppTheme.duoGreen, size: 20),
      );
    } else {
      return const Icon(Icons.lock, color: Colors.grey, size: 24);
    }
  }
}
