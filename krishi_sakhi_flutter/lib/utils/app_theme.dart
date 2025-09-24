import 'package:flutter/material.dart';

class AppTheme {
  // Color scheme based on the HTML designs - Indian flag colors
  static const Color saffron = Color(0xFFFF9933);
  static const Color white = Color(0xFFFFFFFF);
  static const Color green = Color(0xFF138808);
  static const Color blueChakra = Color(0xFF000080);
  
  // Background colors
  static const Color backgroundLight = Color(0xFFF0F4F0);
  static const Color backgroundDark = Color(0xFF121212);
  
  // Text colors
  static const Color textLight = Color(0xFF1C1C1E);
  static const Color textDark = Color(0xFFE5E5E7);
  
  // Input colors
  static const Color inputLight = Color(0xFFFFFFFF);
  static const Color inputDark = Color(0xFF2C2C2E);
  
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Lexend',
      brightness: Brightness.light,
      primaryColor: saffron,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: saffron,
        secondary: green,
        surface: white,
        background: backgroundLight,
        onPrimary: white,
        onSecondary: white,
        onSurface: textLight,
        onBackground: textLight,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundLight,
        foregroundColor: textLight,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: saffron,
          foregroundColor: white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lexend',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: green, width: 2),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textLight,
          fontFamily: 'Lexend',
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textLight,
          fontFamily: 'Lexend',
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: textLight,
          fontFamily: 'Lexend',
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: textLight,
          fontFamily: 'Lexend',
        ),
      ),
    );
  }
  
  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: 'Lexend',
      brightness: Brightness.dark,
      primaryColor: saffron,
      scaffoldBackgroundColor: backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: saffron,
        secondary: green,
        surface: inputDark,
        background: backgroundDark,
        onPrimary: white,
        onSecondary: white,
        onSurface: textDark,
        onBackground: textDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundDark,
        foregroundColor: textDark,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: saffron,
          foregroundColor: white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lexend',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: green, width: 2),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textDark,
          fontFamily: 'Lexend',
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textDark,
          fontFamily: 'Lexend',
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: textDark,
          fontFamily: 'Lexend',
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: textDark,
          fontFamily: 'Lexend',
        ),
      ),
    );
  }
}