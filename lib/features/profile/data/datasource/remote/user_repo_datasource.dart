import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/profile/data/model/user_dto.dart';

abstract class UserRepoDatasource {
  Future<BaseResponse<UserDto>> getUserInfo();
}
