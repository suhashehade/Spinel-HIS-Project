import 'dart:convert';

import 'package:get/get.dart';
import 'package:his_project/models/clinic/clinic.dart';
import 'package:his_project/models/branch/branch.dart';
import 'package:his_project/models/clinic/clinic_list_item.dart';
import 'package:his_project/models/doctor/branch_dep_doctor.dart';
import 'package:his_project/models/doctor/doctor_list_arguments.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;

class ReserveAppointmentScreenController extends GetxController {
  RxString choice = 'clinic'.obs;
  RxBool isClinicExpanded = false.obs;
  RxBool isDoctorExpanded = false.obs;
  RxBool isClinicSelected = false.obs;
  RxString clinicName = ''.obs;
  RxInt depId = 0.obs;
  RxInt branchId = 0.obs;
  RxList<Clinic> clinics = <Clinic>[].obs;
  RxList<Branch> branches = <Branch>[].obs;
  RxList<Doctor> doctors = <Doctor>[].obs;
  Rx<DoctorsListArguments> doctorsListArguments = DoctorsListArguments(
          branchId: 0,
          branchName: "",
          depName: "",
          doctorName: "",
          depId: 0,
          doctorId: 0)
      .obs;

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

  getClinics() async {
    Map<String, String> headers = {
      "content-type": "application/json; charset=utf-8",
    };
    if (PrefsService.to.getString("token") != null) {
      String? token = PrefsService.to.getString("token");
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
      Uri.parse(Urls.getClinicsUrl),
      headers: headers,
    );
    clinics.value = (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => Clinic.fromJson(tagJson))
        .toList();
  }

  getBranches(int dId) async {
    depId.value = dId;
    http.Response response = await http.get(Uri.parse(
        "${Urls.lkps}categoryCode=Branches&DepartmentId=${depId.value}"));
    branches.value = (json.decode(response.body) as List)
        .map((tagJson) => Branch.fromJson(tagJson))
        .toList();
  }
}
