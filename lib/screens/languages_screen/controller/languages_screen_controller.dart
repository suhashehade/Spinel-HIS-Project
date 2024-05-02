import 'package:get/get.dart';
import 'package:his_project/locale/locale_controller.dart';
import 'package:his_project/screens/doctor_screen/controller/doctor_screen_controller.dart';
import 'package:his_project/screens/doctors_list_screen/controller/doctors_list_screen_controller.dart';
import 'package:his_project/screens/patient_appointments_screen/controller/patient_appointments_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/controller/reserve_appoinment_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';

class LanguagesScreenController extends GetxController {
  RxBool isArabicTop = true.obs;
  RxBool isEnglishTop = false.obs;

  MyLocaleController localeController = Get.find();
  ReserveAppointmentScreenController reserveAppointmentScreenController =
      Get.put(ReserveAppointmentScreenController());
  DoctorScreenController doctorScreenController =
      Get.put(DoctorScreenController());
  DoctorsListScreenController doctorsListScreenController =
      Get.put(DoctorsListScreenController());
  PatientAppointmentsScreenController patientAppointmentsScreenController =
      Get.put(PatientAppointmentsScreenController());

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
    PrefsService.to.setBool("isArabicTop", langCode == 'ar' ? true : false);
    patientAppointmentsScreenController.getPatientAppointments();
    // Get.back();
  }

  onDragEnd(bool wasAccepted, String code) {
    if (code == 'en') {
      isArabicTop.value = false;
    } else {
      isArabicTop.value = true;
    }
    changeLanguage(code);
  }

  @override
  void onInit() {
    isArabicTop.value = PrefsService.to.getBool("isArabicTop") ??
            PrefsService.to.getString('lang') == 'ar'
        ? true
        : false;
    super.onInit();
  }
}
