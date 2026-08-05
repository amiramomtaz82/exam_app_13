import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/profile/domain/entities/Profile_entities.dart';
import 'package:exam_app_13/features/profile/domain/repo/Profile_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ProfileInfoUsecases {
  ProfileInfoUsecases(this.profileRepo);
  final ProfileRepo profileRepo;

  Future<BaseResponse<ProfileEntities>> call() {
    return profileRepo.getUserInfo();
  }
}
