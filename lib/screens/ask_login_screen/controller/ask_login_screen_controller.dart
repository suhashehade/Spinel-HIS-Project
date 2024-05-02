import 'package:get/get.dart';
import 'package:his_project/utils/pages_names.dart';

class AskLoginScreenController extends GetxController {
  toPreLogin() {
    Get.offAndToNamed(PagesNames.preLogin);
  }
}
