import 'dart:async';

import 'package:exam_app_13/features/exam/domain/usecase/get_all_questions_usecase.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_finish_reason.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../config/base_state/resource.dart';
import '../../domain/entity/question_item.dart';
import '../../domain/entity/questions_entity.dart';
import 'exam_event.dart';
import 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  final GetAllQuestionsUsecase _getAllQuestionsUsecase;
  final List<QuestionItem> _questions = [];
  Timer? _timer;
  int _remainingSeconds = 10 * 60;
  String? _examId;

  ExamCubit(this._getAllQuestionsUsecase) : super(ExamState.initial());

  Future<void> doEvents(ExamEvents event) async {
    switch (event) {
      case LoadExamEvent():
        await _loadQuestions(event.examId);

      case SelectAnswerEvent():
        _selectAnswer(event.answerKey);

      case NextQuestionEvent():
        _nextQuestion();

      case PreviousQuestionEvent():
        _previousQuestion();

      case FinishExamEvent():
        _finishExam(ExamFinishReason.user);

      case TimerFinishedEvent():
        _finishExam(ExamFinishReason.timer);
    }
  }

  //=========================================================================

  Future<void> _loadQuestions(String examId) async {
    _examId=examId;
    emit(state.copyWith(questionsResource: Resource.loading()));

    final response = await _getAllQuestionsUsecase.call(examId);

    switch (response) {
      case SuccessResponse<List<QuestionEntity>>():
        _questions.clear();

        _questions.addAll(
          response.data.map((question) => QuestionItem(question: question)),
        );
        final examDuration=Duration(minutes:2 );
        _remainingSeconds = examDuration.inSeconds;

        emit(
          state.copyWith(
            questionsResource: Resource.success(List.from(_questions)),
            currentQuestionIndex: 0,

            remainingTime:examDuration,

          ),
        );
        _startTimer();

      case ErrorResponse<List<QuestionEntity>>():
        emit(
          state.copyWith(
            questionsResource: Resource.error(response.errMessage ?? ""),
          ),
        );
    }
  }

  //---------------------------------
  void _selectAnswer(String answerKey) {
    if (_questions.isEmpty) return;

    final index = state.currentQuestionIndex;

    _questions[index].selectedAnswerKey = answerKey;

    emit(
      state.copyWith(
        questionsResource: Resource.success(List.from(_questions)),
      ),
    );
  }

  //-------------------------------------------------
  void _nextQuestion() {
    if (state.currentQuestionIndex >= _questions.length - 1) {
      return;
    }

    emit(state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1));
  }

  //-------------------------------------------
  void _previousQuestion() {
    if (state.currentQuestionIndex == 0) {
      return;
    }

    emit(state.copyWith(currentQuestionIndex: state.currentQuestionIndex - 1));
  }

  //-----------------------------------------------

  void _finishExam(ExamFinishReason reason) {
    if(state.examFinished)return;
    _timer?.cancel();

    final score = _calculateScore();

    emit(state.copyWith(
      finishedReason: reason,
        examFinished: true,
        score: score));
  }

  //---------------------------------------------
  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;

        emit(
          state.copyWith(remainingTime: Duration(seconds: _remainingSeconds)),
        );
      } else {
        timer.cancel();

        doEvents(TimerFinishedEvent());
      }
    });
  }
  Future<void> restartExam() async {
    if (_examId != null) {
      await _loadQuestions(_examId!);
    }
  }

  QuestionItem? get currentQuestion {
    if (_questions.isEmpty) return null;

    return _questions[state.currentQuestionIndex];
  }

  int get totalQuestions => _questions.length;

  int get currentIndex => state.currentQuestionIndex;
  int get incorrectAnswers => totalQuestions - state.score;

  String get progress => "${currentIndex + 1}/$totalQuestions";

  bool get isFirstQuestion => currentIndex == 0;

  bool get isLastQuestion => currentIndex == totalQuestions - 1;

  double get progressValue {
    if (totalQuestions == 0) return 0;

    return (currentIndex + 1) / totalQuestions;
  }

  int _calculateScore() {
    int score = 0;

    for (final item in _questions) {
      if (item.selectedAnswerKey == item.question.correctAnswerKey) {
        score++;
      }
    }

    return score;
  }

  String get formattedTime {
    final time = state.remainingTime;

    final minutes = time.inMinutes.remainder(60);
    final seconds = time.inSeconds.remainder(60);

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }


    double get scorePercentage {
      if (totalQuestions == 0) return 0;

      return state.score / totalQuestions;
    }
  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  List<QuestionItem> get questions => List.unmodifiable(_questions);

  String? get examId => _examId;


  bool isCorrect(QuestionItem item) {
    return item.selectedAnswerKey == item.question.correctAnswerKey;
  }

  String? selectedAnswer(QuestionItem item) {
    return item.selectedAnswerKey;
  }
}
