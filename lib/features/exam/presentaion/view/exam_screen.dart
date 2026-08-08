import 'package:exam_app_13/core/app_routes/app_routes.dart';
import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/core/constants/app_strings/app_assets.dart';
import 'package:exam_app_13/core/constants/app_strings/app_strings.dart';
import 'package:exam_app_13/features/exam/presentaion/view/widget/answer_item.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_cubit.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/exam_event.dart';
import '../view_model/exam_finish_reason.dart';

class ExamScreen extends StatefulWidget {
  String examId;

  ExamScreen({super.key, required this.examId});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  Widget build(BuildContext context) {
    AppColors colors = LightColors();
    return BlocConsumer<ExamCubit, ExamState>(
      listener: (context, state) {
        if (state.examFinished) {
          final isTimeUp = state.finishReason == ExamFinishReason.timer;

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      isTimeUp
                          ? SizedBox(
                              height: 80,
                              width: 200,

                              child: Row(
                                children: [
                                  Image.asset(AppAssets.sandClock),
                                  const SizedBox(width: 8),
                                  Text(
                                    AppStrings.timeOut,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall,
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 70,
                                ),
                                Text(
                                  AppStrings.examFinished,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),

                      const SizedBox(height: 40),

                      SizedBox(
                        width: 190,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);

                            Navigator.push(
                              context,
                              AppRoutes.examScoreScreen(
                                state.score,
                                context.read<ExamCubit>(),
                                widget.examId,
                              ),
                            );
                          },
                          child: Text(AppStrings.viewScore),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
      builder: (context, state) {
        final ExamCubit cubit = context.read<ExamCubit>();
        final questionItem = cubit.currentQuestion;
        if (questionItem == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.questionsResource.isError) {
          return Center(
            child: Text(
              state.questionsResource.errorMessage ??
                  AppStrings.somethingWentWrong,
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
            title: Text(AppStrings.exam),
            centerTitle: false,
            actions: [
              Image.asset(AppAssets.clock),
              SizedBox(width: 7),
              Text(
                cubit.formattedTime,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: colors.success),
              ),
              SizedBox(width: 7),
            ],
          ),

          body: Column(
            children: [
              SizedBox(height: 10),
              Center(
                child: Text(
                  "${AppStrings.question} ${cubit.currentIndex} of${cubit.totalQuestions}",
                ),
              ),
              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: LinearProgressIndicator(
                  value: cubit.progressValue,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Text(
                  questionItem.question.question,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: questionItem.question.answers.length,
                  itemBuilder: (context, index) {
                    final answer = questionItem.question.answers[index];

                    return AnswerItem(
                      answer: answer.answer,
                      isSelected: questionItem.selectedAnswerKey == answer.key,
                      onTap: () {
                        cubit.doEvents(SelectAnswerEvent(answer.key));
                      },
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.white,
                          foregroundColor: colors.primary,
                          side: BorderSide(color: colors.primary),
                        ),
                        onPressed: () {
                          cubit.doEvents(PreviousQuestionEvent());
                        },
                        child: Text(AppStrings.back),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: cubit.isLastQuestion
                            ? () {
                                cubit.doEvents(FinishExamEvent());
                              }
                            : () {
                                cubit.doEvents(NextQuestionEvent());
                              },
                        child: cubit.isLastQuestion
                            ? Text(AppStrings.finished)
                            : Text(AppStrings.next),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        );
      },
    );
  }
}
