import 'package:equatable/equatable.dart';

enum ResultIconType { language, math }

class ResultEntity extends Equatable {
  final String id;
  final String category;
  final String title;
  final int durationMinutes;
  final int questionCount;
  final int correctAnswersCount;
  final int completionTimeMinutes;
  final ResultIconType iconType;

  const ResultEntity({
    required this.id,
    required this.category,
    required this.title,
    required this.durationMinutes,
    required this.questionCount,
    required this.correctAnswersCount,
    required this.completionTimeMinutes,
    required this.iconType,
  });

  String durationLabel(int minutes) => '$minutes Minutes';

  String questionCountLabel(int count) => '$count Question';

  String correctedAnswersSummary(int correct, int timeMinutes) =>
      '$correct corrected answers in $timeMinutes min.';

  String get summaryText =>
      correctedAnswersSummary(correctAnswersCount, completionTimeMinutes);

  @override
  List<Object?> get props => [
        id,
        category,
        title,
        durationMinutes,
        questionCount,
        correctAnswersCount,
        completionTimeMinutes,
        iconType,
      ];
}
