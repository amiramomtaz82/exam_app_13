import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/profile/domain/entities/Profile_entities.dart';

abstract class ProfileRepo {
  Future<BaseResponse<ProfileEntities>> getUserInfo();

  Future<BaseResponse<ProfileEntities>> editUserProfile({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? username,
  });

  Future<BaseResponse<void>> editUserPassword({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
  });
}
