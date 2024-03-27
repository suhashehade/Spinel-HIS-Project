import 'package:get/get.dart';
import 'package:his_project/utils/pages_names.dart';

class RegistrationScreenController extends GetxController {
  loginRedirect() {
    Get.offNamed(PagesNames.root);
  }
}
