import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/profile/domain/entities/Profile_entities.dart';

abstract class ProfileRepo {
   Future<BaseResponse<ProfileEntities>>getUserInfo();
}
