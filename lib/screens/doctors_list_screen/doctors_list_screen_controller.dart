import 'dart:convert';

import 'package:get/get.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;

import '../../models/doctor/branch_dep_doctor.dart';

class DoctorsListScreenController extends GetxController {
  late String depName;
  late String branchName;
  late String doctorName;
  late int depId;
  late int branchId;
  RxList<Doctor> doctors = <Doctor>[].obs;
  // getDoctorName(int doctorId) async {
  //   http.Response response = await http.get(Uri.parse(
  //       "http://192.236.146.134:9000/api/Account/UserDetails?Id=$doctorId"));
  //   print(json.decode(response.body));
  //   doctorName = json.decode(response.body)['nameEn1'] +
  //       "jjjjjj" +
  //       json.decode(response.body)['nameEn4'];
  // }

  getDoctors() async {
    http.Response response = await http.get(Uri.parse(
        "${Urls.lkps}categoryCode=UserBasedType&BranchId=$branchId&DepartmentId=$depId&UserTypeId=2"));
    doctors.value = toDoctorList(json.decode(response.body), depId, branchId);
  }

  List<Doctor> toDoctorList(dynamicList, int depId, int branchId) {
    List<Doctor> list = <Doctor>[];
    dynamicList.forEach((element) {
      list.add(
        Doctor(
            id: element['value'],
            label: element['label'],
            depId: depId,
            branchId: branchId),
      );
    });
    return list;
  }

  getDoctorsList() {
    return doctors;
  }

  @override
  void onInit() {
    depId = Get.arguments['arguments'].depId;
    branchId = Get.arguments['arguments'].branchId;
    getDoctors();
    super.onInit();
  }
}
