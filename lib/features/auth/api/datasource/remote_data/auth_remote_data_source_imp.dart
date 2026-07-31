import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../../data/datasource/remote_data/auth_remote_data_source.dart';
import '../../../data/model/requests/forget_password_request.dart';
import '../../../data/model/requests/reset_code_request.dart';
import '../../../data/model/requests/reset_password_request.dart';
import '../../../data/model/responses/forget_password_response.dart';
import '../../../data/model/responses/reset_code_response.dart';
import '../../../data/model/responses/reset_password_response.dart';
import '../../api_client/auth_api_client.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {


  bool useDummyForgetPassword = true;
  AuthApiClient authApiClient;

  AuthRemoteDataSourceImpl(this.authApiClient);

  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest request,
      ) async {

    if (useDummyForgetPassword) {
      await Future.delayed(const Duration(seconds: 2));

      return SuccessResponse(
        ForgetPasswordResponse(
          message: "Reset code sent successfully",
        ),
      );
    }
    //-------------------------------------------------------
    try {
      final response = await authApiClient.forgetPassword(request);
      return SuccessResponse<ForgetPasswordResponse>(response.data);
    } on Exception catch (e) {
      return ErrorResponse<ForgetPasswordResponse>(error: e);
    }
  }


  //----------------------------------------

  Future<BaseResponse<ResetCodeResponse>> restCode(
      ResetCodeRequest request,
      ) async {

    if (useDummyForgetPassword) {
      await Future.delayed(const Duration(seconds: 2));

      if (request.resetCode == "1234") {
        return SuccessResponse(
          ResetCodeResponse(
            message: "Code verified successfully",
          ),
        );
      }

      return ErrorResponse(
        errMessage: "Invalid verification code",
      );
    }




    try {
      final response = await authApiClient.RestCode(request);
      return SuccessResponse<ResetCodeResponse>(response.data);
    } on Exception catch (e) {
      return ErrorResponse<ResetCodeResponse>(error: e);
    }
  }

  //--------------------------------------------


  Future<BaseResponse<ResetPasswordResponse>> restPassword(
      ResetPasswordRequest request,
      ) async {

    if (useDummyForgetPassword) {
      await Future.delayed(const Duration(seconds: 2));

      return SuccessResponse(
        ResetPasswordResponse(
          message: "Password reset successfully",
          // Fill any other required fields
        ),
      );
    }





    try {
      final response = await authApiClient.resetPassword(request);
      return SuccessResponse<ResetPasswordResponse>(response.data);
    } on Exception catch (e) {
      return ErrorResponse<ResetPasswordResponse>(error: e);
    }
  }

}