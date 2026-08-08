
import 'package:exam_app_13/features/subject/presentation/view_model/subject_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/di/di.dart';
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
      MaterialPageRoute(builder: (_) => LoginScreen());

  static MaterialPageRoute get register =>
      MaterialPageRoute(builder: (_) => RegisterScreen());


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
  static MaterialPageRoute examScoreScreen(int examScore, ExamCubit cubit,String examId) =>
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: cubit,
          child: ExamScoreScreen(examScore: examScore,examId: examId,),
        ),
      );
}
