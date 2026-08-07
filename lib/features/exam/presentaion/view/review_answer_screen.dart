import 'package:exam_app_13/core/constants/app_strings/app_strings.dart';
import 'package:exam_app_13/features/exam/presentaion/view/widget/question_card.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_cubit.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewAnswerScreen extends StatelessWidget {
  const ReviewAnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Answers")),
      body: BlocBuilder<ExamCubit, ExamState>(
        builder: (context, state) {
          final cubit = context.read<ExamCubit>();
          return ListView.builder(
            itemCount: state.questions.length,
            itemBuilder: (context, index) {
              if (state.questions.isEmpty)
                return Center(child: Text(AppStrings.noQuestionAvailable));
              final question = state.questions[index];
              return QuestionCard(questionItem: question);
            },
          );
        },
      ),
    );
  }
}
