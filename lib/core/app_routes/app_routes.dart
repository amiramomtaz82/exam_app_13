
import 'package:exam_app_13/features/subject/presentation/view_model/subject_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/di/di.dart';


import '../../features/auth/presentaion/sign_Up_in/view/signin_screen.dart';
import '../../features/auth/presentaion/sign_Up_in/view/signup_screen.dart';
import '../../features/auth/presentation/forgetpassword/Reset_password/view/reset_password_screen.dart';
import '../../features/auth/presentation/forgetpassword/Reset_password/view_model/reset_password_cubit.dart';
import '../../features/auth/presentation/forgetpassword/forget_password/view/forget_password_screen.dart';
import '../../features/auth/presentation/forgetpassword/forget_password/view_model/forget_password_cubit.dart';
import '../../features/auth/presentation/forgetpassword/verify_code/view/verify_code_screen.dart';
import '../../features/auth/presentation/forgetpassword/verify_code/view_model/reset_code_cubit.dart';

import '../../features/home/home_screen.dart';


import '../../features/auth/presentation/login/view/login_screen.dart';
import '../../features/auth/presentation/register/view/register_screen.dart';
import '../../features/exam/presentaion/view/review_answer_screen.dart';
import '../../features/exam/presentaion/view/exam_score_screen.dart';
import '../../features/exam/presentaion/view/exam_screen.dart';
import '../../features/exam/presentaion/view_model/exam_cubit.dart';
import '../../features/exam/presentaion/view_model/exam_event.dart';
import '../../features/subject/presentation/view/subject_screen.dart';
import '../../features/subject/presentation/view_model/subject_cubit.dart';



abstract final class AppRoutes {
  static MaterialPageRoute get login =>
      MaterialPageRoute(builder: (_) => SigninScreen());

  static MaterialPageRoute get register =>
      MaterialPageRoute(builder: (_) => SignupScreen());

  static MaterialPageRoute get home =>
      MaterialPageRoute(builder: (_) => HomeScreen());


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
  static MaterialPageRoute examScreen(String examId) =>
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) =>
          getIt<ExamCubit>()
            ..doEvents(LoadExamEvent(examId)),
          child: ExamScreen(
            examId: examId,
          ),
        ),
      );
  static MaterialPageRoute examResultScreen(
      ExamCubit cubit,
      ) =>
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: cubit,
          child: const ReviewAnswerScreen(),
        ),
      );
  static MaterialPageRoute examScoreScreen( ExamCubit cubit,String examId) =>
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: cubit,
          child: ExamScoreScreen(examId: examId,),
        ),
      );
}
