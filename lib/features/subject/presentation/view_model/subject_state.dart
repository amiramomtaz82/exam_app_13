import 'package:equatable/equatable.dart';

import '../../../../config/base_state/resource.dart';
import '../../domain/entity/subject_entity.dart';

class SubjectState extends Equatable {
  final Resource<List<SubjectEntity>> subjectsResource;

  const SubjectState({
    required this.subjectsResource,
  });

  factory SubjectState.initial() {
    return SubjectState(
      subjectsResource: Resource.initial(),
    );
  }

  SubjectState copyWith({
    Resource<List<SubjectEntity>>? subjectsResource,
  }) {
    return SubjectState(
      subjectsResource: subjectsResource ?? this.subjectsResource,
    );
  }

  @override
  List<Object?> get props => [subjectsResource];
}