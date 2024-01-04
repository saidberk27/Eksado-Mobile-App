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
    );
  }
}
