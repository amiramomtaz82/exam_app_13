import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/profile/domain/repo/Profile_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class EditPasswordUsecases {
  EditPasswordUsecases(this.profileRepo);
  final ProfileRepo profileRepo;

  Future<BaseResponse<void>> call({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
  }) {
    return profileRepo.editUserPassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      rePassword: rePassword,
    );
  }
}
