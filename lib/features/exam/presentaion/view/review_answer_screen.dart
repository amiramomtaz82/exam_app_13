import 'package:exam_app_13/features/exam/presentaion/view/widget/question_card.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_cubit.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewAnswerScreen extends StatelessWidget {
  const ReviewAnswerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Answers"),
      ),
      body: BlocBuilder<ExamCubit,ExamState>(
        builder: (context,state) {
          final cubit=context.read<ExamCubit>();
          return ListView.builder(
            itemCount: cubit.questions.length,
            itemBuilder: (context, index) {
              final question = cubit.questions[index];
return QuestionCard(questionItem: question);


            }
          );
        }
      ),
    );
  }
}