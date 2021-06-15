import 'package:flutter/cupertino.dart';
import 'package:flutter_qwe/api/api.dart';
import 'package:flutter_qwe/commom/constants/storage_constants.dart';
import 'package:flutter_qwe/commom/utils/app_focus.dart';
import 'package:flutter_qwe/models/login/login_request.dart';
import 'package:flutter_qwe/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final ApiRepository apiRepository;
  AuthController({required this.apiRepository});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginNameController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final loginCodeController = TextEditingController();

  late Image captcherImage;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    var res = await apiRepository.captchaImage();
    if (res!.img.isNotEmpty) {
      captcherImage = Image.memory(res.img);
    }
  }

  void login(BuildContext context) async {
    AppFocus.unfocus(context);
    // 请求服务端  获取 数据
    if (loginFormKey.currentState!.validate()) {
      final res = await apiRepository.login(LoginRequestModel(
        username: loginNameController.text,
        password: loginPasswordController.text,
      ));
      // 本地持久化实例
      final prefs = Get.find<SharedPreferences>();
      if (res!.token.isNotEmpty) {
        prefs.setString(StorageConstants.token, res.token);
        Get.toNamed(Routes.Home);
      } else {
        Get.toNamed(Routes.Auth);
      }
    }
  }
}
