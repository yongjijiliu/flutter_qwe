import 'package:flutter/material.dart';
import 'package:flutter_qwe/theme/app_theme.dart';
import 'package:flutter_qwe/widgets/appbar_widget/appbar_widget_controller.dart';
import 'package:flutter_qwe/widgets/drawer_widget/drawer_widget.dart';
import 'package:get/get.dart';

class AppbarWidgetScreen extends GetView<AppbarWidgetController> {
  final String title;
  final Widget body;
  final Widget? bottomBar;
  const AppbarWidgetScreen(
      {required this.title, required this.body, this.bottomBar});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.onWillPopHandle(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.white,
          elevation: 0,
          title: Text(
            title.tr,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          toolbarHeight: AppBar().preferredSize.height - 10,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => {
                // 打开侧边栏
                Scaffold.of(context).openDrawer(),
              },
            ),
          ),
        ),
        drawer: DrawerScreen(),
        body: body,
        bottomNavigationBar: bottomBar,
      ),
    );
  }
}
