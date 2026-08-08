import 'package:dio/dio.dart';

import '../../../../config/shared_prefrences/shared_prefs.dart';

class AuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {

    final token= await SharedPrefsUtils().getToken();
    options.headers.addAll({

      "token": token??"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhNmMzYzUyZDJlYTA3MjY4ZmIyZjA0NiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzg1Njc2MzI1fQ.S_7Ay3yIYDgRS8IeIYIRxunmM2jlBSiBblZ6zRQg7kU"
    });
    super.onRequest(options, handler);
  }
}