import 'package:get/get.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';

class MedicalFileScreenController extends GetxController {
  login() {
    PrefsService.to.setString(ConstRes.afterLoginKey, "file");
    Get.toNamed(PagesNames.preLogin);
  }

  redirect(String key, String pageName) {
    PrefsService.to.setString(ConstRes.afterLoginKey, key);
    if (PrefsService.to.getString(ConstRes.tokenKey) != null) {
      Get.toNamed(PagesNames.askLoginScreen);
    } else {
      Get.toNamed(PagesNames.preLogin);
    }
  }
}
