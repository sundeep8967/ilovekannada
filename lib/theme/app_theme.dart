import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// App theme - iOS style with blue theme
class AppTheme {
  // Primary colors - Soft blue (iOS-inspired)
  static const Color primary = Color(0xFF007AFF);        // iOS blue
  static const Color primaryDark = Color(0xFF0056B3);    // Darker blue
  static const Color primaryLight = Color(0xFFB3D9FF);   // Light blue
  
  // Background colors - iOS style
  static const Color backgroundLight = Color(0xFFF2F2F7);  // iOS system background
  static const Color backgroundDark = Color(0xFF1C1C1E);
  
  // Surface colors
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF2C2C2E);
  
  // Text colors
  static const Color textMain = Color(0xFF1C1C1E);
  static const Color textSub = Color(0xFF8E8E93);        // iOS secondary label
  
  // Accent colors for cards
  static const Color blueAccent = Color(0xFF007AFF);
  static const Color greenAccent = Color(0xFF34C759);    // iOS green
  static const Color purpleAccent = Color(0xFFAF52DE);   // iOS purple
  static const Color amberAccent = Color(0xFFFF9500);    // iOS orange
  static const Color orangeAccent = Color(0xFFFF3B30);   // iOS red/orange
  static const Color tealAccent = Color(0xFF5AC8FA);     // iOS teal

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: ColorScheme.light(
        primary: primary,
        secondary: tealAccent,
        surface: surfaceLight,
        background: backgroundLight,
        onPrimary: Colors.white,
        onSurface: textMain,
      ),
      // iOS-style text
      fontFamily: '.SF Pro Text',
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 28,
          color: textMain,
          letterSpacing: -0.5,
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          color: textMain,
          letterSpacing: -0.3,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: textMain,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: textMain,
        ),
        bodyLarge: TextStyle(
          fontSize: 17,
          color: textMain,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
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
