import 'package:dio/dio.dart';
import 'package:exam_app_13/features/subject/api/interceptor/subject_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


import '../../core/constants/app_strings/endpoints.dart';


@module
abstract class DioModule {
  @singleton
  Dio get dio {
    final dioInstance = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dioInstance.interceptors.add(SubjectInterceptor());
    dioInstance.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: false,
      ),
    );

    return dioInstance;
  }
}