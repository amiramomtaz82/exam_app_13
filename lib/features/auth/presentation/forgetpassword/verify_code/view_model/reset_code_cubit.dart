import 'package:exam_app_13/features/auth/presentation/forgetpassword/verify_code/view_model/reset_code_event.dart';
import 'package:exam_app_13/features/auth/presentation/forgetpassword/verify_code/view_model/reset_code_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/base_response/base_response.dart';
import '../../../../../../config/base_state/resource.dart';
import '../../../../domain/entity/forget_password_entity.dart';
import '../../../../domain/usecase/reset_code_usecase.dart';


@injectable
class ResetCodeCubit extends Cubit<ResetCodeState> {
  final ResetCodeUsecase _resetCodeUsecase;

  ResetCodeCubit(this._resetCodeUsecase)
      : super(ResetCodeState.initial());

  Future<void> doEvents(ResetCodeEvents event) async{
    switch (event) {
      case ResetCodeEvent(code: final code):
        _verifyResetCode(code);

      case ClearWrongCodeEvent():
        emit(state.copyWith(isWrongCode: false));

      case ShowWrongCodeEvent(): emit(
        state.copyWith(
          isWrongCode: true,
        ),
      );
    }
  }

  Future<void> _verifyResetCode(String code) async {
    emit(
      state.copyWith(
        resetCodeResource: Resource.loading(),
      ),
    );

    final result = await _resetCodeUsecase(code);

    switch (result) {
      case SuccessResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            resetCodeResource: Resource.success(result.data),
          ),
        );

      case ErrorResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            resetCodeResource: Resource.error(result.errMessage),
            isWrongCode: true,
          ),
        );
    }
  }
  void showWrongCode() {
    emit(state.copyWith(isWrongCode: true));
  }

  void clearWrongCode() {
    if (state.isWrongCode) {
      emit(state.copyWith(isWrongCode: false));
    }
  }
}