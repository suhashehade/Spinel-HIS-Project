import 'package:get/get.dart';
import 'package:his_project/screens/doctor_screen/controller/doctor_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';

class PreLoginScreenController extends GetxController {
  RxInt loginMethod = 0.obs;
  DoctorScreenController d = Get.put(DoctorScreenController());
  yesOption() {
    loginMethod.value = 1;
    if (PrefsService.to.getString(ConstRes.tokenKey) == null) {
      Get.offAndToNamed(PagesNames.loginOptions,
          arguments: [ConstRes.reserveArgsKey]);
    } else {
      if (PrefsService.to.getString(ConstRes.afterLoginKey) == 'family' ||
          PrefsService.to.getString(ConstRes.afterLoginKey) == 'file0' ||
          PrefsService.to.getString(ConstRes.afterLoginKey) == 'file1' ||
          PrefsService.to.getString(ConstRes.afterLoginKey) == "home0" ||
          PrefsService.to.getString(ConstRes.afterLoginKey) == "home" ||
          PrefsService.to.getString(ConstRes.afterLoginKey) == "browseFile" ||
          PrefsService.to.getString(ConstRes.afterLoginKey) == "file" ||
          PrefsService.to.getString(ConstRes.afterLoginKey) == "confirm") {
        Get.offAndToNamed(PagesNames.login);
        Get.back();
      } else {
        Get.back();
      }
    }
  }

  noOption() {
    loginMethod.value = 0;
    Get.offAndToNamed(PagesNames.registration);
  }
}
