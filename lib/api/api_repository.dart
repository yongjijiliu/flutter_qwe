import 'package:flutter_qwe/api/api_provider.dart';
import 'package:flutter_qwe/models/login/captcha_response.dart';
import 'package:flutter_qwe/models/login/login_request.dart';
import 'package:flutter_qwe/models/login/login_response.dart';

class ApiRepository {
  final ApiProvider apiProvider;
  ApiRepository({required this.apiProvider});

  Future<LoginResponseModel?> login(LoginRequestModel data) async {
    final res = await apiProvider.login('/login', data);
    if (res.statusCode == 200) {
      return LoginResponseModel.fromJson(res.body);
    }
  }

  Future<CaptchaResponseModel?> captchaImage() async {
    final res = await apiProvider.captchaImage("/captchaImage");
    if (res.statusCode == 200) {
      return CaptchaResponseModel.fromJson(res.body);
    }
  }
}
