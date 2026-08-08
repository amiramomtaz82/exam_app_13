import 'package:exam_app_13/features/result/domain/entity/result_entity.dart';
import 'package:exam_app_13/features/result/domain/usecase/get_all_results_usecase.dart';
import 'package:exam_app_13/features/result/presentation/view_model/result_event.dart';
import 'package:exam_app_13/features/result/presentation/view_model/result_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../config/base_state/resource.dart';

@injectable
class ResultCubit extends Cubit<ResultState> {
  final GetAllResultsUsecase _getAllResultsUsecase;

  ResultCubit(this._getAllResultsUsecase) : super(ResultState.initial());

  Future<void> doEvents(ResultEvents event) async {
    switch (event) {
      case GetAllResultsEvent():
        await _getAllResults();
    }
  }

  Future<void> _getAllResults() async {
    emit(state.copyWith(resultsResource: Resource.loading()));

    final response = await _getAllResultsUsecase();

    switch (response) {
      case SuccessResponse<List<ResultEntity>>():
        emit(
          state.copyWith(
            resultsResource: Resource.success(response.data),
            groupedResults: _groupByCategory(response.data),
          ),
        );

      case ErrorResponse<List<ResultEntity>>():
        emit(
          state.copyWith(
            resultsResource: Resource.error(response.errMessage),
          ),
        );
    }
  }

  Map<String, List<ResultEntity>> _groupByCategory(
    List<ResultEntity> results,
  ) {
    final grouped = <String, List<ResultEntity>>{};

    for (final result in results) {
      grouped.putIfAbsent(result.category, () => []).add(result);
    }

    return grouped;
  }
}
