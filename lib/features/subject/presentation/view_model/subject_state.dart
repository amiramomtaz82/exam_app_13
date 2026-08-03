import 'package:equatable/equatable.dart';

import '../../../../config/base_state/resource.dart';
import '../../domain/entity/subject_entity.dart';

class SubjectState extends Equatable {
  final Resource<List<SubjectEntity>> subjectsResource;
  final List<SubjectEntity> allSubjects;
  final List<SubjectEntity> filteredSubjects;

  const SubjectState({
    required this.subjectsResource,
    required this.allSubjects,
    required this.filteredSubjects
  });

  factory SubjectState.initial() {
    return SubjectState(
      subjectsResource: Resource.initial(),
      allSubjects: [],
      filteredSubjects: []
    );
  }

  SubjectState copyWith({
    Resource<List<SubjectEntity>>? subjectsResource,
    List<SubjectEntity>? allSubjects,
    List<SubjectEntity>? filteredSubjects
  }) {
    return SubjectState(
      subjectsResource: subjectsResource ?? this.subjectsResource,
      allSubjects: allSubjects??this.allSubjects,
        filteredSubjects: filteredSubjects??this.filteredSubjects
    );
  }

  @override
  List<Object?> get props => [subjectsResource,allSubjects,filteredSubjects];
}