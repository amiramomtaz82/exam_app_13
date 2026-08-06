import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/subject/data/data_source/subject_remote_data_source.dart';
import 'package:exam_app_13/features/subject/data/model/response/subject_dto.dart';
import 'package:exam_app_13/features/subject/domain/entity/subject_entity.dart';
import 'package:exam_app_13/features/subject/domain/repo/subject_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubjectRepo)
class SubjectRepoImp implements SubjectRepo {
  SubjectRemoteDataSource _subjectRemoteDataSource;

  SubjectRepoImp(this._subjectRemoteDataSource);

  @override
  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects() async {
    final BaseResponse<List<SubjectsDTO>> response =
        await _subjectRemoteDataSource.getAllSubjects();

    switch (response) {
      case SuccessResponse<List<SubjectsDTO>>():
        final List<SubjectEntity> subjectsList = response.data
            .map((dto) => dto.toEntity())
            .toList();

        return SuccessResponse<List<SubjectEntity>>(subjectsList);
      case ErrorResponse<List<SubjectsDTO>>():
        return ErrorResponse(errMessage: response.errMessage);
    }
  }
}
