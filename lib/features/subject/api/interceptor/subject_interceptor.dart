import 'package:dio/dio.dart';
import 'package:exam_app_13/config/shared_prefrences/shared_prefs.dart';

class SubjectInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "token": await SharedPrefsUtils().getToken() ?? "",
    });
    super.onRequest(options, handler);
  }
}
