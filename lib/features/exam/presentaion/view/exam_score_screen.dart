import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/core/constants/app_strings/app_strings.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_cubit.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamScoreScreen extends StatelessWidget {
  int examScore;

  ExamScoreScreen({super.key, required this.examScore});

  @override
  Widget build(BuildContext context) {
    AppColors colors=LightColors();
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
            Container(width:double.infinity
                ,child: Text(AppStrings.yourScore
                  ,textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleLarge,)),
            SizedBox(height: 10),
            BlocBuilder<ExamCubit, ExamState>(
              builder: (context, state) {
                final ExamCubit cubit = context.read<ExamCubit>();
                return Column(
                  children:[
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
                                      value: cubit.incorrectAnswers.toDouble(),
                                      color: colors.error,
                                      radius: 10,
                                      showTitle: false,
                                    ),
                                    PieChartSectionData(
                                      value: state.score.toDouble(),
                                      color:colors.primary,
                                      radius: 10,
                                      showTitle: false,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "${cubit.scorePercentage.toStringAsFixed(1)}%",
                              style: Theme.of(context).textTheme.headlineMedium
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(AppStrings.correct,style: Theme.of(context).textTheme.titleMedium,),

                                  SizedBox(width:65),
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

                                    child: Text("${state.score}",style: TextStyle(color: colors.primary),),
                                  ),


                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Text(AppStrings.incorrect,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: colors.error),),
                                  SizedBox(width: 50),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: colors.error,
                                        width:1,
                                      ),
                                    ),
                                    alignment: Alignment.center,

                                    child: Text(
                                      "${cubit.incorrectAnswers}",style: TextStyle(color: colors.error),
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
          ],
        ),
      ),
    );
  }
}
