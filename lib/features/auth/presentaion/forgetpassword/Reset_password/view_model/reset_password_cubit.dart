import 'package:exam_app_13/features/auth/presentaion/forgetpassword/Reset_password/view_model/reset_password_event.dart';
import 'package:exam_app_13/features/auth/presentaion/forgetpassword/Reset_password/view_model/reset_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/base_response/base_response.dart';
import '../../../../../../config/base_state/resource.dart';
import '../../../../domain/entity/forget_password_entity.dart';
import '../../../../domain/usecase/reset_pssword_usecase.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordUsecase _resetPasswordUsecase;

  ResetPasswordCubit(this._resetPasswordUsecase)
      : super(ResetPasswordState.initial());

  void doEvent(ResetPasswordEvents event) {
    switch (event) {
      case ResetPasswordEvent(email: String email, newPassword: String newPassword):
        _resetPassword(email, newPassword);
    }
  }

  void _resetPassword(String email, String newPassword) async {
    emit(ResetPasswordState(resetPasswordResource: Resource.loading()));
    await Future.delayed(const Duration(seconds: 2));
    final result = await _resetPasswordUsecase(email, newPassword);

    switch (result) {
      case SuccessResponse<ForgetPasswordEntity>():
        emit(ResetPasswordState(
            resetPasswordResource: Resource.success(result.data)));
      case ErrorResponse<ForgetPasswordEntity>():
        emit(ResetPasswordState(
            resetPasswordResource: Resource.error(result.errMessage)));
    }
  }
}