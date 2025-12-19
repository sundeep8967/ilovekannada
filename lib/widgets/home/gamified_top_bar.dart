import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class GamifiedTopBar extends StatelessWidget implements PreferredSizeWidget {
  final int streak;
  final int gems;
  final int hearts;

  const GamifiedTopBar({
    super.key,
    required this.streak,
    required this.gems,
    required this.hearts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 16,
        right: 16,
        bottom: 12,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Flag Icon (Placeholder for now, using text/icon)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.greyShadow, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('🇮🇳', style: TextStyle(fontSize: 20)),
          ),
          
          Expanded(child: Container()), // Spacer

          // Streak
          _buildCounter(Icons.local_fire_department, "$streak", AppTheme.duoOrange),
          const SizedBox(width: 16),
          
          // Gems
          _buildCounter(Icons.diamond_outlined, "$gems", AppTheme.duoBlue),
          const SizedBox(width: 16),

          // Hearts
          _buildCounter(Icons.favorite, "$hearts", AppTheme.duoRed),
        ],
      ),
    );
  }

  Widget _buildCounter(IconData icon, String value, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 4),
        Text(
          value,
          style: AppTheme.subHeading.copyWith(color: color, fontSize: 18),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
