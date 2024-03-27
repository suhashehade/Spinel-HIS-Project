import 'package:get/get.dart';
import 'package:his_project/utils/pages_names.dart';

class PreLoginScreenController extends GetxController {
  RxInt loginMethod = 0.obs;

  yesOption() {
    loginMethod.value = 1;
    Get.toNamed(PagesNames.loginOptions);
  }

  noOption() {
    loginMethod.value = 0;
    Get.toNamed(PagesNames.registration);
  }
}
