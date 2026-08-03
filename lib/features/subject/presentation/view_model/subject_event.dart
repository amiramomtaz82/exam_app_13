sealed class SubjectEvents {
  const SubjectEvents();
}

class GetAllSubjectsEvent extends SubjectEvents {
  const GetAllSubjectsEvent();
}

class SearchSubjectsEvent extends SubjectEvents {
  final String query;

  const SearchSubjectsEvent(this.query);
}