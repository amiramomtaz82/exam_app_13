sealed class SubSubjectEvent {}

class GetSubSubjectEvent extends SubSubjectEvent {
  final String subject;
  GetSubSubjectEvent(this.subject);
}
