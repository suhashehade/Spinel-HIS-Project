import 'dart:convert';

import 'package:get/get.dart';
import 'package:his_project/models/branch/branch_details.dart';
import 'package:his_project/screens/main_screen/controller/main_screen_controller.dart';
import 'package:his_project/models/clinic/clinic.dart';
import 'package:his_project/models/branch/branch.dart';
import 'package:his_project/models/doctor/doctor_list_arguments.dart';
import 'package:his_project/services/branch_api_service.dart';
import 'package:his_project/services/clinic_api_service.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/messages.dart';
import 'package:his_project/utils/pages_names.dart';

class ReserveAppointmentScreenController extends GetxController {
  RxBool isClinicExpanded = false.obs;
  RxBool isDoctorExpanded = false.obs;
  RxBool isClinicSelected = false.obs;
  RxBool isBranchExpanded = false.obs;
  RxBool isClinicsLoading = false.obs;
  RxBool isBranchesLoading = false.obs;
  RxString error = "".obs;
  RxString clinicName = ''.obs;
  RxString branchName = ''.obs;
  RxInt depId = 0.obs;
  RxInt branchId = 0.obs;
  RxList<Clinic> clinics = <Clinic>[].obs;
  RxList<Branch> branches = <Branch>[].obs;
  MainScreenController mainScreenController = Get.put(MainScreenController());
  Rx<DoctorsListArguments> doctorsListArguments = DoctorsListArguments(
    branchId: 0,
    branchName: "",
    depName: "",
    doctorName: "",
    depId: 0,
    doctorId: 0,
  ).obs;
  Rx<BranchDetails> branchDetails = BranchDetails(0, "", "").obs;

  toggleExpanded(int index, bool isExpanded) {
    if (index == 0) {
      isClinicExpanded.value = isExpanded;
    } else {
      isDoctorExpanded.value = isExpanded;
    }
  }

  setSelectedClinic(value) {
    isClinicSelected.value = value;
  }

  toggleClinicExpanded() {
    isClinicExpanded.value = !isClinicExpanded.value;
  }

  toggleBranchExpanded() {
    isBranchExpanded.value = !isBranchExpanded.value;
  }

  toggleDoctorExpanded(bool isExpanded) {
    isDoctorExpanded.value = isExpanded;
  }

  getClinics() async {
    isClinicsLoading.value = true;
    var response = await ClinicAPI.getClinicsAPI();
    if (response.statusCode == 200) {
      clinics.value = (json.decode(response.body)['lstData'] as List)
          .map((tagJson) => Clinic.fromJson(tagJson))
          .toList();
      isClinicsLoading.value = false;
    } else {
      error.value = Messages.noClinicsMessage;
      isClinicsLoading.value = false;
    }
  }

  returnToHomePage() {
    Get.back();
    mainScreenController.isHome.value = true;
  }

  getBranches(int dId) async {
    isBranchesLoading.value = true;
    var response = await BranchAPI.getBranchesAPI(dId);

    if (response.statusCode == 200) {
      branches.value = (json.decode(response.body) as List)
          .map((tagJson) => Branch.fromJson(tagJson))
          .toList();
      isBranchesLoading.value = false;
    } else {
      error.value = Messages.noBranches;
      isBranchesLoading.value = false;
    }
  }

  goToDoctorsList(Branch b) {
    setSelectedClinic(false);
    branchId.value = b.id;
    doctorsListArguments.value.branchId = b.id;
    doctorsListArguments.value.branchName = b.keys[
        PrefsService.to.getString(ConstRes.langkey) ??
            Get.locale?.languageCode]![ConstRes.labelKey]!;
    Get.toNamed(
      PagesNames.doctorsList,
      arguments: doctorsListArguments.value,
    );

    clinicName.value = '';
  }

  handleBranches(Clinic c) async {
    setSelectedClinic(true);
    toggleClinicExpanded();
    if (!isBranchExpanded.value) {
      toggleBranchExpanded();
    }
    await getBranches(c.id);

    clinicName.value = c.keys[PrefsService.to.getString(ConstRes.langkey) ??
        Get.locale?.languageCode]![ConstRes.nameKey]!;

    depId.value = c.id;
    doctorsListArguments.value.depId = c.id;
    doctorsListArguments.value.depName = c.keys[
        PrefsService.to.getString(ConstRes.langkey) ??
            Get.locale?.languageCode]![ConstRes.nameKey]!;
  }

  changeClinicName() {
    Clinic c = clinics.where((p0) => p0.id == depId.value).toList()[0];
    clinicName.value = c.keys[PrefsService.to.getString(ConstRes.langkey) ??
        Get.locale?.languageCode]![ConstRes.nameKey]!;
  }

  changeBranchName() {
    Branch b = branches.where((p0) => p0.id == branchId.value).toList()[0];
    branchName.value = b.keys[PrefsService.to.getString(ConstRes.langkey) ??
        Get.locale?.languageCode]![ConstRes.labelKey]!;
  }

  @override
  void onInit() async {
    await getClinics();
    super.onInit();
  }
}
