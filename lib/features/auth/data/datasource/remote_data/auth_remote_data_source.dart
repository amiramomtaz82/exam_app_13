import '../../../../../config/base_response/base_response.dart';
import '../../model/requests/forget_password_request.dart';
import '../../model/requests/reset_code_request.dart';
import '../../model/requests/reset_password_request.dart';
import '../../model/responses/forget_password_response.dart';
import '../../model/responses/reset_code_response.dart';
import '../../model/responses/reset_password_response.dart';

abstract class AuthRemoteDataSource {

  Future<BaseResponse<ForgetPasswordResponse>>
  forgetPassword(ForgetPasswordRequest request);


  Future<BaseResponse<ResetPasswordResponse>> restPassword(
      ResetPasswordRequest request,
      );


  Future<BaseResponse< ResetCodeResponse>> restCode(
      ResetCodeRequest request,
      );

}