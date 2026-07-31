import 'package:exam_app_13/features/auth/presentaion/forgetpassword/Reset_password/view/reset_password_screen.dart';
import 'package:exam_app_13/features/auth/presentaion/forgetpassword/forget_password/view/forget_password_screen.dart';
import 'package:exam_app_13/features/auth/presentaion/forgetpassword/forget_password/view_model/forget_password_cubit.dart';
import 'package:exam_app_13/features/auth/presentaion/forgetpassword/verify_code/view/verify_code_screen.dart';
import 'package:exam_app_13/features/auth/presentaion/sign_Up_in/view/signin_screen.dart';
import 'package:exam_app_13/features/auth/presentaion/sign_Up_in/view/signup_screen.dart';
import 'package:flutter/material.dart';

abstract final class AppRoutes {
  static MaterialPageRoute get login =>
      MaterialPageRoute(builder: (_) => const SigninScreen());

  static MaterialPageRoute get register =>
      MaterialPageRoute(builder: (_) => const SignupScreen());

  static MaterialPageRoute get forgetPassword =>
      MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

  static MaterialPageRoute emailVerification(
    String email, [
    ForgetPasswordCubit? cubit,
  ]) =>
      MaterialPageRoute(
        builder: (_) => EmailVerificationScreen(email: email),
      );

  static MaterialPageRoute resetPassword(String email) =>
      MaterialPageRoute(
        builder: (_) => ResetPasswordScreen(email: email),
      );
}

