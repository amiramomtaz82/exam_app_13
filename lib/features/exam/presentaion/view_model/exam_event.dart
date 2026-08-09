sealed class ExamEvents {}

class LoadExamEvent extends ExamEvents {
  final String examId;

  LoadExamEvent(this.examId);
}

class SelectAnswerEvent extends ExamEvents {
  final String answerKey;

  SelectAnswerEvent(this.answerKey);
}

class NextQuestionEvent extends ExamEvents {}

class PreviousQuestionEvent extends ExamEvents {}

class FinishExamEvent extends ExamEvents {}

class TimerFinishedEvent extends ExamEvents {}