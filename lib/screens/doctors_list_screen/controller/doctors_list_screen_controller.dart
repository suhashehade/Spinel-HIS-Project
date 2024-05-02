import 'dart:convert';

import 'package:get/get.dart';
import 'package:his_project/models/appointment/reserve_arguments.dart';
import 'package:his_project/models/doctor/doctor_list_arguments.dart';
import 'package:his_project/screens/main_screen/controller/main_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/controller/reserve_appoinment_screen_controller.dart';
import 'package:his_project/services/doctor_api_service.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/messages.dart';
import 'package:his_project/utils/pages_names.dart';
import '../../../models/doctor/branch_dep_doctor.dart';

class DoctorsListScreenController extends GetxController {
  RxString depName = ''.obs;
  RxString branchName = ''.obs;
  RxInt depId = 0.obs;
  RxInt branchId = 0.obs;
  RxString error = "".obs;
  RxBool isLoading = false.obs;
  RxList<Doctor> doctors = <Doctor>[].obs;
  MainScreenController mainScreenController = Get.put(MainScreenController());
  ReserveAppointmentScreenController reserveAppointmentScreenController =
      Get.put(ReserveAppointmentScreenController());
  ReserveArguments reserveArguments = ReserveArguments(
      doctorId: 0, depId: 0, branchId: 0, fromDate: "", toDate: "");
  DoctorsListArguments doctorsListArguments = DoctorsListArguments(
    branchId: 0,
    depId: 0,
    doctorId: 0,
    doctorName: "",
    branchName: "",
    depName: "",
  );

  getDoctors() async {
    isLoading.value = true;
    var response = await DoctoAPI.getDoctorsAPI(branchId.value, depId.value);
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
        error.value = Messages.noDoctorMessage;
      }
    } else {
      isLoading.value = false;
    }
  }

  toDoctorScreen(Doctor d) {
    doctorsListArguments.doctorId = d.id;
    doctorsListArguments.doctorName = d.keys[
        PrefsService.to.getString(ConstRes.langkey) ??
            Get.locale?.languageCode]![ConstRes.labelKey]!;
    Get.toNamed(PagesNames.doctorInfo, arguments: doctorsListArguments);
  }

  handleReturn() {
    mainScreenController.isHome.value = false;
    Get.back();
  }

  @override
  void onInit() async {
    doctorsListArguments = Get.arguments ??
        DoctorsListArguments(
            branchId: 0,
            depId: 0,
            doctorId: 0,
            doctorName: "",
            branchName: "",
            depName: "");
    depId.value = doctorsListArguments.depId;
    depName.value = doctorsListArguments.depName;
    branchId.value = doctorsListArguments.branchId;
    branchName.value = doctorsListArguments.branchName;
    await getDoctors();
    super.onInit();
  }
}
