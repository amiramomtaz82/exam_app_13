import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/profile/data/datasource/remote/user_repo_datasource.dart';
import 'package:exam_app_13/features/profile/data/model/user_dto.dart';
import 'package:exam_app_13/features/profile/domain/entities/Profile_entities.dart';
import 'package:exam_app_13/features/profile/domain/repo/Profile_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImp implements ProfileRepo {
  final UserRepoDatasource userInfo;

  ProfileRepoImp({required this.userInfo});

  @override
  Future<BaseResponse<ProfileEntities>> getUserInfo() async {
    final BaseResponse<UserDto> response = await userInfo.getUserInfo();
    switch (response) {
      case SuccessResponse<UserDto>():
        return SuccessResponse(response.data.todomain());
      case ErrorResponse<UserDto>():
        return ErrorResponse(error: response.error, errMessage: response.errMessage);
    }
  }
}
