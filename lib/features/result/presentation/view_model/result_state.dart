import 'package:equatable/equatable.dart';

import '../../../../config/base_state/resource.dart';
import '../../domain/entity/result_entity.dart';

class ResultState extends Equatable {
  final Resource<List<ResultEntity>> resultsResource;
  final Map<String, List<ResultEntity>> groupedResults;

  const ResultState({
    required this.resultsResource,
    required this.groupedResults,
  });

  factory ResultState.initial() {
    return ResultState(
      resultsResource: Resource.initial(),
      groupedResults: const {},
    );
  }

  ResultState copyWith({
    Resource<List<ResultEntity>>? resultsResource,
    Map<String, List<ResultEntity>>? groupedResults,
  }) {
    return ResultState(
      resultsResource: resultsResource ?? this.resultsResource,
      groupedResults: groupedResults ?? this.groupedResults,
    );
  }

  @override
  List<Object?> get props => [resultsResource, groupedResults];
}
