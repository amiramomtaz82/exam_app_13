import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/exam/domain/entity/questions_entity.dart';
import 'package:exam_app_13/features/exam/domain/repo/exam_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllQuestionsUsecase {

  ExamRepo _examRepo;

  GetAllQuestionsUsecase(this._examRepo);

  Future<BaseResponse<List<QuestionEntity>>> call(String examId) =>
      _examRepo.getQuestionsByExam(examId);


}