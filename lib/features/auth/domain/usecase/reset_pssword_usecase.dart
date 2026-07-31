import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';

import '../entity/forget_password_entity.dart';
import '../repo/auth_repo.dart';

@lazySingleton
class ResetPasswordUsecase {
  AuthRepo authRepo;

  ResetPasswordUsecase(this.authRepo);

  Future<BaseResponse<ForgetPasswordEntity>>
  call(String email,String newPassword)  => authRepo.resetPassword(email, newPassword);

}