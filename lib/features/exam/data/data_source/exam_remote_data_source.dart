


import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/exam/data/models/response/Question_DTO.dart';


abstract interface class ExamRemoteDataSource {
  Future <BaseResponse<List<QuestionDTO>>>  getQuestionByExam(String examId);


}