import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/subject/api/api_client/subject_api_client.dart';
import 'package:exam_app_13/features/subject/data/datasource/subject_remote_data_source.dart';
import 'package:exam_app_13/features/subject/data/model/subject_exam_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubjectRemoteDataSource)
class SubjectRemoteDataSourceImp implements SubjectRemoteDataSource {
  final SubjectApiClient subjectApi;

  SubjectRemoteDataSourceImp(this.subjectApi);

  @override
  Future<BaseResponse<ExamDto>> getExamById(String id) async {
    try {
      var response = await subjectApi.getExamById(id);
      return SuccessResponse(response.exam!);
    } on Exception catch (e) {
      return ErrorResponse(error: e);
    }
  }

  @override
  Future<BaseResponse<List<ExamDto>>> getSubSubject(String subject) async {
    try {
      var response = await subjectApi.getSubSubject(subject);
      return SuccessResponse(response.exams ?? []);
    } on Exception catch (e) {
      return ErrorResponse(error: e);
    }
  }
}
