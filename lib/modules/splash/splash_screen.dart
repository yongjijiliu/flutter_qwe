import 'package:flutter/material.dart';
import 'package:flutter_qwe/commom/common.dart';
import 'package:flutter_qwe/commom/utils/size_config.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.hourglass_bottom,
            color: ColorConstants.darkGray,
            size: 30.0,
          ),
          Text(
            'load'.tr,
            style: TextStyle(fontSize: 30.0),
          )
        ],
      ),
    );
  }
}
