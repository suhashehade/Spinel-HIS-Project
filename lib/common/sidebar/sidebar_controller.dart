import 'package:get/get.dart';
import 'package:his_project/models/user/user.dart';
import 'package:his_project/screens/login_screen/controller/login_screen_controller.dart';
import 'package:his_project/services/patient_api_service.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';

class SidebarController extends GetxController {
  Rx<User> patient =
      User(0, "", "", "", "", "", "", "", "", "", "", false, "", 0, "").obs;
  RxBool isActive = false.obs;
  late LoginScreenController loginScreenController;

  toggleIsActive() {}
  getPatientInfo() async {
    if (PrefsService.to.getInt("id") != null) {
      var response = await PatientAPI.getPatient(
          PrefsService.to.getString(ConstRes.phoneKey).toString());
      patient.value = response;
    }
  }

  logout() {
    Get.back();
    loginScreenController.logout();
  }

  @override
  void onInit() async {
    loginScreenController = Get.put(LoginScreenController());
    await getPatientInfo();
    super.onInit();
  }
}
