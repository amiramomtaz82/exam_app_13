import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/config/base_state/resource.dart';
import 'package:exam_app_13/features/subject/domain/entity/exam_entity.dart';
import 'package:exam_app_13/features/subject/domain/usecase/get_sub_subject_use_case.dart';
import 'package:exam_app_13/features/subject/peresentation/sub_subject/sub_subject_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubSubjectViewModel extends Bloc<SubSubjectEvent, Resource<List<ExamEntity>>> {
  final GetSubSubjectUseCase _getSubSubjectUseCase;

  SubSubjectViewModel(this._getSubSubjectUseCase) : super(Resource.initial()) {
    on<GetSubSubjectEvent>(_onGetSubSubject);
  }

  Future<void> _onGetSubSubject(
      GetSubSubjectEvent event, Emitter<Resource<List<ExamEntity>>> emit) async {
    emit(Resource.loading());
    var response = await _getSubSubjectUseCase.call(event.subject);
    switch (response) {
      case SuccessResponse<List<ExamEntity>>():
        emit(Resource.success(response.data));
      case ErrorResponse<List<ExamEntity>>():
        emit(Resource.error(response.errMessage));
    }
  }
}
