import 'package:get/get.dart';
import 'package:his_project/services/api_service.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
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
    depId.value =
        reserveAppointmentScreenController.doctorsListArguments.value.depId;
    branchId.value =
        reserveAppointmentScreenController.doctorsListArguments.value.branchId;
    doctors.value = await Api.getDoctorsAPI(branchId, depId);
  }

  // @override
  // void onInit() async {
  //   await getDoctors();
  //   super.onInit();
  // }
}
