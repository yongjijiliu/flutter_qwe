import 'package:flutter/material.dart';

class BottomBarItem {
  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;
  AnimationController? animationController;
  BottomBarItem({
    this.imagePath = '',
    this.selectedImagePath = '',
    this.isSelected = false,
    this.index = 0,
    this.animationController,
  });

  static List<BottomBarItem> bottomBarItems = <BottomBarItem>[
    BottomBarItem(
      imagePath: 'assets/home_bottom_items/tab_1.png',
      selectedImagePath: 'assets/home_bottom_items/tab_1s.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    BottomBarItem(
      imagePath: 'assets/home_bottom_items/tab_2.png',
      selectedImagePath: 'assets/home_bottom_items/tab_2s.png',
      index: 1,
      isSelected: true,
      animationController: null,
    ),
    BottomBarItem(
      imagePath: 'assets/home_bottom_items/tab_3.png',
      selectedImagePath: 'assets/home_bottom_items/tab_3s.png',
      index: 2,
      isSelected: true,
      animationController: null,
    ),
    BottomBarItem(
      imagePath: 'assets/home_bottom_items/tab_4.png',
      selectedImagePath: 'assets/home_bottom_items/tab_4s.png',
      index: 3,
      isSelected: true,
      animationController: null,
    ),
  ];
}
