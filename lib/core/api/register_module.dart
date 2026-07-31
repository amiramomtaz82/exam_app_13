import 'package:dio/dio.dart';
import 'package:exam_app_13/core/api/api_constants.dart';

abstract class RegisterModule {
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

