import 'package:exam_app_13/core/base/result.dart';
import 'package:exam_app_13/features/auth/domain/models/auth_result_entity.dart';
import 'package:exam_app_13/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUseCase {
  final AuthRepository _repository;

  const SignupUseCase(this._repository);

  Future<Result<AuthResultEntity>> call({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) {
    return _repository.signup(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}
