import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:his_project/models/appointment/reserve_arguments.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/utils/pages_names.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/urls.dart';
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
  getUserReservations() async {
    Map<String, String> headers = {
      "content-type": "application/json; charset=utf-8",
    };
    if (PrefsService.to.getString("token") != null) {
      String? token = PrefsService.to.getString("token");
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
        Uri.parse(
            "${Urls.logicUrl}AppointmentsList?Page=1&PageSize=1000&PatientId=${PrefsService.to.getInt("id")}"),
        headers: headers);

    return json.decode(response.body)['lstData'];
  }

  isPatientHaveReservation() async {
    List res = await getUserReservations();
    if (res.isEmpty) {
      isHaveReservation.value = false;
    } else {
      isHaveReservation.value = true;
    }
  }

  addAppointment() async {
    DoctorScreenController doctorScreenController =
        Get.put(DoctorScreenController());
    ReserveArguments reserveArgs =
        doctorScreenController.reserveArguments.value;

    Map<String, String> headers = {
      "accept": "*/*",
      "content-type": "application/json; charset=utf-8",
    };
    if (PrefsService.to.getString("token") != null) {
      String? token = PrefsService.to.getString("token");
      headers['Authorization'] = 'Bearer $token';
    }

    Map<String, dynamic> body = {
      "branchId": reserveArgs.branchId,
      "clinicId": null,
      "doctorId": reserveArgs.doctorId,
      "fromDate": reserveArgs.fromDate,
      "toDate": reserveArgs.toDate,
      "reasonId": null,
      "statusId": null,
      "departmentId": reserveArgs.depId,
      "note": "string"
    };

    http.Response response = await http.post(
      Uri.parse("${Urls.logicUrl}AddAppointment"),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      Get.toNamed(PagesNames.patientAppiontments);
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
