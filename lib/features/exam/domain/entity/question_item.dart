


import 'package:exam_app_13/features/exam/domain/entity/questions_entity.dart';

class QuestionItem {

  final QuestionEntity question;

  String? selectedAnswerKey;

  QuestionItem({
    required this.question,
    this.selectedAnswerKey,
  });

  bool get isAnswered =>
      selectedAnswerKey != null;

  bool get isCorrect =>
      selectedAnswerKey ==
          question.correctAnswerKey;
}