import 'package:exam_app/core/base/result.dart';
import 'package:exam_app/feature/auth/login&&regestier/domain/models/auth_result_entity.dart';

abstract class AuthRepository {
  Future<Result<AuthResultEntity>> signin({
    required String email,
    required String password,
  });

  Future<Result<AuthResultEntity>> signup({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });
}
