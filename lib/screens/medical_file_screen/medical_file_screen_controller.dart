import 'package:get/get.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';

class MedicalFileScreenController extends GetxController {
  login() {
    PrefsService.to.setString(ConstRes.afterLoginKey, "file");
    Get.toNamed(PagesNames.preLogin);
  }

  toPatientAppointments() {
    PrefsService.to.setInt(ConstRes.afterLoginKey, 0);
    if (PrefsService.to.getString(ConstRes.tokenKey) == null) {
      Get.toNamed(PagesNames.preLogin);
    } else {
      Get.toNamed(PagesNames.appiontmentsList);
    }
  }

  redirect(String key, String pageName) {
    if (PrefsService.to.getString(ConstRes.tokenKey) == null &&
        key == "file0") {
      PrefsService.to.setString(ConstRes.afterLoginKey, key);
      Get.toNamed(PagesNames.preLogin);
    } else {
      PrefsService.to.setString(ConstRes.afterLoginKey, key);
      Get.toNamed(pageName);
    }
  }
}
