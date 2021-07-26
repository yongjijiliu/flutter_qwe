import 'package:flutter/material.dart';
import 'package:flutter_qwe/api/api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  late AnimationController animationController;

  @override
  void onReady() {
    super.onReady();
    // 请求用户信息  并存储到 本地 缓存中
  }

  @override
  void onInit() {
    animationController = AnimationController(vsync: this);

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }
}
