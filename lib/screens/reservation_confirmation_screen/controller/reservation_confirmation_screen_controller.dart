import 'dart:convert';

import 'package:his_project/models/appointment/reserve_arguments.dart';
import 'package:his_project/models/user/user.dart';
import 'package:his_project/screens/doctor_screen/controller/doctor_screen_controller.dart';
import 'package:his_project/screens/login_screen/controller/login_screen_controller.dart';
import 'package:his_project/screens/main_screen/controller/main_screen_controller.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/reserve_appoinment_screen/controller/reserve_appoinment_screen_controller.dart';
import 'package:his_project/services/appointment_api_service.dart';
import 'package:his_project/services/doctor_api_service.dart';
import 'package:his_project/services/patient_api_service.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';

class ReservationConfirmationScreenController extends GetxController {
  RxBool isHaveReservation = false.obs;
  RxInt age = 0.obs;
  RxBool isLoading = false.obs;
  Rx<User> doctor =
      User(0, "", "", "", "", "", "", "", "", "", "", false, "", 0, "").obs;
  Rx<User> patient =
      User(0, "", "", "", "", "", "", "", "", "", "", false, "", 0, "").obs;
  MainScreenController mainScreenController = Get.put(MainScreenController());
  DoctorScreenController doctorScreenController =
      Get.put(DoctorScreenController());
  LoginScreenController loginScreenController =
      Get.put(LoginScreenController());
  ReserveAppointmentScreenController reserveAppointmentScreenController =
      Get.put(ReserveAppointmentScreenController());

  Rx<ReserveArguments> reserveArguments = ReserveArguments(
          doctorId: 0, depId: 0, branchId: 0, fromDate: "", toDate: "")
      .obs;
      
  addAppointment() async {
    var res = await AppointmentAPI.addAppointmentAPI(reserveArguments.value);

    if (res.statusCode == 200) {
      doctorScreenController.availableAppointments.removeWhere((aa) =>
          doctorScreenController.makeDate(aa.fromTime).toIso8601String() ==
          reserveArguments.value.fromDate);

      PrefsService.to.setString(ConstRes.afterLoginKey, "file0");
      doctorScreenController.reserveArguments.value.fromDate = '';
      Get.offAndToNamed(PagesNames.appiontmentsList);
    }
  }

  getUserTypedDoctor() async {
    var response = await DoctoAPI.getUserTypedDoctor();

    doctor.value = (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => User.fromJson(tagJson))
        .toList()[0];
  }

  getUserTypedPatient() async {
    isLoading.value = true;
    var response = await PatientAPI.getPatient(
        PrefsService.to.getString(ConstRes.phoneKey).toString());
    if (response.id != 0) {
      patient.value = response;
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  findAge() {
    age.value =
        DateTime.now().year - DateTime.parse(patient.value.birthDate).year;
  }

  handleReturn() {
    Get.back();
  }

  @override
  void onInit() async {
    reserveArguments.value = doctorScreenController.reserveArguments.value;
    await getUserTypedDoctor();
    await getUserTypedPatient();
    findAge();
    super.onInit();
  }
}
