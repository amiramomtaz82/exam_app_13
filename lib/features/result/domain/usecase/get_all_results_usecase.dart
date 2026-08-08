import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/result/domain/entity/result_entity.dart';
import 'package:exam_app_13/features/result/domain/repo/result_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllResultsUsecase {
  final ResultRepo _resultRepo;

  GetAllResultsUsecase(this._resultRepo);

  Future<BaseResponse<List<ResultEntity>>> call() => _resultRepo.getAllResults();
}
