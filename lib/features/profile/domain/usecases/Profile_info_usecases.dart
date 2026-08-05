import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/profile/domain/entities/profile_entities.dart';
import 'package:exam_app_13/features/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ProfileInfoUsecases {
  ProfileInfoUsecases(this.profileRepo);
  final ProfileRepo profileRepo;

  Future<BaseResponse<ProfileEntities>> call() {
    return profileRepo.getUserInfo();
  }
}
