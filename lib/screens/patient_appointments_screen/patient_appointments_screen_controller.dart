import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/appointment/appointment_details.dart';
import 'package:his_project/models/appointment/patient_appointments.dart';
import 'package:his_project/screens/appointment_details_screen/appointment_details_screen.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/urls.dart';
import "package:http/http.dart" as http;
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PatientAppointmentsScreenController extends GetxController {
  RxList<PatientAppointment> appointments = <PatientAppointment>[].obs;
  RxList<Appointment> meetings = <Appointment>[].obs;
  Rx<DateTime?> currentDay = DateTime.now().obs;
  Rx<AppointmentDetails> appointmetDetails = AppointmentDetails(
          0, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
      .obs;

  getPatientAppointments() async {
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

    appointments.value = (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => PatientAppointment.fromJson(tagJson))
        .toList();
    getAppointments(response);
  }

  getAppointments(response) {
    appointments.forEach((a) =>
        DateTime.parse(a.fromDate).isAfter(DateTime.now()) ||
                DateTime.parse(a.fromDate).day == DateTime.now().day
            ? meetings.add(
                Appointment(
                  id: a.id,
                  startTime: DateTime.parse(a.fromDate),
                  endTime: DateTime.parse(a.toDate),
                  subject: a.statusName.toString(),
                  color: Color(CustomColors.pacificBlue),
                  recurrenceId: response.body,
                ),
              )
            : null);
  }

  void handleEventTap(CalendarTapDetails calendarTapDetails) async {
    await getAppointmentDetails(calendarTapDetails.appointments![0].id);
    Get.to(() => const AppointmentDetailsScreen());
  }

  getAppointmentDetails(int id) async {
    Map<String, String> headers = {
      "content-type": "application/json; charset=utf-8",
    };
    if (PrefsService.to.getString("token") != null) {
      String? token = PrefsService.to.getString("token");
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
        Uri.parse("${Urls.logicUrl}AppointmentViewDetails?Id=$id"),
        headers: headers);
    appointmetDetails.value =
        AppointmentDetails.fromJson(json.decode(response.body));
  }

  @override
  void onInit() async {
    await getPatientAppointments();
    super.onInit();
  }
}
