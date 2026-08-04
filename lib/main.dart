import 'package:exam_app_13/config/di.dart';
import 'package:exam_app_13/core/app_theme/app_theme.dart';
import 'package:exam_app_13/features/auth/presentaion/sign_Up_in/view/signin_screen.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SigninScreen(),
    );
  }
}
