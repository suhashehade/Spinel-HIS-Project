import 'package:get/get.dart';
import 'package:his_project/services/api_service.dart';
import 'package:his_project/models/clinic/clinic.dart';
import 'package:his_project/models/branch/branch.dart';
import 'package:his_project/models/doctor/doctor_list_arguments.dart';

class ReserveAppointmentScreenController extends GetxController {
  RxBool isClinicExpanded = false.obs;
  RxBool isDoctorExpanded = false.obs;
  RxBool isClinicSelected = false.obs;
  RxString clinicName = ''.obs;
  RxInt depId = 0.obs;
  RxInt branchId = 0.obs;
  RxList<Clinic> clinics = <Clinic>[].obs;
  RxList<Branch> branches = <Branch>[].obs;

  Rx<DoctorsListArguments> doctorsListArguments = DoctorsListArguments(
          branchId: 0,
          branchName: "",
          depName: "",
          doctorName: "",
          depId: 0,
          doctorId: 0)
      .obs;

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

  toggleClinicExpanded(bool isExpanded) {
    isClinicExpanded.value = isExpanded;
  }

  toggleDoctorExpanded(bool isExpanded) {
    isDoctorExpanded.value = isExpanded;
  }

  getClinics() async {
    clinics.value = await Api.getClinicsAPI();
  }

  getBranches(int dId) async {
    branches.value = await Api.getBranchesAPI(dId);
  }

  @override
  void onInit() async {
    await getClinics();
    super.onInit();
  }
}
