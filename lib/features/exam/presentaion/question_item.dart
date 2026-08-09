import '../domain/entity/questions_entity.dart';

class QuestionItem {
  final QuestionEntity question;
  final String? selectedAnswerKey;

  const QuestionItem({
    required this.question,
    this.selectedAnswerKey,
  });

  QuestionItem copyWith({
    String? selectedAnswerKey,
  }) {
    return QuestionItem(
      question: question,
      selectedAnswerKey:
      selectedAnswerKey ?? this.selectedAnswerKey,
    );
  }
}