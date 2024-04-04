import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/screens/patient_appointments_screen/patient_appointments_screen_controller.dart';
import 'package:intl/intl.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PatientAppointmentsScreenController patientAppointmentsScreenController =
        Get.put(PatientAppointmentsScreenController());
    return Scaffold(
        appBar: const CustomAppBar(backWidget: Text("")),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const Center(child: Text("Appointment Details")),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                  "Patient Name: ${patientAppointmentsScreenController.appointmetDetails.value.patientNameEn}"),
              Text(
                  "Doctor Name: ${patientAppointmentsScreenController.appointmetDetails.value.doctorNameEn}"),
              Text(
                  "Department Name: ${patientAppointmentsScreenController.appointmetDetails.value.departmentNameEn}"),
              Text(
                  "Branch Name: ${patientAppointmentsScreenController.appointmetDetails.value.branchNameEn}"),
              Text(
                  "Reason Name: ${patientAppointmentsScreenController.appointmetDetails.value.reasonEn}"),
              Text(
                  "Reason Name: ${patientAppointmentsScreenController.appointmetDetails.value.reasonEn}"),
              Text(
                  "Date: ${DateFormat.yMMMd().format(DateTime.parse(patientAppointmentsScreenController.appointmetDetails.value.fromDate))}"),
              Text(
                  "From Time: ${DateFormat('HH:mm a').format(DateTime.parse(patientAppointmentsScreenController.appointmetDetails.value.fromDate))}"),
              Text(
                  "To Time: ${DateFormat('HH:mm a').format(DateTime.parse(patientAppointmentsScreenController.appointmetDetails.value.toDate.toString()))}"),
              Text(
                  "Notes: ${patientAppointmentsScreenController.appointmetDetails.value.note}"),
            ],
          ),
        ));
  }
}
