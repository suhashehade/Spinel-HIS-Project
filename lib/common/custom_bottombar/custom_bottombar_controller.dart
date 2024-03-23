import 'package:get/get.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/utils/consts_res.dart';

class CustomBottombarController extends GetxController {
  RxInt index = 0.obs;
  MainScreenController mainScreenController = Get.put(MainScreenController());

  changeIndex(value) {
    index.value = value;
  }

  switchPages(index) {
    if (index != 2) {
      mainScreenController.isHome.value = false;
    } else {
      mainScreenController.isHome.value = true;
    }
    mainScreenController.changeCurrentPage(ConstRes.pages[index]);
  }
}
