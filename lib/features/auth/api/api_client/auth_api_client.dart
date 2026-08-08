import 'package:dio/dio.dart';
import 'package:exam_app_13/core/constants/app_strings/endpoints.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';



import '../../../../core/api/api_constants.dart';
import '../../data/model/requests/forget_password_request.dart';
import '../../data/model/requests/login_request.dart';

import '../../data/model/requests/reset_code_request.dart';
import '../../data/model/requests/reset_password_request.dart';
import '../../data/model/responses/auth_response.dart';
import '../../data/model/responses/forget_password_response.dart';
import '../../data/model/responses/reset_code_response.dart';
import '../../data/model/responses/reset_password_response.dart';

import '../../data/model/requests/forget_password_request.dart';
import '../../data/model/requests/login_request.dart';

import '../../data/model/requests/reset_code_request.dart';
import '../../data/model/requests/reset_password_request.dart';
import '../../data/model/responses/auth_response.dart';
import '../../data/model/responses/forget_password_response.dart';
import '../../data/model/responses/reset_code_response.dart';
import '../../data/model/responses/reset_password_response.dart';
import '../../data/models/auth_response_dto.dart';
import '../../data/models/signin_request_dto.dart';
import '../../data/models/signup_request_dto.dart';





part 'auth_api_client.g.dart';
@singleton
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;








  @POST(Endpoints.forgetPasswordEndPoint)
  Future<HttpResponse<ForgetPasswordResponse>> forgetPassword(
      @Body()ForgetPasswordRequest forgetPasswordRequest);


  @POST(Endpoints.resetCodeEndPoint)
  Future<HttpResponse<ResetCodeResponse>> RestCode(
      @Body() ResetCodeRequest restCodRequest);

  @PUT(Endpoints.resetPasswordEndPoint)
  Future<HttpResponse<ResetPasswordResponse>> resetPassword(
      @Body() ResetPasswordRequest restPasswordRequest);


  @POST(ApiConstants.signupEndpoint)
  Future<AuthResponseDto> signup(@Body() SignupRequestDto body);

  @POST(ApiConstants.signinEndpoint)
  Future<AuthResponseDto> signin(@Body() SigninRequestDto body);
}