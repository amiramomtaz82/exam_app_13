import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';


import '../../data/model/request/login_request.dart';
import '../../data/model/response/auth_response.dart';





part 'auth_api_client.g.dart';
@singleton
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;


  @POST("api/v1/auth/signin")
  Future<HttpResponse<AuthResponse>> login(@Body() LoginRequest loginRequest);


}