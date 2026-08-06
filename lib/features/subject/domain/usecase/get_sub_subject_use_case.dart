import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/subject/domain/entity/exam_entity.dart';
import 'package:exam_app_13/features/subject/domain/repo/subject_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSubSubjectUseCase {
  final SubjectRepo _repo;

  GetSubSubjectUseCase(this._repo);

  Future<BaseResponse<List<ExamEntity>>> call(String subject) =>
      _repo.getSubSubject(subject);
}
