import 'package:flutter_qwe/api/base_provider.dart';
import 'package:flutter_qwe/models/login/login_request.dart';
import 'package:get/get.dart';

class ApiProvider extends BaseProvider {
  /// 登录
  Future<Response> login(String path,LoginRequestModel data){
    return post(path, data.toJson());
  }
  
}