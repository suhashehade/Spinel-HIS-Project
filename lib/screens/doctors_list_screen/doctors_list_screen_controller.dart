import 'dart:convert';

import 'package:get/get.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/services/doctor_api_service.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import '../../models/doctor/branch_dep_doctor.dart';

class DoctorsListScreenController extends GetxController {
  RxString depName = ''.obs;
  RxString branchName = ''.obs;
  RxInt depId = 0.obs;
  RxInt branchId = 0.obs;
  RxString error = "".obs;
  RxBool isLoading = false.obs;
  RxList<Doctor> doctors = <Doctor>[].obs;
  ReserveAppointmentScreenController reserveAppointmentScreenController =
      Get.put(ReserveAppointmentScreenController());

  getDoctors() async {
    isLoading.value = true;
    depId.value =
        reserveAppointmentScreenController.doctorsListArguments.value.depId;
    branchId.value =
        reserveAppointmentScreenController.doctorsListArguments.value.branchId;

    var response = await DoctoAPI.getDoctorsAPI(branchId, depId);
    if (response.statusCode == 200) {
      isLoading.value = false;
      if ((json.decode(response.body) as List)
          .map((tagJson) => Doctor.fromJson(tagJson))
          .toList()
          .isNotEmpty) {
        doctors.value = (json.decode(response.body) as List)
            .map((tagJson) => Doctor.fromJson(tagJson))
            .toList();
      } else {
        isLoading.value = false;
        error.value = ConstRes.noDoctorMessage;
      }
    } else {
      isLoading.value = false;
    }
  }

  toDoctorScreen(Doctor d) {
    reserveAppointmentScreenController.doctorsListArguments.value.doctorId =
        d.id;
    reserveAppointmentScreenController.doctorsListArguments.value.doctorName =
        d.keys[PrefsService.to.getString(ConstRes.langkey) ??
            Get.locale?.languageCode]![ConstRes.labelKey]!;
    Get.to(() => const DoctorInfoScreen());
  }

  handleReturn(){
    Get.back();
  }

  @override
  void onInit() async {
    await getDoctors();
    super.onInit();
  }
}
