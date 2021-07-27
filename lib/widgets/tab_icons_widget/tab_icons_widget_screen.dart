import 'package:flutter/material.dart';
import 'package:flutter_qwe/commom/common.dart';
import 'package:flutter_qwe/models/common/bottom_bar_item.dart';
import 'package:flutter_qwe/widgets/tab_icons_widget/tab_icons_widget_controller.dart';
import 'package:get/get.dart';

class TabIconsWidgetScreen extends GetView<TabIconsWidgetController> {
  final BottomBarItem bottomBarItem;

  TabIconsWidgetScreen({required this.bottomBarItem});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: InkWell(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.blue,
          hoverColor: Colors.transparent,
          onTap: () {
            if (this.bottomBarItem.isSelected) {
              // this.bottomBarItem.animationController!.forward();
              ToastUtil.show("按钮被调用" + this.bottomBarItem.imagePath);
            }
          },
          child: IgnorePointer(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.88, end: 1.0).animate(
                      CurvedAnimation(
                          parent: controller.animationController,
                          curve:
                              Interval(0.1, 1.0, curve: Curves.fastOutSlowIn))),
                  child: Image.asset(this.bottomBarItem.isSelected
                      ? this.bottomBarItem.selectedImagePath
                      : this.bottomBarItem.imagePath),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
