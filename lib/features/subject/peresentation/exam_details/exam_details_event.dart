sealed class ExamDetailsEvent {}

class GetExamDetailsEvent extends ExamDetailsEvent {
  final String id;
  GetExamDetailsEvent(this.id);
}
