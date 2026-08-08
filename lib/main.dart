import 'package:exam_app_13/features/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'config/di/di.dart';
import 'core/app_theme/app_theme.dart';

void main() {


  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
