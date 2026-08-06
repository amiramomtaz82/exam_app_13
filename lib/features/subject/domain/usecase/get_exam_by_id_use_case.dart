import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/subject/domain/entity/exam_entity.dart';
import 'package:exam_app_13/features/subject/domain/repo/subject_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetExamByIdUseCase {
  final SubjectRepo _repo;

  GetExamByIdUseCase(this._repo);

  Future<BaseResponse<ExamEntity>> call(String id) =>
      _repo.getExamById(id);
}
