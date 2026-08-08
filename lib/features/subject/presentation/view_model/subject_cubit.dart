import 'package:exam_app_13/features/subject/domain/usecase/get_all_subjects_usecase.dart';
import 'package:exam_app_13/features/subject/presentation/view_model/subject_event.dart';
import 'package:exam_app_13/features/subject/presentation/view_model/subject_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../config/base_state/resource.dart';
import '../../domain/entity/subject_entity.dart';
@injectable
class SubjectCubit extends Cubit<SubjectState> {
  final GetAllSubjectsUsecase _getAllSubjectsUsecase;

  SubjectCubit(this._getAllSubjectsUsecase)
      : super(SubjectState.initial());

  Future<void> doEvents(SubjectEvents event) async {
    switch (event) {
      case GetAllSubjectsEvent():
        await _getAllSubjects();
      case SearchSubjectsEvent():
        _searchSubjects(event.query);
    }
  }

  Future<void> _getAllSubjects() async {

    emit(
      state.copyWith(
        subjectsResource:  Resource.loading(),
      ),
    );

    final response = await _getAllSubjectsUsecase();

    switch (response) {
      case SuccessResponse<List<SubjectEntity>>():
        emit(
          state.copyWith(
            subjectsResource: Resource.success(response.data),
            allSubjects: response.data,
            filteredSubjects: response.data,
          ),
        );

      case ErrorResponse<List<SubjectEntity>>():
        emit(
          state.copyWith(
            subjectsResource: Resource.error(response.errMessage),
          ),
        );
    }
  }

  void _searchSubjects(String query) {
    if (query.trim().isEmpty) {
      emit(
        state.copyWith(
          filteredSubjects: state.allSubjects,
        ),
      );
      return;
    }

    final filtered = state.allSubjects.where((subject) {
      return subject.name
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    emit(
      state.copyWith(
        filteredSubjects: filtered,
      ),
    );
  }
}