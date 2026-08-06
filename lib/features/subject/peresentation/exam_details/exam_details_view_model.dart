import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/config/base_state/resource.dart';
import 'package:exam_app_13/features/subject/domain/entity/exam_entity.dart';
import 'package:exam_app_13/features/subject/domain/usecase/get_exam_by_id_use_case.dart';
import 'package:exam_app_13/features/subject/peresentation/exam_details/exam_details_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExamDetailsViewModel extends Bloc<ExamDetailsEvent, Resource<ExamEntity>> {
  final GetExamByIdUseCase _getExamByIdUseCase;

  ExamDetailsViewModel(this._getExamByIdUseCase) : super(Resource.initial()) {
    on<GetExamDetailsEvent>(_onGetExamDetails);
  }

  Future<void> _onGetExamDetails(
      GetExamDetailsEvent event, Emitter<Resource<ExamEntity>> emit) async {
    emit(Resource.loading());
    var response = await _getExamByIdUseCase.call(event.id);
    switch (response) {
      case SuccessResponse<ExamEntity>():
        emit(Resource.success(response.data));
      case ErrorResponse<ExamEntity>():
        emit(Resource.error(response.errMessage));
    }
  }
}
