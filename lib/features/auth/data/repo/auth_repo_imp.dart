import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../domain/entity/forget_password_entity.dart';
import '../../domain/repo/auth_repo.dart';
import '../datasource/remote_data/auth_remote_data_source.dart';
import '../model/requests/forget_password_request.dart';
import '../model/requests/reset_code_request.dart';
import '../model/requests/reset_password_request.dart';
import '../model/responses/forget_password_response.dart';
import '../model/responses/reset_code_response.dart';
import '../model/responses/reset_password_response.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImp implements AuthRepo {


  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImp(this.authRemoteDataSource);

  @override
  Future<BaseResponse<ForgetPasswordEntity>> forgetPassword(String email)async {

    final request = ForgetPasswordRequest(email: email);
    final BaseResponse<ForgetPasswordResponse> response=
    await authRemoteDataSource.forgetPassword(request);

    switch(response) {
      case SuccessResponse<ForgetPasswordResponse>():
        return SuccessResponse(response.data.toEntity());
      case ErrorResponse<ForgetPasswordResponse>():
        return ErrorResponse(errMessage: response.errMessage);
    }

  }

  @override
  Future<BaseResponse<ForgetPasswordEntity>> resetCode(String code) async{
    final request=ResetCodeRequest(resetCode: code);
    BaseResponse<ResetCodeResponse> response=await authRemoteDataSource.restCode(request);
    switch(response){



      case SuccessResponse<ResetCodeResponse>():
        return SuccessResponse(response.data.toEntity());

      case ErrorResponse<ResetCodeResponse>():
        return ErrorResponse(errMessage: response.errMessage);
    }


  }

  @override
  Future<BaseResponse<ForgetPasswordEntity>> resetPassword(String email, String newPassword)async {


    final request=
    ResetPasswordRequest(email: email,newPassword:newPassword );

    BaseResponse<ResetPasswordResponse> response=await authRemoteDataSource.restPassword(request);

    switch(response){



      case SuccessResponse<ResetPasswordResponse>():
        return SuccessResponse(response.data.toEntity());
      case ErrorResponse<ResetPasswordResponse>():
        return ErrorResponse(errMessage: response.errMessage);
    }


  }



}