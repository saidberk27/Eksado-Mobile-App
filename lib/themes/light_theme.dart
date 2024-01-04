import 'package:flutter/material.dart';

class LightTheme {
  static const primaryColor = Color(0xFF7e4f25);
  static const secondaryColor = Color(0XFF1c9037);
  static const tertiaryColor = Color(0XFFe4660b);
  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: tertiaryColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: secondaryColor,
        elevation: 0.0,
        centerTitle: true,
      ),
    );
  }

  static const TextTheme defaultTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
    displayMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    displaySmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
  );
}
