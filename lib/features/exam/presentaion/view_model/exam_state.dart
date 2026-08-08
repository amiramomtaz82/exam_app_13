
import 'package:equatable/equatable.dart';
import 'package:exam_app_13/features/exam/presentaion/question_item.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_finish_reason.dart';

import '../../../../config/base_state/resource.dart';

class ExamState extends Equatable {
  final Resource<List<QuestionItem>> questionsResource;

  final List<QuestionItem> questions;

  final int currentQuestionIndex;

  final Duration remainingTime;

  final String? examId;

  final bool examFinished;

  final int score;

  final bool isSubmitting;

  final FinishReason finishReason;

  const ExamState({
    required this.questionsResource,
    required this.questions,
    required this.currentQuestionIndex,
    required this.remainingTime,
    required this.examId,
    required this.examFinished,
    required this.score,
    required this.isSubmitting,
    required this.finishReason,
  });


  factory ExamState.initial() {
    return ExamState(
      questionsResource: Resource.initial(),
      questions: const [],
      currentQuestionIndex: 0,
      remainingTime: const Duration(minutes: 20),
      examId: null,
      examFinished: false,
      score: 0,
      isSubmitting: false,
      finishReason: FinishReason.none,
    );
  }

  ExamState copyWith({
    Resource<List<QuestionItem>>? questionsResource,
    List<QuestionItem>? questions,
    int? currentQuestionIndex,
    Duration? remainingTime,
    String? examId,
    bool? examFinished,
    int? score,
    bool? isSubmitting,
    FinishReason? finishReason,
  }) {
    return ExamState(
      questionsResource:
      questionsResource ?? this.questionsResource,
      questions: questions ?? this.questions,
      currentQuestionIndex:
      currentQuestionIndex ?? this.currentQuestionIndex,
      remainingTime:
      remainingTime ?? this.remainingTime,
      examId: examId ?? this.examId,
      examFinished:
      examFinished ?? this.examFinished,
      score: score ?? this.score,
      isSubmitting:
      isSubmitting ?? this.isSubmitting,
      finishReason:
      finishReason ?? this.finishReason,
    );


  }
  @override
  List<Object?> get props => [
    questionsResource,
    questions,
    currentQuestionIndex,
    remainingTime,
    examId,
    examFinished,
    score,
    isSubmitting,
    finishReason,
  ];
}