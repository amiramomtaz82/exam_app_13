import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/subject/api/api_client/subject_api_client.dart';
import 'package:exam_app_13/features/subject/data/datasource/subject_remote_data_source.dart';
import 'package:exam_app_13/features/subject/data/model/subject_exam_dto.dart';
import 'package:injectable/injectable.dart';

@singleton
class SubjectRemoteDataSourceImp implements SubjectRemoteDataSource {
  final SubjectApiClient subjectApi;

  SubjectRemoteDataSourceImp(this.subjectApi);
  @override
  Future<BaseResponse<ExamDto>> getExamById(String id) {
    // TODO: implement getExamById
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<List<ExamDto>>> getSubSubject(String subject) {
    // TODO: implement getSubSubject
    throw UnimplementedError();
  }
}
