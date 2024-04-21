import 'package:get/get.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';

class HomeScreenController extends GetxController {
  MainScreenController mainScreenController = Get.put(MainScreenController());
  goToAllServices() {
    Get.toNamed(PagesNames.allEServices);
  }

  login() {
    PrefsService.to.setInt(ConstRes.afterLoginKey, 8);
    Get.toNamed(PagesNames.preLogin);
  }

  redirect(String key, String pageName) {
    PrefsService.to.setString(ConstRes.afterLoginKey, key);
    Get.toNamed(pageName);
  }
}
