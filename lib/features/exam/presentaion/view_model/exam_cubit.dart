import 'dart:async';

import 'package:exam_app_13/features/exam/domain/usecase/get_all_questions_usecase.dart';
import 'package:exam_app_13/features/exam/presentaion/view_model/exam_finish_reason.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../config/base_state/resource.dart';
import '../question_item.dart';
import '../../domain/entity/questions_entity.dart';
import 'exam_event.dart';
import 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  final GetAllQuestionsUsecase _getAllQuestionsUseCase;

  Timer? _timer;



  ExamCubit(this._getAllQuestionsUseCase) : super(ExamState.initial());

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
        _finishExam(FinishReason.user);

      case TimerFinishedEvent():
        _finishExam(FinishReason.timer);
    }
  }

  //=========================================================================

  Future<void> _loadQuestions(String examId) async {

    emit(state.copyWith(questionsResource: Resource.loading()));

    final response = await _getAllQuestionsUseCase.call(examId);

    switch (response) {
      case SuccessResponse<List<QuestionEntity>>():

        final questions =
        response.data
            .map((q) => QuestionItem(question: q))
            .toList();

        final examDuration = Duration(minutes: 2);
        emit(
          state.copyWith(
            questionsResource:
            Resource.success(questions),
            questions: questions,
            currentQuestionIndex: 0,
            remainingTime: examDuration,
            examId: examId,
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


    final updatedQuestions =
    List<QuestionItem>.from(state.questions);
    final index = state.currentQuestionIndex;
    updatedQuestions[index] =
        updatedQuestions[index].copyWith(
          selectedAnswerKey: answerKey,
        );

    emit(
      state.copyWith(
        questions: updatedQuestions,
        questionsResource:
        Resource.success(updatedQuestions),
      ),
    );
  }

  //-------------------------------------------------
  void _nextQuestion() {
    if (state.currentQuestionIndex >= state.questions.length-1) {
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

  void _finishExam(FinishReason reason) {
    if (state.examFinished) return;
    _timer?.cancel();

    final score = _calculateScore();

    emit(
      state.copyWith(finishReason: reason, examFinished: true, score: score),
    );
  }

  //---------------------------------------------
  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final remainingSeconds = state.remainingTime.inSeconds;

      if (remainingSeconds > 0) {
        emit(
          state.copyWith(
            remainingTime: Duration(
              seconds: remainingSeconds - 1,
            ),
          ),
        );
      } else {
        timer.cancel();
        doEvents(TimerFinishedEvent());
      }
    });
  }
  Future<void> restartExam() async {
    if (state.examId != null) {
      await _loadQuestions(state.examId!);
    }
  }
//------------------------------------------------








  int _calculateScore() {
    int score = 0;

    for (final item in state.questions) {
      if (item.selectedAnswerKey == item.question.correctAnswerKey) {
        score++;
      }
    }

    return score;
  }




  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }








}
