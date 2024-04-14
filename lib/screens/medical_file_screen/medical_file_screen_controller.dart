import 'package:get/get.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/utils/pages_names.dart';

class MedicalFileScreenController extends GetxController {
  MainScreenController mainScreenController = Get.put(MainScreenController());
  returnToHomePage() {
    mainScreenController.currentPage.value = PagesNames.home;
    mainScreenController.isHome.value = true;
  }
}
