import 'package:flutter/material.dart';

/// App theme based on the provided HTML design
class AppTheme {
  // Primary colors - Smooth golden yellow (easier on eyes)
  static const Color primary = Color(0xFFFFD93D);        // Soft golden yellow
  static const Color primaryDark = Color(0xFFE5C235);    // Darker gold
  static const Color primaryLight = Color(0xFFFFF3B0);   // Very light gold
  
  // Background colors
  static const Color backgroundLight = Color(0xFFFAFAF7);  // Slightly warmer
  static const Color backgroundDark = Color(0xFF1A1A14);

  
  // Surface colors
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF2E2D15);
  
  // Text colors
  static const Color textMain = Color(0xFF1C1C0D);
  static const Color textSub = Color(0xFF9E9D47);
  
  // Accent colors for cards
  static const Color blueAccent = Color(0xFF3B82F6);
  static const Color greenAccent = Color(0xFF10B981);
  static const Color purpleAccent = Color(0xFF8B5CF6);
  static const Color amberAccent = Color(0xFFD97706);
  static const Color orangeAccent = Color(0xFFF97316);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: ColorScheme.light(
        primary: primary,
        secondary: primaryDark,
        surface: surfaceLight,
        background: backgroundLight,
        onPrimary: textMain,
        onSurface: textMain,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: textMain,
          letterSpacing: -0.5,
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: textMain,
          letterSpacing: -0.3,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: textMain,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: textMain,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: textMain,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: textSub,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textSub,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
