import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> requestInterceptor(request) async {
  // final token = StorageService.box.pull(StorageItems.accessToken);
  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';

  request.headers['Content-Type'] = 'application/json;charset=utf-8';
  EasyLoading.show(status: 'loading...');
  // 请求前 判断 token 是否为空   如果为空的话
  return request;
}
