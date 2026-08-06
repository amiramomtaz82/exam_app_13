import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/subject/domain/entity/exam_entity.dart';

abstract class SubjectRepo {
  Future<BaseResponse<List<ExamEntity>>> getSubSubject(String subject);
  Future<BaseResponse<ExamEntity>> getExamById(String id);
}
