import 'package:get/get.dart';
import 'package:his_project/screens/main_screen/controller/main_screen_controller.dart';

class MedicalAnalysisResultScreenController extends GetxController {
  RxBool isCbcCollapsed = false.obs;
  RxBool isGeneralCollapsed = false.obs;
  RxDouble cbcHeight = 100.0.obs;
  RxDouble generalHeight = 100.0.obs;
  RxString keyValue = "".obs;
  MainScreenController mainScreenController = Get.put(MainScreenController());

  toggleCbcCollaps() {
    isCbcCollapsed.value = !isCbcCollapsed.value;
  }

  changeCbcHeight() {
    if (isCbcCollapsed.value) {
      cbcHeight.value += 400.0;
    } else {
      cbcHeight.value -= 400.0;
    }
  }

  toggleGeneralCollaps() {
    isGeneralCollapsed.value = !isGeneralCollapsed.value;
  }

  changeGeneralHeight() {
    if (isGeneralCollapsed.value) {
      generalHeight.value += 400.0;
    } else {
      generalHeight.value -= 400.0;
    }
  }

  cbcClick() {
    toggleCbcCollaps();
    changeCbcHeight();
  }

  generalClick() {
    toggleGeneralCollaps();
    changeGeneralHeight();
  }

  handleReturn() {
    Get.back();
  }
}
