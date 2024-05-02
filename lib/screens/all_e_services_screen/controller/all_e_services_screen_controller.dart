import 'package:get/get.dart';
import 'package:his_project/screens/main_screen/controller/main_screen_controller.dart';

class AllEServicesScreenController extends GetxController{
  MainScreenController mainScreenController = Get.put(MainScreenController());
  handleReturn(){
    mainScreenController.isHome.value = true;
    Get.back();
  }
}