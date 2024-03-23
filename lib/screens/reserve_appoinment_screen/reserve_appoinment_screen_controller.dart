import 'package:get/get.dart';
import 'package:his_project/models/clinic/clinic.dart';
import 'package:his_project/models/clinic/clinic_branch.dart';
import 'package:his_project/models/clinic/clinic_list_item.dart';

class ReserveAppointmentScreenController extends GetxController {
  RxString choice = 'clinic'.obs;
  RxBool isClinicExpanded = false.obs;
  RxBool isDoctorExpanded = false.obs;
  RxBool isClinicSelected = false.obs;

  RxList<Clinic> clinics = <Clinic>[].obs;
  RxList<ClinicBranch> branches = <ClinicBranch>[].obs;

  changeChoice(int value) {
    choice.value = value == 0 ? 'doctor' : 'clinic';
  }

  toogleExpanded(int index, bool isExpanded) {
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

  List<ClinicItem> generateClinicItems(int listLength) {
    return List<ClinicItem>.generate(listLength, (int index) {
      return ClinicItem(
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index',
        isExpanded: false.obs,
      );
    });
  }

  
}
