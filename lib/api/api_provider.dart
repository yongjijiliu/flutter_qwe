import 'dart:developer';

import 'package:flutter_qwe/api/base_provider.dart';
import 'package:flutter_qwe/models/login/login_request.dart';
import 'package:get/get.dart';

class ApiProvider extends BaseProvider {
  /// 登录
  Future<Response> login(String path, LoginRequestModel data) {
    log('请求路径：' + path + "请求参数：" + data.toJson().toString());
    return post(path, data.toJson());
  }

  // 验证码
  Future<Response> captchaImage(String path) {
    return get(path);
  }
}
