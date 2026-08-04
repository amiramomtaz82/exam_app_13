import 'package:exam_app_13/core/base/result.dart';
import 'package:exam_app_13/features/auth/domain/models/auth_result_entity.dart';
import 'package:exam_app_13/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SigninUseCase {
  final AuthRepository _repository;

  const SigninUseCase(this._repository);

  Future<Result<AuthResultEntity>> call({
    required String email,
    required String password,
  }) {
    return _repository.signin(email: email, password: password);
  }
}
