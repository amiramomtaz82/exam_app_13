import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/exam/data/data_source/exam_remote_data_source.dart';
import 'package:exam_app_13/features/exam/data/models/response/Question_DTO.dart';
import 'package:exam_app_13/features/exam/domain/entity/questions_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/exam_repo.dart';

@Injectable(as: ExamRepo)
class ExamRepImp implements ExamRepo {
  ExamRemoteDataSource _examRemoteDataSource;

  ExamRepImp(this._examRemoteDataSource);

  Future<BaseResponse<List<QuestionEntity>>> getQuestionsByExam(
    String examId,
  ) async {
    final BaseResponse<List<QuestionDTO>> response = await _examRemoteDataSource
        .getQuestionByExam(examId);

    switch (response) {
      //-----------------------------------------------
      case SuccessResponse<List<QuestionDTO>>():
        final List<QuestionEntity> questionsList = response.data
            .map((dto) => dto.toEntity())
            .toList();

        return SuccessResponse<List<QuestionEntity>>(questionsList);

      //------------------------------------
      case ErrorResponse<List<QuestionDTO>>():
        return ErrorResponse<List<QuestionEntity>>(
          errMessage: response.errMessage,
        );
    }
  }
}
