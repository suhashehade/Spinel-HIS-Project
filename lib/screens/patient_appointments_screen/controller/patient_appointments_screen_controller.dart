import 'dart:convert';

import 'package:get/get.dart';
import 'package:his_project/models/appointment/appointment_details.dart';
import 'package:his_project/models/appointment/patient_appointments.dart';
import 'package:his_project/screens/appointment_details_screen/view/appointment_details_screen.dart';
import 'package:his_project/services/appointment_api_service.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PatientAppointmentsScreenController extends GetxController {
  RxList<PatientAppointment> appointments = <PatientAppointment>[].obs;
  RxList<Appointment> meetings = <Appointment>[].obs;
  Rx<DateTime?> currentDay = DateTime.now().obs;
  RxBool isLoading = false.obs;
  RxInt appointmentId = 0.obs;
  Rx<AppointmentDetails> appointmetDetails = AppointmentDetails(0, "", "", "",
          "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
      .obs;
  CalendarController calendarController = CalendarController();
  getPatientAppointments() async {
    isLoading.value = true;
    appointments.clear();
    if (PrefsService.to.getInt("id") != null) {
      
      var response = await AppointmentAPI.getPatientAppointments();
      appointments.value = (json.decode(response.body)['lstData'] as List)
          .map((tagJson) => PatientAppointment.fromJson(tagJson))
          .toList();
      getAppointments(response);
      isLoading.value = false;
    }
  }

  getAppointments(response) {
    meetings.clear();
    for (var a in appointments) {
      // isLoading.value = true;
      // String reasonName = await getAppointmentReasonName(a.id);
      DateTime.parse(a.fromDate).isAfter(DateTime.now()) ||
              DateTime.parse(a.fromDate).day == DateTime.now().day
          ? meetings.add(
              Appointment(
                id: a.id,
                startTime: DateTime.parse(a.fromDate),
                endTime: DateTime.parse(a.toDate),
                subject: a.keys[PrefsService.to.getString(ConstRes.langkey) ??
                        Get.locale?.languageCode]![ConstRes.statusNameKey]!
                    .toString(),
                color: CustomColors.pacificBlue,
                recurrenceId: response.body,
              ),
            )
          : null;
      // isLoading.value = false;
    }
  }

  getAppointmentReasonName(int id) async {
    var response = await AppointmentAPI.getAppointmentDetails(id);
    return response.keys[PrefsService.to.getString(ConstRes.langkey) ??
            Get.locale?.languageCode]![ConstRes.reasonNameKey]!
        .toString();
  }

  void handleEventTap(CalendarTapDetails calendarTapDetails) async {
    await getAppointmentDetails(calendarTapDetails.appointments![0].id);
    Get.to(() => const AppointmentDetailsScreen());
  }

  getAppointmentDetails(int id) async {
    appointmetDetails.value = await AppointmentAPI.getAppointmentDetails(id);
  }

  @override
  void onInit() async {
    await getPatientAppointments();
    super.onInit();
  }
}
