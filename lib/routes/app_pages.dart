import 'package:flutter_qwe/modules/auth/auth_binding.dart';
import 'package:flutter_qwe/modules/auth/auth_srceen.dart';
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
  ];
}
