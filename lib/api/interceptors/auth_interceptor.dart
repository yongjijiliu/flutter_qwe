
import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';

/// 权限拦截器
FutureOr<Request> authInterceptor(request) async{

  // final token = StorageService.box.pull(StorageItems.accessToken);

  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';

  return request;
}