import 'package:flutter_qwe/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {

  @override
  void dependencies() {
    // 注入 splash 逻辑控制类
    Get.put<SplashController>(SplashController());
  }
  
}