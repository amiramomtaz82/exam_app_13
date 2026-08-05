import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/profile/domain/entities/profile_entities.dart';
import 'package:exam_app_13/features/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class EditProfileUsecases {
  EditProfileUsecases(this.profileRepo);
  final ProfileRepo profileRepo;

  Future<BaseResponse<ProfileEntities>> call({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? username,
  }) {
    return profileRepo.editUserProfile(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      username: username,
    );
  }
}
