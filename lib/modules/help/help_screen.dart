import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qwe/modules/help/help_controller.dart';
import 'package:flutter_qwe/widgets/appbar_widget/appbar_widget_screen.dart';
import 'package:get/get.dart';

class HelpScreen extends GetView<HelpController> {
  @override
  Widget build(BuildContext context) {
    return AppbarWidgetScreen(
      title: '帮助',
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Text('帮助主页'),
    );
  }
}
