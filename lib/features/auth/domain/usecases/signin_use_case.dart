import 'package:exam_app/core/base/result.dart';
import 'package:exam_app/feature/auth/login&&regestier/domain/models/auth_result_entity.dart';
import 'package:exam_app/feature/auth/login&&regestier/domain/repository/auth_repository.dart';
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
