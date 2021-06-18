import 'package:flutter/services.dart';
import 'package:flutter_qwe/api/api.dart';
import 'package:flutter_qwe/commom/utils/toast_util.dart';
import 'package:get/get.dart';

class AppbarWidgetController extends GetxController {
  final ApiRepository apiRepository;
  AppbarWidgetController({required this.apiRepository});

  DateTime? lastPopTime;

  // 点击返回键的操作
  Future<bool> onWillPopHandle() {
    // 点击返回键的操作
    if (lastPopTime == null ||
        DateTime.now().difference(lastPopTime!) > Duration(seconds: 2)) {
      lastPopTime = DateTime.now();
      ToastUtil.show("再按一次退出应用");
      return Future.value(false);
    } else {
      lastPopTime = DateTime.now();
      // 退出app
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return Future.value(true);
    }
  }
}
