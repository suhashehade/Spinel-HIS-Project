import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/patient_appointments_screen/patient_appointments_screen_controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PatientAppointmentsScreen
    extends GetView<PatientAppointmentsScreenController> {
  const PatientAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PatientAppointmentsScreenController());
    CalendarController calendarController = CalendarController();
    return Scaffold(
      appBar: AppBar(
        title:  Text("myAppointments".tr),
      ),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Obx(() => controller.meetings.isNotEmpty
              ? SfCalendar(
                  initialDisplayDate: DateTime.now(),
                  controller: calendarController,
                  view: CalendarView.week,
                  firstDayOfWeek: 6,
                  dataSource: MeetingDataSource(controller.meetings),
                  onTap: (calendarTapDetails) =>
                      controller.handleEventTap(calendarTapDetails),
                )
              : const Center(child: CircularProgressIndicator()))),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  PatientAppointmentsScreenController patientAppointmentsScreenController =
      Get.put(PatientAppointmentsScreenController());
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
