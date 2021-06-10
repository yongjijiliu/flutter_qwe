import 'package:get/get.dart';
import 'commom/common.dart';


/// 依赖注入 初始化
/// 
class DenpendencyInjection {  
  static Future<void> init() async {
    // 注入 本地持久化实例  SharedPreferences
    await Get.putAsync(() => StorageService().init());
  }
}