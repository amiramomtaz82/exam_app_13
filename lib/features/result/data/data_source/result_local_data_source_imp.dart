import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/result/data/data_source/result_local_data_source.dart';
import 'package:exam_app_13/features/result/domain/dto/result_dto.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ResultLocalDataSource)
class ResultLocalDataSourceImp implements ResultLocalDataSource {
  static const List<ResultDto> _results = [
    ResultDto(
      id: '1',
      category: 'Language',
      title: 'High level',
      durationMinutes: 30,
      questionCount: 20,
      correctAnswersCount: 18,
      completionTimeMinutes: 25,
      iconType: 'language',
    ),
    ResultDto(
      id: '2',
      category: 'Language',
      title: 'High level',
      durationMinutes: 30,
      questionCount: 20,
      correctAnswersCount: 18,
      completionTimeMinutes: 25,
      iconType: 'language',
    ),
    ResultDto(
      id: '3',
      category: 'Math',
      title: 'Algebra',
      durationMinutes: 30,
      questionCount: 20,
      correctAnswersCount: 18,
      completionTimeMinutes: 25,
      iconType: 'math',
    ),
    ResultDto(
      id: '4',
      category: 'Math',
      title: 'Algebra',
      durationMinutes: 30,
      questionCount: 20,
      correctAnswersCount: 18,
      completionTimeMinutes: 25,
      iconType: 'math',
    ),
  ];

  @override
  Future<BaseResponse<List<ResultDto>>> getAllResults() async {
    try {
      await Future<void>.delayed(const Duration(milliseconds: 300));
      return SuccessResponse<List<ResultDto>>(List<ResultDto>.from(_results));
    } on Exception catch (e) {
      return ErrorResponse<List<ResultDto>>(error: e);
    }
  }
}
