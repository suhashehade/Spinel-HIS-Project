import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/sidebar/sidebar.dart';
import 'package:his_project/screens/patient_appointments_screen/patient_appointments_screen_controller.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PatientAppointmentsScreen extends StatelessWidget {
  const PatientAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PatientAppointmentsScreenController patientAppointmentsScreenController =
        Get.put(PatientAppointmentsScreenController());
    CalendarController calendarController = CalendarController();
    return Scaffold(
      drawer: const CustomSidebar(),
      appBar: AppBar(
        title: Text(ConstRes.myAppointments.tr),
      ),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          child:
              Obx(() => patientAppointmentsScreenController.meetings.isNotEmpty
                  ? SfCalendar(
                      initialDisplayDate: DateTime.now(),
                      controller: calendarController,
                      view: CalendarView.week,
                      firstDayOfWeek: 6,
                      dataSource: MeetingDataSource(
                          patientAppointmentsScreenController.meetings),
                      onTap: (calendarTapDetails) =>
                          patientAppointmentsScreenController
                              .handleEventTap(calendarTapDetails),
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
