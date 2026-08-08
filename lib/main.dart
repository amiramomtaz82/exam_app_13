
import 'package:exam_app_13/core/app_theme/app_theme.dart';

import 'package:flutter/material.dart';

import 'config/di/di.dart';
import 'features/auth/presentaion/sign_Up_in/view/signin_screen.dart';




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
      title: 'Exam App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SigninScreen(),
    );
  }
}
