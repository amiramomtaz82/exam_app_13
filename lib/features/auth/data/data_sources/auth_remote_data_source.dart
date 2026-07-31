
import 'package:exam_app_13/core/base/result.dart';
import 'package:exam_app_13/features/auth/data/models/signin_request_dto.dart';
import 'package:exam_app_13/features/auth/data/models/signup_request_dto.dart';
import 'package:exam_app_13/features/auth/domain/models/auth_result_entity.dart';

abstract class AuthRemoteDataSource {
  Future<Result<AuthResultEntity>> signin(SigninRequestDto request);
  Future<Result<AuthResultEntity>> signup(SignupRequestDto request);
}
