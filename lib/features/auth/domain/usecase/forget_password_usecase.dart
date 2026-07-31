import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';

import '../repo/auth_repo.dart';
import '../entity/forget_password_entity.dart';
@lazySingleton
class ForgetPasswordUsecase {
  AuthRepo authRepo;
  ForgetPasswordUsecase(this.authRepo);

  Future<BaseResponse<ForgetPasswordEntity>>  call (String email)=> authRepo.forgetPassword(email);



}