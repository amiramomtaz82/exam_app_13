import 'package:dio/dio.dart';
import 'package:exam_app_13/config/shared_prefrences/shared_prefs.dart';
import 'package:exam_app_13/core/constants/app_strings/app_strings.dart';

class UserInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await SharedPrefsUtils().getToken();
    if (token != null && token.isNotEmpty) {
      options.headers[AppStrings.token] = token;
    }
    handler.next(options);
  }
}
