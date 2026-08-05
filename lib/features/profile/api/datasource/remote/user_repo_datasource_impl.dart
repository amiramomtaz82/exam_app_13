import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/profile/api/client/profile_api_client.dart';
import 'package:exam_app_13/features/profile/data/datasource/remote/user_repo_datasource.dart';
import 'package:exam_app_13/features/profile/data/model/edit_pass_req.dart';
import 'package:exam_app_13/features/profile/data/model/edit_password_req.dart';
import 'package:exam_app_13/features/profile/data/model/edit_profile_request_dto.dart';
import 'package:exam_app_13/features/profile/data/model/user_dto.dart';
import 'package:exam_app_13/features/profile/data/model/user_info_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepoDatasource)
class UserRepoDatasourceImp implements UserRepoDatasource {
  UserRepoDatasourceImp(this.userApi);
  final UserProfileApi userApi;

  @override
  Future<BaseResponse<UserDto>> getUserInfo() async {
    try {
      final UserInfoResponse response = await userApi.getUserInfo();
      final UserDto? user = response.user;
      if (user == null) {
        return ErrorResponse(errMessage: response.message);
      }
      return SuccessResponse(user);
    } on Exception catch (error) {
      return ErrorResponse(error: error);
    }
  }
  @override
  Future<BaseResponse<UserDto>> editUserProfile(EditProfileRequestDto req) async {
  try {
      final UserInfoResponse response = await userApi.editUserProfile(req);
      final UserDto? user = response.user;
      if (user == null) {
        return ErrorResponse(errMessage: response.message);
      }
      return SuccessResponse(user);
    } on Exception catch (error) {
      return ErrorResponse(error: error);
    }
  }

  @override
  Future<BaseResponse<EditPassRespone>> editUserPassword(PassReq req) async {
  try {
      final EditPassRespone response = await userApi.editUserPassword(req); 
    return SuccessResponse(response);
    } on Exception catch (error) {
      return ErrorResponse(error: error);
    }
  }
  
}
