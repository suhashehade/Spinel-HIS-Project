import 'dart:convert';

import 'package:get/get.dart';
import 'package:his_project/models/clinic/clinic.dart';
import 'package:his_project/models/branch/branch.dart';
import 'package:his_project/models/clinic/clinic_list_item.dart';
import 'package:his_project/models/doctor/branch_dep_doctor.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;

class ReserveAppointmentScreenController extends GetxController {
  RxString choice = 'clinic'.obs;
  RxBool isClinicExpanded = false.obs;
  RxBool isDoctorExpanded = false.obs;
  RxBool isClinicSelected = false.obs;

  RxList<Clinic> clinics = <Clinic>[].obs;
  RxList<Branch> branches = <Branch>[].obs;
  RxList<Doctor> doctors = <Doctor>[].obs;
  String clinicName = '';
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
    http.Response response = await http.get(
      Uri.parse(Urls.getClinicsUrl),
      headers: {
        "content-type": "application/json; charset=utf-8",
      },
    );
    clinics.value = toClinicList(json.decode(response.body)['lstData']);
  }

  getBranches(int depId) async {
    http.Response response = await http.get(
        Uri.parse("${Urls.lkps}categoryCode=Branches&DepartmentId=$depId"));
    branches.value = toBranchList(json.decode(response.body), depId);
  }

  List<Branch> toBranchList(dynamicList, int depId) {
    List<Branch> list = <Branch>[];
    dynamicList.forEach((element) {
      list.add(
          Branch(id: element['value'], label: element['label'], depId: depId));
    });
    return list;
  }

  List<Clinic> toClinicList(dynamicList) {
    List<Clinic> list = <Clinic>[];
    dynamicList.forEach((element) {
      list.add(Clinic(
        id: element['id'],
        name: element['nameEn'],
        departmentTypeEn: element['departmentTypeEn'],
        visitTypeEn: element['visitTypeEn'],
      ));
    });
    return list;
  }

// {id: 1, nameEn: Department1, nameAr: string1, departmentTypeEn: DepartmentType1, visitTypeEn: VisitType2,
// lstDepartmentBranches: [{branchNameEn: Branch2}]}
}
