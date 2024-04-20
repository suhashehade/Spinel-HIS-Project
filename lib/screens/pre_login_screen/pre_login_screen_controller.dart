import 'package:get/get.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';

class PreLoginScreenController extends GetxController {
  RxInt loginMethod = 0.obs;

  yesOption() {
    loginMethod.value = 1;
    if (PrefsService.to.getString(ConstRes.tokenKey) == null) {
      Get.offAndToNamed(PagesNames.loginOptions,
          arguments: [ConstRes.reserveArgsKey]);
    } else {
      if (PrefsService.to.getInt(ConstRes.afterLoginKey) == 8) {
        Get.toNamed(PagesNames.medicalFile1);
      } else {
        PrefsService.to.setInt(ConstRes.afterLoginKey, 1);
        Get.offAndToNamed(PagesNames.reserveAssurence);
      }
    }
  }

  noOption() {
    loginMethod.value = 0;
    Get.offAndToNamed(PagesNames.registration);
  }
}
