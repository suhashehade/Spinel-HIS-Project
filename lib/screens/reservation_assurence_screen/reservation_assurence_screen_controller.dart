import 'package:flutter/material.dart';
import 'package:his_project/models/appointment/reserve_arguments.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/services/api_service.dart';
import 'package:get/get.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/pages_names.dart';
import 'package:intl/intl.dart';

class ReservationAssurenceScreenController extends GetxController {
  TextEditingController mrnController = TextEditingController();
  TextEditingController name1EnController = TextEditingController();
  TextEditingController name2EnController = TextEditingController();
  TextEditingController name3EnController = TextEditingController();
  TextEditingController name4EnController = TextEditingController();
  TextEditingController name1ArController = TextEditingController();
  TextEditingController name2ArController = TextEditingController();
  TextEditingController name3ArController = TextEditingController();
  TextEditingController name4ArController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController addressEnController = TextEditingController();
  TextEditingController addressArController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  RxBool isHaveReservation = false.obs;
  MainScreenController mainScreenController = Get.put(MainScreenController());

  addAppointment() async {
    DoctorScreenController doctorScreenController =
        Get.put(DoctorScreenController());
    ReserveArguments reserveArgs =
        doctorScreenController.reserveArguments.value;

    var res = await Api.addAppointmentAPI(reserveArgs);

    if (res.statusCode == 200) {
      reserveArgs.fromDate = '';
      PrefsService.to.setInt("afterLogin", 0);
      Get.offAndToNamed(PagesNames.patientAppiontments);
    }
  }

  pickDate(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: DateTime(1950), lastDate: DateTime(2100));
    if (pickedDate != null) {
      String formattedDate = DateFormat.yMMMd().format(pickedDate);
      dateOfBirthController.text = formattedDate;
    }
  }
}
