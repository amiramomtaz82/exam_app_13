import 'package:exam_app_13/features/exam/domain/usecase/get_all_questions_usecase.dart';
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
      // TODO: Handle this case.
      throw UnimplementedError();


    case TimerFinishedEvent():
      // TODO: Handle this case.
      throw UnimplementedError();
  }
}
//=========================================================================

Future<void> _loadQuestions(String examId) async {

  emit(
    state.copyWith(
      questionsResource: Resource.loading(),
    ),
  );

  final response =
  await _getAllQuestionsUsecase.call(examId);

  switch (response) {

    case SuccessResponse<List<QuestionEntity>>():

      _questions.clear();

      _questions.addAll(
        response.data.map(
              (question) => QuestionItem(
            question: question,
          ),
        ),
      );

      emit(
        state.copyWith(
          questionsResource:
          Resource.success(List.from(_questions)),
          currentQuestionIndex: 0,
        ),
      );

    case ErrorResponse<List<QuestionEntity>>():

      emit(
        state.copyWith(
          questionsResource:
          Resource.error(response.errMessage ?? ""),
        ),
      );
  }
}
//---------------------------------
void _selectAnswer(String answerKey) {

  if (_questions.isEmpty) return;

  final index = state.currentQuestionIndex;

  _questions[index].selectedAnswerKey =
      answerKey;

  emit(
    state.copyWith(
      questionsResource:
      Resource.success(List.from(_questions)),
    ),
  );
}
//-------------------------------------------------
  void _nextQuestion() {

    if (state.currentQuestionIndex >=
        _questions.length - 1) {
      return;
    }

    emit(
      state.copyWith(
        currentQuestionIndex:
        state.currentQuestionIndex + 1,
      ),
    );
  }
  //-------------------------------------------
  void _previousQuestion() {

    if (state.currentQuestionIndex == 0) {
      return;
    }

    emit(
      state.copyWith(
        currentQuestionIndex:
        state.currentQuestionIndex - 1,
      ),
    );
  }
  //-----------------------------------------------

  QuestionItem? get currentQuestion {

    if (_questions.isEmpty) return null;

    return _questions[state.currentQuestionIndex];
  }

  int get totalQuestions =>
      _questions.length;
  int get currentIndex =>
      state.currentQuestionIndex;

  String get progress =>
      "${currentIndex + 1}/$totalQuestions";

  bool get isFirstQuestion =>
      currentIndex == 0;

  bool get isLastQuestion =>
    currentIndex ==
          totalQuestions- 1;
}