import 'package:flutter/cupertino.dart';
import 'package:flutter_qwe/api/api.dart';
import 'package:flutter_qwe/commom/utils/app_focus.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final ApiRepository apiRepository;
  AuthController({required this.apiRepository});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  void login(BuildContext context) async {
    AppFocus.unfocus(context);
    // 请求服务端  获取 数据
    if (loginFormKey.currentState!.validate()) {}
  }
}
