

import 'package:exam_app_13/config/base_response/base_response.dart';

import '../entity/questions_entity.dart';

abstract class ExamRepo {
  Future<BaseResponse<List<QuestionEntity>>> getQuestionsByExam(String examId);
}