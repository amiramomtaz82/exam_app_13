import 'package:dio/dio.dart';
import 'package:exam_app_13/config/shared_prefrences/shared_prefs.dart';

class SubjectInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)async {
    // TODO: implement onRequest
    super.onRequest(options, handler);
    options.headers.addAll({
      "token":await SharedPrefsUtils().getToken()
    });
  }
}
