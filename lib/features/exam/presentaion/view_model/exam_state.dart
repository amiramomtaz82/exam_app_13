import 'package:flutter/foundation.dart';

import '../../../../config/base_state/resource.dart';
import '../../domain/entity/question_item.dart';

class ExamState {
  final Resource<List<QuestionItem>> questionsResource;

  final int currentQuestionIndex;

  final Duration remainingTime;

  final bool examFinished;

  final int score;

  final bool isSubmitting;

  ExamState({
    required this.questionsResource,
    required this.currentQuestionIndex,
    required this.remainingTime,
    required this.isSubmitting,
    required this.examFinished,
    required this.score,
  });

  factory ExamState.initial() {
    return ExamState(
      questionsResource: Resource.initial(),
      currentQuestionIndex: 0,
      remainingTime: Duration(minutes: 20),
      isSubmitting: false,
      examFinished: false,
      score: 0,
    );
  }

  ExamState copyWith({
    Resource<List<QuestionItem>>? questionsResource,
    int? currentQuestionIndex,
    Duration? remainingTime,
    bool? examFinished,
    int? score,
    bool? isSubmitting,
  }) {
    return ExamState(
      questionsResource: questionsResource ?? this.questionsResource,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      remainingTime: remainingTime ?? this.remainingTime,
      examFinished: examFinished ?? this.examFinished,
      score: score ?? this.score,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
