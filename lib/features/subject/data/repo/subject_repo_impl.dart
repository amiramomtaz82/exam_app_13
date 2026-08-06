import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/subject/data/datasource/subject_remote_data_source.dart';
import 'package:exam_app_13/features/subject/data/model/subject_exam_dto.dart';
import 'package:exam_app_13/features/subject/domain/entity/exam_entity.dart';
import 'package:exam_app_13/features/subject/domain/repo/subject_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubjectRepo)
class SubjectRepoImpl implements SubjectRepo {
  final SubjectRemoteDataSource _dataSource;

  SubjectRepoImpl(this._dataSource);

  ExamEntity _mapToEntity(ExamDto dto) {
    return ExamEntity(
      id: dto.id,
      title: dto.title,
      duration: dto.duration,
      subject: dto.subject,
      numberOfQuestions: dto.numberOfQuestions,
    );
  }

  @override
  Future<BaseResponse<List<ExamEntity>>> getSubSubject(String subject) async {
    var response = await _dataSource.getSubSubject(subject);
    switch (response) {
      case SuccessResponse<List<ExamDto>>():
        var entities = response.data.map(_mapToEntity).toList();
        return SuccessResponse(entities);
      case ErrorResponse<List<ExamDto>>():
        return ErrorResponse(errMessage: response.errMessage);
    }
  }

  @override
  Future<BaseResponse<ExamEntity>> getExamById(String id) async {
    var response = await _dataSource.getExamById(id);
    switch (response) {
      case SuccessResponse<ExamDto>():
        return SuccessResponse(_mapToEntity(response.data));
      case ErrorResponse<ExamDto>():
        return ErrorResponse(errMessage: response.errMessage);
    }
  }
}
