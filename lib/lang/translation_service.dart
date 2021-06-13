import 'dart:ui';

import 'package:get/get.dart';

import 'en_US.dart';
import 'zh_CN.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('zh', 'CN');
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zh_CN,
        'en_US': en_US,
      };
}
