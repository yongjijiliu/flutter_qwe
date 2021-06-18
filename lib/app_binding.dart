import 'package:flutter_qwe/widgets/drawer_widget/drawer_widget.dart';
import 'package:get/get.dart';

import 'api/api_provider.dart';
import 'api/api_repository.dart';
import 'widgets/appbar_widget/appbar_widget.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider(), permanent: true);
    Get.put(ApiRepository(apiProvider: Get.find()), permanent: true);
    Get.lazyPut<CommonDrawerController>(
        () => CommonDrawerController(apiRepository: Get.find()));
    Get.lazyPut<AppbarWidgetController>(
        () => AppbarWidgetController(apiRepository: Get.find()));
  }
}
