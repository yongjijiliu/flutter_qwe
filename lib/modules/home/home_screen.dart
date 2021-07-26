import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_qwe/models/common/bottom_bar_item.dart';
import 'package:flutter_qwe/modules/home/home_controller.dart';
import 'package:flutter_qwe/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_qwe/widgets/tab_icons_widget/tab_icons_widget.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return AppbarWidgetScreen(
      title: '主页',
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
         child: Icon(
          Icons.agriculture_outlined,
          color: Colors.blue,
          size: 24,
        )),
        Expanded(child: Text(
          '精选 | 关注',
          style: TextStyle(fontSize: 18),
        )),
        Expanded(child: Icon(
          Icons.add_circle_sharp,
          color: Colors.black45,
          size: 24,
        ))
      ],
    ));
  }

  Widget _buildHomeBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
      ],
      // currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {},
    );
  }

  Widget _buildBottomNagigationBar(BuildContext context) {
    return SizedBox(
      height: 65,
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          AnimatedBuilder(
            animation: controller.animationController,
            builder: (BuildContext context, Widget? child) {
              return Transform(
                transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                child: PhysicalShape(
                  color: Color(0xFFFFFFFF),
                  elevation: 16.0,
                  clipper: TabClipper(
                      radius: Tween<double>(begin: 0.0, end: 1.0)
                              .animate(CurvedAnimation(
                                  parent: controller.animationController,
                                  curve: Curves.fastOutSlowIn))
                              .value *
                          38.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 62,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8, right: 8, top: 2),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TabIconsWidgetScreen(
                                  bottomBarItem:
                                      BottomBarItem.bottomBarItems[0],
                                ),
                              ),
                              Expanded(
                                child: TabIconsWidgetScreen(
                                  bottomBarItem:
                                      BottomBarItem.bottomBarItems[1],
                                ),
                              ),
                              Expanded(
                                child: TabIconsWidgetScreen(
                                  bottomBarItem:
                                      BottomBarItem.bottomBarItems[2],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  TabClipper({this.radius = 38.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double v = radius * 2;
    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180),
        degreeToRadians(90), false);
    path.arcTo(
        Rect.fromLTWH(
            ((size.width / 2) - v / 2) - radius + v * 0.04, 0, radius, radius),
        degreeToRadians(270),
        degreeToRadians(70),
        false);

    path.arcTo(Rect.fromLTWH((size.width / 2) - v / 2, -v / 2, v, v),
        degreeToRadians(160), degreeToRadians(-140), false);

    path.arcTo(
        Rect.fromLTWH((size.width - ((size.width / 2) - v / 2)) - v * 0.04, 0,
            radius, radius),
        degreeToRadians(200),
        degreeToRadians(70),
        false);
    path.arcTo(Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270), degreeToRadians(90), false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TabClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double redian = (math.pi / 180) * degree;
    return redian;
  }
}
