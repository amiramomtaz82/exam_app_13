import 'package:dio/dio.dart';
import 'package:exam_app_13/core/constants/app_strings/endpoints.dart';
import 'package:exam_app_13/features/profile/data/model/edit_Pass_Req.dart';
import 'package:exam_app_13/features/profile/data/model/edit_Password_Req.dart';
import 'package:exam_app_13/features/profile/data/model/edit_profile_request_dto.dart';
import 'package:exam_app_13/features/profile/data/model/user_info_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'profile_api_client.g.dart';

@singleton
@RestApi()
abstract class UserProfileApi {
  @factoryMethod
  factory UserProfileApi(Dio dio, {@ignoreParam String? baseUrl}) =
      _UserProfileApi;

  @GET(Endpoints.getUserInfo)
  Future<UserInfoResponse> getUserInfo();

  @PUT(Endpoints.editUserProfile)
  Future<UserInfoResponse> editUserProfile(
    @Body() EditProfileRequestDto request,
  );

  @PUT(Endpoints.editUserPass)
  Future<EditPassRespone> editUserPassword(
    @Body() PassReq request,
  );

  
}
