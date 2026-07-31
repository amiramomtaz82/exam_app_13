import 'package:dio/dio.dart';
import 'package:exam_app/core/api/api_constants.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      )..interceptors.add(
          LogInterceptor(
            requestBody: true,
            responseBody: true,
          ),
        );
}
