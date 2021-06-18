import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_qwe/modules/home/home_controller.dart';
import 'package:flutter_qwe/widgets/appbar_widget/appbar_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return AppbarWidgetScreen(title: '主页', body: _buildBody());
  }

  Widget _buildBody() {
    return Container(
      child: Text('主页'),
    );
  }
}
