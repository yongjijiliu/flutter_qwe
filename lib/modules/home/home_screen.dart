import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_qwe/commom/utils/common_widget.dart';
import 'package:flutter_qwe/modules/home/drawer_list.dart';
import 'package:flutter_qwe/modules/home/home_controller.dart';
import 'package:flutter_qwe/theme/app_theme.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.onWillPopHandle(),
      child: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        title: Text('测试'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () => {
              Scaffold.of(context).openDrawer(),
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildAvatar(),
            _buildDrawerList(),
          ],
        ),
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
            itemCount: controller.drawerList.length,
            itemBuilder: (BuildContext context, int index) {
              return inkwell(controller.drawerList[index]);
            }));
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {},
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: [
                  Container(
                    width: 6.0,
                    height: 46.0,
                  ),
                  const Padding(padding: EdgeInsets.all(4.0)),
                  listData.isAssetsImage
                      ? Container(
                          width: 24,
                          height: 24,
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
}
