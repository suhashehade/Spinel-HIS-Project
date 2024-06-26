import 'package:get/get.dart';
import 'package:his_project/screens/home_screen/view/home_screen.dart';
import 'package:his_project/screens/main_screen/controller/main_screen_controller.dart';

class EmergencyScreenController extends GetxController {
  MainScreenController mainScreenController = Get.put(MainScreenController());

  returnToHome() {
    Get.back();
    mainScreenController.currentPage.value = const HomeScreen();
    mainScreenController.isHome.value = true;
  }
}
