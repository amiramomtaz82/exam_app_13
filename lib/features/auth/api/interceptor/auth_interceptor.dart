import 'package:dio/dio.dart';

import '../../../../config/shared_prefrences/shared_prefs.dart';

class AuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "token": await SharedPrefsUtils().getToken()
    });
    super.onRequest(options, handler);
  }
}