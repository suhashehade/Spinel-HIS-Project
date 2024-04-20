import 'package:get/get.dart';
import 'package:his_project/screens/medical_test_screen/medical_test_screen.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';

class MedicalFileScreenController extends GetxController {
  login() {
    PrefsService.to.setInt(ConstRes.afterLoginKey, 8);
    Get.toNamed(PagesNames.preLogin);
  }

  toMedicalLabResult() {
    Get.to(() => const MedicalTestScreen());
  }
}
