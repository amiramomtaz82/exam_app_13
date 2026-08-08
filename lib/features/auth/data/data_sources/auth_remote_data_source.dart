import 'package:exam_app/core/base/result.dart';
import 'package:exam_app/feature/auth/login&&regestier/data/models/signin_request_dto.dart';
import 'package:exam_app/feature/auth/login&&regestier/data/models/signup_request_dto.dart';
import 'package:exam_app/feature/auth/login&&regestier/domain/models/auth_result_entity.dart';

abstract class AuthRemoteDataSource {
  Future<Result<AuthResultEntity>> signin(SigninRequestDto request);
  Future<Result<AuthResultEntity>> signup(SignupRequestDto request);
}
