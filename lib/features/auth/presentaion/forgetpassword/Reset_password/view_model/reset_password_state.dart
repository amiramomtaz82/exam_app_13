import '../../../../../../config/base_state/resource.dart';
import '../../../../domain/entity/forget_password_entity.dart';

class ResetPasswordState {
  Resource<ForgetPasswordEntity> resetPasswordResource = Resource.initial();

  ResetPasswordState({required this.resetPasswordResource});

  ResetPasswordState.initial() {
    resetPasswordResource = Resource.initial();
  }
}

typedef RestPasswordState = ResetPasswordState;