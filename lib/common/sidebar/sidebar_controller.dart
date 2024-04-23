import 'package:get/get.dart';
import 'package:his_project/models/user/user.dart';
import 'package:his_project/services/patient_api_service.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';

class SidebarController extends GetxController {
  Rx<User> patient =
      User(0, "", "", "", "", "", "", "", "", "", "", false, "", 0, "").obs;
  RxBool isActive = false.obs;

  toggleIsActive() {}
  getPatientInfo() async {
    var response = await PatientAPI.getPatient(
        PrefsService.to.getString(ConstRes.phoneKey).toString());
    patient.value = response;
  }

  @override
  void onInit() async {
    await getPatientInfo();
    super.onInit();
  }
}
