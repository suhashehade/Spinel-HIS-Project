import 'package:get/get.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/pages_names.dart';

class PreLoginScreenController extends GetxController {
  RxInt loginMethod = 0.obs;

  yesOption() {
    loginMethod.value = 1;
    if (PrefsService.to.getString("token") == null) {
      Get.offAndToNamed(PagesNames.loginOptions, arguments: ['reserveArgs']);
    } else {
      PrefsService.to.setInt("afterLogin", 1);
      Get.offAndToNamed(PagesNames.reserveAssurence);
    }
  }

  noOption() {
    loginMethod.value = 0;
    Get.offAndToNamed(PagesNames.registration);
  }
}
