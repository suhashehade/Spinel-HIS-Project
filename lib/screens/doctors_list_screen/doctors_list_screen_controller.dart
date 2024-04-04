import 'dart:convert';
import 'package:get/get.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;
import '../../models/doctor/branch_dep_doctor.dart';

class DoctorsListScreenController extends GetxController {
  RxString depName = ''.obs;
  RxString branchName = ''.obs;
  RxInt depId = 0.obs;
  RxInt branchId = 0.obs;
  RxList<Doctor> doctors = <Doctor>[].obs;
  ReserveAppointmentScreenController reserveAppointmentScreenController =
      Get.put(ReserveAppointmentScreenController());

  getDoctors() async {
    int depId =
        reserveAppointmentScreenController.doctorsListArguments.value.depId;
    branchId.value =
        reserveAppointmentScreenController.doctorsListArguments.value.branchId;
    http.Response response = await http.get(Uri.parse(
        "${Urls.lkps}categoryCode=UserBasedType&BranchId=$branchId&DepartmentId=$depId&UserTypeId=2"));

    doctors.value = (json.decode(response.body) as List)
        .map((tagJson) => Doctor.fromJson(tagJson))
        .toList();
  }
}
