import 'dart:ui';

import 'package:flutter_qwe/commom/constants/storage_constants.dart';
import 'package:flutter_qwe/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

///splash 逻辑控制实现 类
class SplashController extends GetxController {
  @override
  void onReady() async {
    //
    super.onReady();
    // 设置为 中文显示
    var locale = Locale('zh', 'CN');
    Get.updateLocale(locale);

    await Future.delayed(Duration(milliseconds: 2000));
    var storage = Get.find<SharedPreferences>();
    try {
      if (storage.getString(StorageConstants.token) != null) {
        Get.toNamed(Routes.Home);
      } else {
        Get.toNamed(Routes.Auth);
      }
    } catch (e) {
      Get.toNamed(Routes.Login);
    }
  }
}
