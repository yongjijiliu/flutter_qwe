import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_qwe/app_binding.dart';
import 'package:flutter_qwe/di.dart';
import 'package:flutter_qwe/lang/translation_service.dart';
import 'package:flutter_qwe/theme/theme_data.dart';
import 'package:get/get.dart';

import 'commom/common.dart';
import 'routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DenpendencyInjection.init();
  runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: Routes.Splash,
        defaultTransition: Transition.fade,
        getPages: AppPages.routes,
        initialBinding: AppBinding(),
        smartManagement: SmartManagement.keepFactory,
        title: "qwe",
        theme: ThemeConfig.lightTheme,
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),
        builder: EasyLoading.init(),       

    );
  }
}


void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    ..backgroundColor = ColorConstants.lightGray
    ..indicatorColor = hexToColor('#64DEE0')
    ..textColor = hexToColor('#64DEE0')
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}