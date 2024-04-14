import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/appointment/appointment_details.dart';
import 'package:his_project/models/appointment/patient_appointments.dart';
import 'package:his_project/screens/appointment_details_screen/appointment_details_screen.dart';
import 'package:his_project/services/api_service.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PatientAppointmentsScreenController extends GetxController {
  RxList<PatientAppointment> appointments = <PatientAppointment>[].obs;
  RxList<Appointment> meetings = <Appointment>[].obs;
  Rx<DateTime?> currentDay = DateTime.now().obs;
  Rx<AppointmentDetails> appointmetDetails = AppointmentDetails(0, "", "", "",
          "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
      .obs;

  getPatientAppointments() async {
    var response = await Api.getPatientAppointments();
    appointments.value = (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => PatientAppointment.fromJson(tagJson))
        .toList();
    getAppointments(response);
  }

  getAppointments(response) {
    for (var a in appointments) {
      DateTime.parse(a.fromDate).isAfter(DateTime.now()) ||
              DateTime.parse(a.fromDate).day == DateTime.now().day
          ? meetings.add(
              Appointment(
                id: a.id,
                startTime: DateTime.parse(a.fromDate),
                endTime: DateTime.parse(a.toDate),
                subject:
                    a.keys[ConstRes.languageCode]!['statusName']!.toString(),
                color: Color(CustomColors.pacificBlue),
                recurrenceId: response.body,
              ),
            )
          : null;
    }
  }

  void handleEventTap(CalendarTapDetails calendarTapDetails) async {
    await getAppointmentDetails(calendarTapDetails.appointments![0].id);
    Get.to(() => const AppointmentDetailsScreen());
  }

  getAppointmentDetails(int id) async {
    appointmetDetails.value = await Api.getAppointmentDetails(id);
  }

  @override
  void onInit() async {
    await getPatientAppointments();
    super.onInit();
  }
}
