import 'package:exam_app_13/features/home/home_screen.dart';
import 'package:exam_app_13/config/di.dart';
import 'package:exam_app_13/core/app_theme/app_theme.dart';
import 'package:exam_app_13/features/auth/presentaion/sign_Up_in/view/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app_13/config/di.dart';
import 'config/di/di.dart';
import 'core/app_theme/app_theme.dart';
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
      title: 'Exam App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SigninScreen(),
    );
  }
}
