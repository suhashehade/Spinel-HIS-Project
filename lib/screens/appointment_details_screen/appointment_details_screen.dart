import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/screens/patient_appointments_screen/patient_appointments_screen_controller.dart';
import 'package:his_project/utils/consts_res.dart';
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
              Center(child: Text("appointmentDetails".tr)),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                  "${'patient'.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.keys[ConstRes.languageCode]!['patientName']!}"),
              Text(
                  "${'doctor'.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.keys[ConstRes.languageCode]!['doctorName']!}"),
              Text(
                  "${'clinic'.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.keys[ConstRes.languageCode]!['departmentName']!}"),
              Text(
                  "${'branch'.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.keys[ConstRes.languageCode]!['branchName']!}"),
              Text(
                  "${'reason'.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.keys[ConstRes.languageCode]!['reasonName']!}"),
              Text(
                  "${'status'.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.keys[ConstRes.languageCode]!['statusName']!}"),
              Text(
                  "${'date'.tr}: ${DateFormat.yMMMd().format(DateTime.parse(patientAppointmentsScreenController.appointmetDetails.value.fromDate))}"),
              Text(
                  "${'fromTime'.tr}: ${DateFormat('HH:mm a').format(DateTime.parse(patientAppointmentsScreenController.appointmetDetails.value.fromDate))}"),
              Text(
                  "${'toTime'.tr}: ${DateFormat('HH:mm a').format(DateTime.parse(patientAppointmentsScreenController.appointmetDetails.value.toDate))}"),
              Text(
                  "${'notes'.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.note}"),
            ],
          ),
        ));
  }
}
