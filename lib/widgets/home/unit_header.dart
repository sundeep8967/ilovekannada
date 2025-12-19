import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/course_model.dart';

class UnitHeader extends StatelessWidget {
  final Unit unit;

  const UnitHeader({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: const BoxDecoration(
        color: AppTheme.duoGreen,
        // Typically Duolingo headers are just colored blocks at top or banners
        // Based on screenshot: It's a header block
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SECTION ${unit.id}, UNIT ${unit.id + 10}", // Mocking screenshot "SECTION 3 UNIT 11"
            style: AppTheme.body.copyWith(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            unit.title, // "Communicate at school"
            style: AppTheme.heading.copyWith(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 4),
          Text(
             unit.description,
             style: AppTheme.body.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
