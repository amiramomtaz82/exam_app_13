import '../../../../config/base_response/base_response.dart';
import '../entity/forget_password_entity.dart';

abstract interface class AuthRepo {

  Future<BaseResponse<ForgetPasswordEntity>> forgetPassword(String email);

  Future<BaseResponse<ForgetPasswordEntity>> resetCode(String code);
  Future<BaseResponse<ForgetPasswordEntity>> resetPassword(String email,String newPassword);

}