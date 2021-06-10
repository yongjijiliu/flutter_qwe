import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_qwe/modules/home/home_controller.dart';
import 'package:get/get.dart';


class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => _buildWidget()),
    );
  }

  Widget _buildWidget(){
    return Scaffold(
      body: Center(child: Text('主页'),),
    );
  }
}