import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/result/data/data_source/result_local_data_source.dart';
import 'package:exam_app_13/features/result/domain/dto/result_dto.dart';
import 'package:exam_app_13/features/result/domain/entity/result_entity.dart';
import 'package:exam_app_13/features/result/domain/repo/result_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResultRepo)
class ResultRepoImp implements ResultRepo {
  final ResultLocalDataSource _resultLocalDataSource;

  ResultRepoImp(this._resultLocalDataSource);

  @override
  Future<BaseResponse<List<ResultEntity>>> getAllResults() async {
    final BaseResponse<List<ResultDto>> response =
        await _resultLocalDataSource.getAllResults();

    switch (response) {
      case SuccessResponse<List<ResultDto>>():
        final results =
            response.data.map((dto) => dto.toEntity()).toList();
        return SuccessResponse<List<ResultEntity>>(results);

      case ErrorResponse<List<ResultDto>>():
        return ErrorResponse<List<ResultEntity>>(
          errMessage: response.errMessage,
        );
    }
  }
}
