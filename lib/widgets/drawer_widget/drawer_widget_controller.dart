import 'package:flutter/material.dart';
import 'package:flutter_qwe/api/api.dart';
import 'package:flutter_qwe/routes/app_pages.dart';
import 'package:get/get.dart';

import 'drawer_list.dart';

class CommonDrawerController extends GetxController {
  final ApiRepository apiRepository;
  CommonDrawerController({required this.apiRepository});

  List<DrawerList>? drawerList;

  @override
  void onInit() {
    setDrawerListArray();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setDrawerListArray() {
    this.drawerList = <DrawerList>[
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

  Future onRouteTo(DrawerList drawerList) {
    if (drawerList.index == DrawerIndex.Help) {
      Get.toNamed(Routes.Help);
    } else {
      Get.toNamed(Routes.Home);
    }
    return Future.value();
  }
}
