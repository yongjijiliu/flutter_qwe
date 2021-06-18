import 'package:flutter_qwe/modules/auth/auth_binding.dart';
import 'package:flutter_qwe/modules/auth/auth_srceen.dart';
import 'package:flutter_qwe/modules/help/help_binding.dart';
import 'package:flutter_qwe/modules/help/help_screen.dart';
import 'package:flutter_qwe/modules/home/home.dart';
import 'package:flutter_qwe/modules/splash/splash_binding.dart';
import 'package:flutter_qwe/modules/splash/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.Splash;

  static final routes = [
    GetPage(
      name: Routes.Splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.Auth,
      page: () => AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.Home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.Help,
      page: () => HelpScreen(),
      binding: HelpBinding(),
    )
  ];
}
