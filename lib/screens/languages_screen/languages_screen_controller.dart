import 'package:get/get.dart';
import 'package:his_project/locale/locale_controller.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/doctors_list_screen/doctors_list_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';

class LanguagesScreenController extends GetxController {
  MyLocaleController localeController = Get.put(MyLocaleController());
  ReserveAppointmentScreenController reserveAppointmentScreenController =
      Get.put(ReserveAppointmentScreenController());
  DoctorScreenController doctorScreenController =
      Get.put(DoctorScreenController());
  DoctorsListScreenController doctorsListScreenController =
      Get.put(DoctorsListScreenController());

  changeLanguage(langCode) {
    localeController.changeLang(langCode);
    
    if (reserveAppointmentScreenController.doctorsListArguments.value.depId !=
        0) {
      reserveAppointmentScreenController.changeClinicName();
    }

    if (doctorScreenController.reserveArguments.value.doctorId != 0) {
      doctorScreenController.changeDoctorName();
    }

    if (doctorScreenController.reserveArguments.value.depId != 0) {
      doctorScreenController.changeClinicName();
    }

    if (doctorScreenController.reserveArguments.value.branchId != 0) {
      doctorScreenController.changeBranchName();
    }

    Get.back();
  }
}
