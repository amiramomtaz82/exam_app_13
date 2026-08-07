import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/exam/api/api_client/exam_api_client.dart';
import 'package:exam_app_13/features/exam/data/data_source/exam_remote_data_source.dart';
import 'package:exam_app_13/features/exam/data/models/response/Question_DTO.dart';
import 'package:exam_app_13/features/exam/data/models/response/get_Questions_by_exam_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamRemoteDataSource)
class ExamRemoteDataSourceImp implements ExamRemoteDataSource {
  ExamApiClient _examApiClient;

  ExamRemoteDataSourceImp(this._examApiClient);

  @override
  Future<BaseResponse<List<QuestionDTO>>> getQuestionByExam(
    String examId,
  ) async {
    try {
      final httpResponse = await _examApiClient.getAllQuestionByExam(examId);

      final response = httpResponse.data;

      return SuccessResponse<List<QuestionDTO>>(response.questions ?? []);
    } on Exception catch (e) {
      return ErrorResponse<List<QuestionDTO>>(error: e);
    }
  }
}
