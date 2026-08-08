import '../../../../../../config/base_state/resource.dart';
import '../../../../domain/entity/forget_password_entity.dart';

class RestPasswordState {

  Resource<ForgetPasswordEntity> resetPasswordResource = Resource.initial();


  RestPasswordState({required this.resetPasswordResource});

  RestPasswordState.initial(){
    resetPasswordResource = Resource.initial();
  }

}