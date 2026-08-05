import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/config/shared_prefrences/shared_prefs.dart';
import 'package:exam_app_13/features/profile/data/datasource/remote/user_repo_datasource.dart';
import 'package:exam_app_13/features/profile/data/model/edit_Pass_Req.dart';
import 'package:exam_app_13/features/profile/data/model/edit_Password_Req.dart';
import 'package:exam_app_13/features/profile/data/model/edit_profile_request_dto.dart';
import 'package:exam_app_13/features/profile/data/model/user_dto.dart';
import 'package:exam_app_13/features/profile/domain/entities/Profile_entities.dart';
import 'package:exam_app_13/features/profile/domain/repo/Profile_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImp implements ProfileRepo {
  final UserRepoDatasource userRepo;
  final SharedPrefsUtils sharedPrefsUtils;

  ProfileRepoImp({required this.userRepo, required this.sharedPrefsUtils});

  @override
  Future<BaseResponse<ProfileEntities>> getUserInfo() async {
    final BaseResponse<UserDto> response = await userRepo.getUserInfo();
    return _mapUserResponse(response);
  }

  @override
  Future<BaseResponse<ProfileEntities>> editUserProfile({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? username,
  }) async {
    final BaseResponse<UserDto> response = await userRepo.editUserProfile(
      EditProfileRequestDto(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        username: username,
      ),
    );
    return _mapUserResponse(response);
  }

  @override
  Future<BaseResponse<void>> editUserPassword({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
  }) async {
    final BaseResponse<EditPassRespone> response = await userRepo
        .editUserPassword(
      PassReq(
        oldPassword: oldPassword,
        password: newPassword,
        rePassword: rePassword,
      ),
    );
    switch (response) {
      case SuccessResponse<EditPassRespone>():
        final String? newToken = response.data.token;
        if (newToken != null && newToken.isNotEmpty) {
          await sharedPrefsUtils.saveToken(newToken);
        }
        return SuccessResponse<void>(null);
      case ErrorResponse<EditPassRespone>():
        return ErrorResponse(
          error: response.error,
          errMessage: response.errMessage,
        );
    }
  }

  BaseResponse<ProfileEntities> _mapUserResponse(
    BaseResponse<UserDto> response,
  ) {
    switch (response) {
      case SuccessResponse<UserDto>():
        return SuccessResponse(response.data.todomain());
      case ErrorResponse<UserDto>():
        return ErrorResponse(
          error: response.error,
          errMessage: response.errMessage,
        );
    }
  }
}
