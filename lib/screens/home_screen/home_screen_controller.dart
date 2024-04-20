import 'package:get/get.dart';
import 'package:his_project/screens/emergency_screen/emergency_screen.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';

class HomeScreenController extends GetxController {
  MainScreenController mainScreenController = Get.put(MainScreenController());
  goToAllServices() {
    Get.toNamed(PagesNames.allEServices);
  }

  login() {
    PrefsService.to.setInt(ConstRes.afterLoginKey, 8);
    Get.toNamed(PagesNames.preLogin);
  }

  toPatientAppointments() {
    PrefsService.to.setInt(ConstRes.afterLoginKey, 0);
    if (PrefsService.to.getString(ConstRes.tokenKey) == null) {
      Get.toNamed(PagesNames.preLogin);
    } else {
      Get.toNamed(PagesNames.patientAppiontments);
    }
  }

  toEmergency() {
    PrefsService.to.setInt(ConstRes.afterLoginKey, 4);
    mainScreenController.isHome.value = false;
    Get.to(() => const EmergencyScreen());
  }

  toReserveAppointment() {
    PrefsService.to.setInt(ConstRes.afterLoginKey, 1);
    mainScreenController.isHome.value = false;
    Get.to(() => const ReserveAppointmentScreen());
  }
}
