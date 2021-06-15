import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qwe/api/api.dart';
import 'package:flutter_qwe/commom/utils/toast_util.dart';
import 'package:get/get.dart';

import 'drawer_list.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  DateTime? lastPopTime;
  late List<DrawerList> drawerList;
  @override
  void onReady() {
    super.onReady();
    // 请求用户信息  并存储到 本地 缓存中
  }

  @override
  void onInit() {
    setDrawerListArray();
    super.onInit();
  }

  void setDrawerListArray() {
    drawerList = <DrawerList>[
      DrawerList(
        index: DrawerIndex.HOME,
        labelName: '主页',
        icon: Icon(Icons.home),
      ),
      DrawerList(
        index: DrawerIndex.Help,
        labelName: '帮助',
        isAssetsImage: true,
        imageName: 'assets/images/supportIcon.png',
        icon: Icon(Icons.help),
      ),
      DrawerList(
        index: DrawerIndex.FeedBack,
        labelName: '反馈',
        icon: Icon(Icons.help),
      ),
      DrawerList(
        index: DrawerIndex.Invite,
        labelName: '邀请 好友',
        icon: Icon(Icons.group),
      ),
      DrawerList(
        index: DrawerIndex.Share,
        labelName: 'app 打分',
        icon: Icon(Icons.share),
      ),
      DrawerList(
        index: DrawerIndex.About,
        labelName: '联系我们',
        icon: Icon(Icons.info),
      ),
    ];
  }

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
