import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/base_response/base_response.dart';
import '../../../../../../config/base_state/resource.dart';
import '../../../../domain/entity/forget_password_entity.dart';
import '../../../../domain/usecase/forget_password_usecase.dart';
import 'forget_password_event.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUsecase _forgetPasswordUsecase;

  ForgetPasswordCubit(this._forgetPasswordUsecase)
      : super(ForgetPasswordState.initial());

  void doEvents(ForgetPasswordEvents event) {
    switch (event) {
      case ForgetPasswordEvent(email: final email):
        _forgetPassword(email);

      case ResendCodeEvent(email: final email):
        _resendCode(email);
    }
  }

  Future<void> _forgetPassword(String email) async {


    emit(
      state.copyWith(
        forgetPasswordResource: Resource.loading(),
      ),
    );


    final result = await _forgetPasswordUsecase(email);

    switch (result) {
      case SuccessResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            forgetPasswordResource: Resource.success(result.data),
          ),
        );

      case ErrorResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            forgetPasswordResource: Resource.error(result.errMessage),
          ),
        );
    }
  }

  Future<void> _resendCode(String email) async {
    emit(
      state.copyWith(
        resendCodeResource: Resource.loading(),
      ),
    );

    final result = await _forgetPasswordUsecase(email);

    switch (result) {
      case SuccessResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            resendCodeResource: Resource.success(result.data),
          ),
        );

      case ErrorResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            resendCodeResource: Resource.error(result.errMessage),
          ),
        );
    }
  }
}