import 'package:dio/dio.dart';
import 'package:exam_app/core/base/result.dart';
import 'package:exam_app/feature/auth/login&&regestier/api/api_Auth.dart';
import 'package:exam_app/feature/auth/login&&regestier/data/data_sources/auth_remote_data_source.dart';
import 'package:exam_app/feature/auth/login&&regestier/data/models/auth_response_dto.dart';
import 'package:exam_app/feature/auth/login&&regestier/data/models/signin_request_dto.dart';
import 'package:exam_app/feature/auth/login&&regestier/data/models/signup_request_dto.dart';
import 'package:exam_app/feature/auth/login&&regestier/domain/models/auth_result_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiAuth _apiAuth;

  const AuthRemoteDataSourceImpl(this._apiAuth);

  @override
  Future<Result<AuthResultEntity>> signin(SigninRequestDto request) async {
    try {
      final response = await _apiAuth.signin(request);
      return Success(response.toDomain());
    } on DioException catch (e) {
      return ServerFailure(_extractErrorMessage(e));
    } catch (e) {
      return ServerFailure(e.toString());
    }
  }

  @override
  Future<Result<AuthResultEntity>> signup(SignupRequestDto request) async {
    try {
      final response = await _apiAuth.signup(request);
      return Success(response.toDomain());
    } on DioException catch (e) {
      return ServerFailure(_extractErrorMessage(e));
    } catch (e) {
      return ServerFailure(e.toString());
    }
  }

  String _extractErrorMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic> && data.containsKey('message')) {
      return data['message'] as String;
    }
    return e.message ?? 'An unexpected error occurred';
  }
}
