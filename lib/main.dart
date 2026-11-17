import 'package:flutter/material.dart';

import 'router/app_router.dart';

void main() {
  runApp(const JelajahSumutApp());
}

class JelajahSumutApp extends StatelessWidget {
  const JelajahSumutApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF176B58),
      brightness: Brightness.light,
    );

    return MaterialApp.router(
      title: 'Jelajah Sumut',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F8F5),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 1,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      routerConfig: appRouter,
    );
  }
}
