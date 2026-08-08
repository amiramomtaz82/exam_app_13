import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/result/domain/entity/result_entity.dart';

abstract interface class ResultRepo {
  Future<BaseResponse<List<ResultEntity>>> getAllResults();
}
