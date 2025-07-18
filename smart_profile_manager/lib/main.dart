import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeManager.themeMode,
      builder: (context, mode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.getThemeData(mode),
          home: const SplashScreen(),
        );
      },
    );
  }
}