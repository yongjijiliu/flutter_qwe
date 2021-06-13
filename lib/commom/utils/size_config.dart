import 'package:flutter/cupertino.dart';

class SizeConfig {
  SizeConfig._();
  static SizeConfig _instance = SizeConfig._();
  factory SizeConfig() => _instance;

  late MediaQueryData _mediaQueryData;
  late double screenWidth;
  late double screenHeight;

  late double refHeight;
  late double refWidth;

  late double blockSizeHorizontal;
  late double blockSizeVertical;

  late double _safeAreaHorizontal;
  late double _safeAreaVertical;
  late double safeBlockHorizontal;
  late double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    refHeight = 1450;
    refWidth = 670;

    if (screenHeight < 1200) {
      blockSizeHorizontal = screenHeight / 100;
      blockSizeVertical = screenWidth / 100;

      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    } else {
      blockSizeHorizontal = screenWidth / 120;
      blockSizeVertical = screenHeight / 120;

      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 120;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 120;
    }
  }
}
