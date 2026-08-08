
import 'package:exam_app_13/features/auth/presentaion/forgetpassword/Reset_password/view/reset_password_screen.dart';
import 'package:exam_app_13/features/auth/presentaion/forgetpassword/forget_password/view/forget_password_screen.dart';
import 'package:exam_app_13/features/auth/presentaion/forgetpassword/forget_password/view_model/forget_password_cubit.dart';
import 'package:exam_app_13/features/auth/presentaion/forgetpassword/verify_code/view/verify_code_screen.dart';
import 'package:exam_app_13/features/auth/presentaion/sign_Up_in/view/signin_screen.dart';
import 'package:exam_app_13/features/auth/presentaion/sign_Up_in/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/di/di.dart';
import '../../features/auth/presentation/login/view/login_screen.dart';
import '../../features/auth/presentation/register/view/register_screen.dart';



abstract final class AppRoutes {
  static MaterialPageRoute get login =>
      MaterialPageRoute(builder: (_) => LoginScreen());

  static MaterialPageRoute get register =>
      MaterialPageRoute(builder: (_) => RegisterScreen());


}
