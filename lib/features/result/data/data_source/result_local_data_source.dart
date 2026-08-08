import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/result/domain/dto/result_dto.dart';

abstract interface class ResultLocalDataSource {
  Future<BaseResponse<List<ResultDto>>> getAllResults();
}
