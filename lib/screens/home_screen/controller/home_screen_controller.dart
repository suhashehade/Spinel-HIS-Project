import 'package:get/get.dart';
import 'package:his_project/screens/main_screen/controller/main_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';

class HomeScreenController extends GetxController {
  RxBool isActive = false.obs;
  toggleIsActive() {
    isActive.value = !isActive.value;
  }

  MainScreenController mainScreenController = Get.put(MainScreenController());
  goToAllServices() {
    Get.toNamed(PagesNames.allEServices);
    mainScreenController.isHome.value = false;
  }

  login() {
    PrefsService.to.setString(ConstRes.afterLoginKey, "browseFile");
    Get.toNamed(PagesNames.preLogin);
  }

  redirect(String key, String pageName) {
    PrefsService.to.setString(ConstRes.afterLoginKey, key);
    mainScreenController.isHome.value = false;
    Get.toNamed(pageName);
  }
}
