import 'package:get/get.dart';

import 'help_controller.dart';

class HelpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpController>(
        () => HelpController(apiRepository: Get.find()));
  }
}
