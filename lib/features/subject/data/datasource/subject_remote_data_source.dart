import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/subject/data/model/subject_exam_dto.dart';

abstract class SubjectRemoteDataSource {
  Future<BaseResponse<List<ExamDto>>> getSubSubject(String subject);
  Future<BaseResponse<ExamDto>> getExamById(String id);
}