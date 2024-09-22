import 'package:chat_firebase/app/ui/ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();
  static final ColorScheme _colorSchemeLight = ColorScheme.light(
    primary: AppColors.primary,
  );
  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 70,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),
  );
  static final _elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: _colorSchemeLight.primary,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 32,
      ),
    ),
  );
  static ThemeData get light {
    return ThemeData.from(colorScheme: _colorSchemeLight).copyWith(
      elevatedButtonTheme: _elevatedButtonThemeData,
      textTheme: _textTheme,
    );
  }
}
