import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/profile/data/model/edit_Pass_Req.dart';
import 'package:exam_app_13/features/profile/data/model/edit_Password_Req.dart';
import 'package:exam_app_13/features/profile/data/model/edit_profile_request_dto.dart';
import 'package:exam_app_13/features/profile/data/model/user_dto.dart';

abstract class UserRepoDatasource {
  Future<BaseResponse<UserDto>> getUserInfo();
  Future<BaseResponse<UserDto>> editUserProfile(EditProfileRequestDto req);
  Future<BaseResponse<EditPassRespone>> editUserPassword(PassReq req);
}
