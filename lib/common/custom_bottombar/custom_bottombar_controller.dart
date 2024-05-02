import 'package:get/get.dart';
import 'package:his_project/screens/main_screen/controller/main_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/lists.dart';
import 'package:his_project/utils/pages_names.dart';

class CustomBottombarController extends GetxController {
  RxInt index = 2.obs;
  MainScreenController mainScreenController = Get.put(MainScreenController());

  changeIndex(value) {
    index.value = value;
  }

  switchPages(index) {
    if (index == 1) {
      PrefsService.to.setString(ConstRes.afterLoginKey, "family");
      Get.back();
      Get.back();
      Get.back();
      Get.toNamed(PagesNames.askLoginScreen);
      mainScreenController.isHome.value = false;
    } else {
      Get.back();
      mainScreenController.isHome.value = false;
    }
    if (index != 2) {
      mainScreenController.isHome.value = false;
    } else {
      mainScreenController.isHome.value = true;
      Get.back();
    }
    mainScreenController.currentPage.value = Lists.pages[index];
  }
}
