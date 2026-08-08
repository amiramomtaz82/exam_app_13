import 'package:exam_app_13/core/constants/app_strings/app_strings.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_cubit.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_event.dart';
import 'package:exam_app_13/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/di/di.dart';
import 'core/app_theme/app_theme.dart';
import 'features/exam/presentaion/view/exam_screen.dart';

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
      home: BlocProvider(create: (_)=>
      getIt<ExamCubit>()..doEvents(LoadExamEvent(AppStrings.dummyExamID)),

          child: ExamScreen(examId: AppStrings.dummyExamID,)),
      );
  }
}
