import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custome_circular_progress_indicator.dart';
import 'package:his_project/common/sidebar/sidebar.dart';
import 'package:his_project/screens/patient_appointments_screen/controller/patient_appointments_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PatientAppointmentsScreen extends StatelessWidget {
  const PatientAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PatientAppointmentsScreenController patientAppointmentsScreenController =
        Get.find();

    return Scaffold(
      drawer: const CustomSidebar(),
      appBar: AppBar(
        foregroundColor: CustomColors.lightGreen,
        title: Text(ConstRes.myAppointments.tr),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() => patientAppointmentsScreenController.isLoading.value
            ? const Center(
                child: CustomCircularProgressIndicator(),
              )
            : SfCalendar(
                initialDisplayDate: DateTime.now(),
                showCurrentTimeIndicator: true,
                controller:
                    patientAppointmentsScreenController.calendarController,
                view: CalendarView.schedule,
                firstDayOfWeek: 6,
                dataSource: MeetingDataSource(
                    patientAppointmentsScreenController.meetings),
                onTap: (calendarTapDetails) =>
                    patientAppointmentsScreenController
                        .handleEventTap(calendarTapDetails),
              )),
      ),
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
