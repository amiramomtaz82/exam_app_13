
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/di/di.dart';
import '../../features/auth/presentation/forgetpassword/Reset_password/view/reset_password_screen.dart';
import '../../features/auth/presentation/forgetpassword/Reset_password/view_model/reset_password_cubit.dart';
import '../../features/auth/presentation/forgetpassword/forget_password/view/forget_password_screen.dart';
import '../../features/auth/presentation/forgetpassword/forget_password/view_model/forget_password_cubit.dart';
import '../../features/auth/presentation/forgetpassword/verify_code/view/verify_code_screen.dart';
import '../../features/auth/presentation/forgetpassword/verify_code/view_model/reset_code_cubit.dart';
import '../../features/auth/presentation/login/view/login_screen.dart';
import '../../features/auth/presentation/register/view/register_screen.dart';



abstract final class AppRoutes {
  static MaterialPageRoute get login =>
      MaterialPageRoute(builder: (_) => LoginScreen());

  static MaterialPageRoute get register =>
      MaterialPageRoute(builder: (_) => RegisterScreen());




  static MaterialPageRoute get forgetPassword => MaterialPageRoute(
      builder: (_) =>
          BlocProvider(
              create: (_) => getIt<ForgetPasswordCubit>(),

              child:
              ForgetPasswordScreen()));



  static MaterialPageRoute emailVerification(String email,
      ForgetPasswordCubit forgetPasswordCubit,) =>
      MaterialPageRoute(
        builder: (_) =>
            MultiBlocProvider(
              providers: [
                BlocProvider.value(value: forgetPasswordCubit),
                BlocProvider(create: (_) => getIt<ResetCodeCubit>()),
              ],
              child: EmailVerificationScreen(email: email),
            ),
      );

  static MaterialPageRoute resetPassword(String email) =>
      MaterialPageRoute(
        builder: (_) =>
            BlocProvider(
              create: (_) => getIt<ResetPasswordCubit>(),

              child: ResetPasswordScreen(email: email),
            ),
      );
}





