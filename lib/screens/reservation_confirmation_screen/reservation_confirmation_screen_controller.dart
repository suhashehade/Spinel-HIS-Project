import 'package:his_project/models/appointment/reserve_arguments.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:get/get.dart';
import 'package:his_project/services/appointment_api_service.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';

class ReservationConfirmationScreenController extends GetxController {
  RxBool isHaveReservation = false.obs;
  MainScreenController mainScreenController = Get.put(MainScreenController());
  DoctorScreenController doctorScreenController =
      Get.put(DoctorScreenController());

  addAppointment() async {
    ReserveArguments reserveArgs =
        doctorScreenController.reserveArguments.value;
    var res = await AppointmentAPI.addAppointmentAPI(reserveArgs);

    if (res.statusCode == 200) {
      doctorScreenController.availableAppointments.removeWhere((aa) =>
          doctorScreenController.makeDate(aa.fromTime).toIso8601String() ==
          reserveArgs.fromDate);

      PrefsService.to.setString(ConstRes.afterLoginKey, "file0");
      doctorScreenController.reserveArguments.value.fromDate = '';
      Get.offAndToNamed(PagesNames.appiontmentsList);
    }
  }
}
