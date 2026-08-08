import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/core/constants/app_strings/app_strings.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_cubit.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_routes/app_routes.dart';

class ExamScoreScreen extends StatelessWidget {
  final String examId;

  ExamScoreScreen({super.key, required this.examId});

  @override
  Widget build(BuildContext context) {
    AppColors colors = LightColors();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text(AppStrings.examScore),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                AppStrings.yourScore,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(height: 10),
            BlocBuilder<ExamCubit, ExamState>(
              builder: (context, state) {
                final ExamCubit cubit = context.read<ExamCubit>();
                return Column(
                  children: [
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 170,
                              height: 170,
                              child: PieChart(
                                PieChartData(
                                  centerSpaceRadius: 60,
                                  sectionsSpace: 10,
                                  sections: [
                                    PieChartSectionData(
                                      value:
                                          (state.questions.length - state.score)
                                              .toDouble(),
                                      color: colors.error,
                                      radius: 10,
                                      showTitle: false,
                                    ),
                                    PieChartSectionData(
                                      value: state.score.toDouble(),
                                      color: colors.primary,
                                      radius: 10,
                                      showTitle: false,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "${(state.score / state.questions.length).toStringAsFixed(1)}%",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    AppStrings.correct,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(color: colors.primary),
                                  ),

                                  SizedBox(width: 65),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: colors.primary,
                                        width: 1,
                                      ),
                                    ),
                                    alignment: Alignment.center,

                                    child: Text(
                                      "${state.score}",
                                      style: TextStyle(color: colors.primary),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    AppStrings.incorrect,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(color: colors.error),
                                  ),
                                  SizedBox(width: 50),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: colors.error,
                                        width: 1,
                                      ),
                                    ),
                                    alignment: Alignment.center,

                                    child: Text(
                                      "${state.questions.length - state.score}",
                                      style: TextStyle(color: colors.error),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 80),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),

              onPressed: () {
                Navigator.push(
                  context,
                  AppRoutes.examResultScreen(context.read<ExamCubit>()),
                );
              },
              child: Text(AppStrings.showResult),
            ),
            SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: colors.primary,
                backgroundColor: colors.white,
                side: BorderSide(color: colors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  AppRoutes.examScreen(examId),
                );
              },
              child: Text(AppStrings.startAgain),
            ),
          ],
        ),
      ),
    );
  }
}
