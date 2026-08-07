import 'package:equatable/equatable.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_finish_reason.dart';
import 'package:flutter/foundation.dart';

import '../../../../config/base_state/resource.dart';
import '../../domain/entity/question_item.dart';

class ExamState extends Equatable {
  final Resource<List<QuestionItem>> questionsResource;

  final int currentQuestionIndex;

  final Duration remainingTime;

  final bool examFinished;

  final int score;

  final bool isSubmitting;
  ExamFinishReason? finishReason;

  ExamState({
    required this.questionsResource,
    required this.currentQuestionIndex,
    required this.remainingTime,
    required this.isSubmitting,
    required this.examFinished,
    required this.score,
    required this.finishReason
  });

  factory ExamState.initial() {
    return ExamState(
      questionsResource: Resource.initial(),
      currentQuestionIndex: 0,
      remainingTime: Duration(minutes: 20),
      isSubmitting: false,
      examFinished: false,
      score: 0,
      finishReason: ExamFinishReason.none

    );
  }

  ExamState copyWith({
    Resource<List<QuestionItem>>? questionsResource,
    int? currentQuestionIndex,
    Duration? remainingTime,
    bool? examFinished,
    int? score,
    bool? isSubmitting,
    ExamFinishReason? finishedReason
  }) {
    return ExamState(
      questionsResource: questionsResource ?? this.questionsResource,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      remainingTime: remainingTime ?? this.remainingTime,
      examFinished: examFinished ?? this.examFinished,
      score: score ?? this.score,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      finishReason: finishedReason?? this.finishReason
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [questionsResource,currentQuestionIndex,remainingTime,
  examFinished,isSubmitting,finishReason,score];
}
