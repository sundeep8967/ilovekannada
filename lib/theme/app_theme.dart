import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color green = Color(0xFF58CC02);
  static const Color greenShadow = Color(0xFF58A700);
  
  static const Color blue = Color(0xFF1CB0F6);
  static const Color blueShadow = Color(0xFF1899D6);
  
  static const Color yellow = Color(0xFFFFC800);
  static const Color yellowShadow = Color(0xFFD9AA00);
  
  static const Color red = Color(0xFFFF4B4B);
  static const Color redShadow = Color(0xFFEA2B2B);

  static const Color grey = Color(0xFFE5E5E5);
  static const Color greyShadow = Color(0xFFAFAFAF); 
  
  static const Color white = Colors.white;
  static const Color black = Color(0xFF3C3C3C); 
  
  // Duolingo Exact Colors
  static const Color duoGreen = Color(0xFF58CC02);
  static const Color duoGreenShadow = Color(0xFF46A302); 
  static const Color duoBlue = Color(0xFF1CB0F6);
  static const Color duoRed = Color(0xFFFF4B4B);
  static const Color duoYellow = Color(0xFFFFC800);
  static const Color duoOrange = Color(0xFFFF9600); 
  static const Color duoGrey = Color(0xFFE5E5E5);

  // Typography
  static TextStyle get heading => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: black,
    decoration: TextDecoration.none,
  );

  static TextStyle get subHeading => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: black,
    decoration: TextDecoration.none,
  );

  static TextStyle get body => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  ); 

  static TextStyle get buttonText => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: white,
    decoration: TextDecoration.none,
  );

  // Main Theme Data
  static ThemeData get themeData {
    return ThemeData(
      primaryColor: green,
      scaffoldBackgroundColor: white, // Simple white
      useMaterial3: true,
      textTheme: TextTheme(
        displayLarge: heading,
        titleLarge: subHeading,
        bodyMedium: body,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: green,
        primary: green,
        secondary: blue,
        surface: white,
        background: white,
      ),
    );
  }
}
