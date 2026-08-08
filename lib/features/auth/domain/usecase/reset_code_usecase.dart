import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';

import '../entity/forget_password_entity.dart';
import '../repo/auth_repo.dart';

@injectable
class ResetCodeUsecase {

  AuthRepo authRepo;
  ResetCodeUsecase (this.authRepo);

  Future<BaseResponse<ForgetPasswordEntity>> call(String code)=>authRepo.resetCode(code);




}