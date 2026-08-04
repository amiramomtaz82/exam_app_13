import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/core/constants/app_strings/app_strings.dart';
import 'package:exam_app_13/features/exam/presentaion/view/widget/answer_item.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_cubit.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/exam_event.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Text(AppStrings.exam),
        centerTitle: false,
        actions: [
          Icon(Icons.alarm_sharp),
          SizedBox(width: 7),
          Text(
            "25:00",
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: colors.success),
          ),
          SizedBox(width: 7),
        ],
      ),
      body: BlocBuilder<ExamCubit, ExamState>(
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

          return Column(
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
              SizedBox(
                height: 500,
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
            ],
          );
        },
      ),
    );
  }
}
