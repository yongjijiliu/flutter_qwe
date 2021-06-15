import 'package:flutter_qwe/api/api_constants.dart';
import 'package:flutter_qwe/api/interceptors/request_interceptor.dart';
import 'package:flutter_qwe/api/interceptors/response_interceptor.dart';
import 'package:get/get.dart';

import 'interceptors/auth_interceptor.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }
}
