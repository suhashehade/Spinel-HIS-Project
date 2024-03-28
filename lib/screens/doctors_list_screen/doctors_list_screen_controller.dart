import 'dart:convert';
import 'package:get/get.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;
import '../../models/doctor/branch_dep_doctor.dart';

class DoctorsListScreenController extends GetxController {
  RxString depName = ''.obs;
  RxString branchName = ''.obs;
  late int depId;
  late int branchId;
  RxList<Doctor> doctors = <Doctor>[].obs;

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

  @override
  void onInit() async {
    depId = Get.arguments['arguments'].depId;
    branchId = Get.arguments['arguments'].branchId;
    depName.value = Get.arguments['arguments'].depName;
    branchName.value = Get.arguments['arguments'].branchName;
    await getDoctors();
    super.onInit();
  }
}
