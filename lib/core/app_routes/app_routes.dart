import 'package:exam_app_13/features/auth/presentaion/sign_Up_in/view/signin_screen.dart';
import 'package:exam_app_13/features/auth/presentaion/sign_Up_in/view/signup_screen.dart';
import 'package:flutter/material.dart';

abstract final class AppRoutes {
  static MaterialPageRoute get login =>
      MaterialPageRoute(builder: (_) => const SigninScreen());

  static MaterialPageRoute get register =>
      MaterialPageRoute(builder: (_) => const SignupScreen());
}
