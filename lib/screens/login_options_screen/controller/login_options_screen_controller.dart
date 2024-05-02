import 'package:get/get.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';

class LoginOptionsScreenController extends GetxController {
  RxInt option = 0.obs;

  goToNILogin() {
    option.value = 1;
    Get.toNamed(PagesNames.login, arguments: {ConstRes.optionkey: 1});
  }

  goToMRNLogin() {
    option.value = 0;
    Get.toNamed(PagesNames.login, arguments: {ConstRes.optionkey: 0});
  }

  goToRegistration() {
    Get.toNamed(PagesNames.registration);
  }
}
