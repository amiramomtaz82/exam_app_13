import 'package:dio/dio.dart';
import 'package:exam_app_13/config/shared_prefrences/shared_prefs.dart';
import 'package:exam_app_13/core/constants/app_strings/app_strings.dart';

class UserInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // TODO: implement onRequest
    super.onRequest(options, handler);
    options.headers.addAll({
      AppStrings.token: await SharedPrefsUtils().getToken(),
    });
  }
}
