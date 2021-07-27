import 'package:flutter/animation.dart';
import 'package:flutter_qwe/api/api.dart';
import 'package:get/get.dart';

class TabIconsWidgetController extends GetxController
    with SingleGetTickerProviderMixin {
  final ApiRepository apiRepository;
  TabIconsWidgetController({required this.apiRepository});

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  late AnimationController animationController;

  @override
  void onInit() {
    animationController = AnimationController(
      duration: const Duration(microseconds: 400),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {}
      });
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
