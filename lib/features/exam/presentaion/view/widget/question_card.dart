import 'package:flutter/material.dart';
import '../../../domain/entity/question_item.dart';

import 'review_answer_item.dart';

class QuestionCard extends StatelessWidget {
  final QuestionItem questionItem;

  const QuestionCard({
    super.key,
    required this.questionItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              questionItem.question.question,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 20),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: questionItem.question.answers.length,
              itemBuilder: (context, index) {
                final answer = questionItem.question.answers[index];

                final isCorrect =
                    answer.key == questionItem.question.correctAnswerKey;

                final isSelected =
                    answer.key == questionItem.selectedAnswerKey;

                return ReviewAnswerItem(
                  answer: answer.answer,
                  isCorrect: isCorrect,
                  isSelected: isSelected,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}