import 'package:flutter/material.dart';
import 'package:flutter_qwe/commom/utils/common_widget.dart';
import 'package:flutter_qwe/commom/utils/toast_util.dart';
import 'package:flutter_qwe/theme/app_theme.dart';
import 'package:get/get.dart';

import 'drawer_widget_controller.dart';
import 'drawer_list.dart';

class DrawerScreen extends GetView<CommonDrawerController> {
  @override
  Widget build(BuildContext context) {
    return _buildWidget(context);
  }

  Widget _buildWidget(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              // 绘制头像部分
              _buildAvatar(),
            ],
          ),
          // 绘制功能按钮部分
          _buildDrawerList(),
          // 绘制退出按钮
          _buildExit(context),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, boxShadow: <BoxShadow>[
                BoxShadow(
                    color: AppTheme.grey.withOpacity(0.6),
                    offset: const Offset(2.0, 4.0),
                    blurRadius: 8),
              ]),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                child: Image.asset('assets/images/userImage.png'),
              ),
            ),
            CommonWidget.rowHeight(),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 4),
              child: Text(
                '测试用户',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.grey,
                    fontSize: 18),
              ),
            ),
            CommonWidget.rowHeight(),
            Divider(
              height: 1,
              color: AppTheme.grey.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerList() {
    return Expanded(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(0.0),
            shrinkWrap: true,
            itemCount: controller.drawerList!.length,
            itemBuilder: (BuildContext context, int index) {
              return inkwell(controller.drawerList![index]);
            }));
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          // 跳转到指定页面
          controller.onRouteTo(listData);
        },
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: [
                  Container(
                    width: 6.0,
                    height: 36.0,
                  ),
                  const Padding(padding: EdgeInsets.all(4.0)),
                  listData.isAssetsImage
                      ? Container(
                          width: 18,
                          height: 18,
                          child: Image.asset(
                            listData.imageName,
                            color: AppTheme.nearlyBlack,
                          ),
                        )
                      : Icon(
                          listData.icon.icon,
                          color: AppTheme.nearlyBlack,
                        ),
                  const Padding(padding: EdgeInsets.all(4.0)),
                  Text(
                    listData.labelName,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppTheme.nearlyBlack),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildExit(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            '退出',
            style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppTheme.darkText),
            textAlign: TextAlign.left,
          ),
          trailing: Icon(
            Icons.power_settings_new,
            color: Colors.red,
          ),
          onTap: () {
            ToastUtil.show("退出按钮被点击");
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom,
        )
      ],
    );
  }
}
