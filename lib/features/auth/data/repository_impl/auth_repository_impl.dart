import 'package:exam_app/core/base/result.dart';
import 'package:exam_app/feature/auth/login&&regestier/data/data_sources/auth_remote_data_source.dart';
import 'package:exam_app/feature/auth/login&&regestier/data/models/signin_request_dto.dart';
import 'package:exam_app/feature/auth/login&&regestier/data/models/signup_request_dto.dart';
import 'package:exam_app/feature/auth/login&&regestier/domain/models/auth_result_entity.dart';
import 'package:exam_app/feature/auth/login&&regestier/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  const AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<AuthResultEntity>> signin({
    required String email,
    required String password,
  }) {
    return _remoteDataSource.signin(
      SigninRequestDto(email: email, password: password),
    );
  }

  @override
  Future<Result<AuthResultEntity>> signup({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) {
    return _remoteDataSource.signup(
      SignupRequestDto(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      ),
    );
  }
}
