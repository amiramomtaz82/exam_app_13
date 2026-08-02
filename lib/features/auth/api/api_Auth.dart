import 'package:dio/dio.dart';
import 'package:exam_app/core/api/api_constants.dart';
import 'package:exam_app/feature/auth/login&&regestier/data/models/auth_response_dto.dart';
import 'package:exam_app/feature/auth/login&&regestier/data/models/signin_request_dto.dart';
import 'package:exam_app/feature/auth/login&&regestier/data/models/signup_request_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_Auth.g.dart';

@lazySingleton
@RestApi()
abstract class ApiAuth {
  @factoryMethod
  factory ApiAuth(Dio dio) = _ApiAuth;

  @POST(ApiConstants.signupEndpoint)
  Future<AuthResponseDto> signup(@Body() SignupRequestDto body);

  @POST(ApiConstants.signinEndpoint)
  Future<AuthResponseDto> signin(@Body() SigninRequestDto body);
}
