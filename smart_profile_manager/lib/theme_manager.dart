import 'package:flutter/material.dart';

class ThemeManager {
  static final ValueNotifier<ThemeMode> themeMode = ValueNotifier<ThemeMode>(ThemeMode.light);

  static ThemeData getThemeData(ThemeMode mode) {
    return mode == ThemeMode.dark
        ? ThemeData.dark().copyWith(
      primaryColor: Colors.blue[700],
      scaffoldBackgroundColor: Colors.grey[850],
      appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
      cardColor: Colors.grey[800],
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white70),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
    )
        : ThemeData.light().copyWith(
      primaryColor: Colors.blue[800],
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(backgroundColor: Colors.blue[800]),
      cardColor: Colors.blue[50],
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black87),
        bodyMedium: TextStyle(color: Colors.black87),
      ),
    );
  }
}