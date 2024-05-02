import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/sidebar/sidebar.dart';
import 'package:his_project/screens/login_screen/controller/login_screen_controller.dart';
import 'package:his_project/screens/patient_appointments_screen/controller/patient_appointments_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:intl/intl.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PatientAppointmentsScreenController patientAppointmentsScreenController =
        Get.put(PatientAppointmentsScreenController());
    LoginScreenController loginScreenController =
        Get.put(LoginScreenController());
    return Scaffold(
        drawer: const CustomSidebar(),
        appBar: const CustomAppBar(
          backWidget: Text(""),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Center(child: Text(ConstRes.appointmentDetails.tr)),
              const SizedBox(
                height: 20.0,
              ),
              Obx(
                () => SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: loginScreenController.patient.value.profilePic ==
                              "null" ||
                          loginScreenController.patient.value.profilePic == ''
                      ? ConstAssets.userIcon
                      : Image.asset(
                          loginScreenController.patient.value.profilePic!),
                ),
              ),
              Text(
                "${ConstRes.patient.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.keys[PrefsService.to.getString(ConstRes.langkey) ?? Get.locale?.languageCode]![ConstRes.patientNameKey]!}",
              ),
              Text(
                "${ConstRes.doctor.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.keys[PrefsService.to.getString(ConstRes.langkey) ?? Get.locale?.languageCode]![ConstRes.doctorNameKey]!}",
              ),
              Text(
                "${ConstRes.clinic.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.keys[PrefsService.to.getString(ConstRes.langkey) ?? Get.locale?.languageCode]![ConstRes.departmentNameKey]!}",
              ),
              Text(
                "${ConstRes.branch.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.keys[PrefsService.to.getString(ConstRes.langkey) ?? Get.locale?.languageCode]![ConstRes.branchNameKey]!}",
              ),
              Text(
                "${ConstRes.reason.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.keys[PrefsService.to.getString(ConstRes.langkey) ?? Get.locale?.languageCode]![ConstRes.reasonNameKey]!}",
              ),
              Text(
                "${ConstRes.status.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.keys[PrefsService.to.getString(ConstRes.langkey) ?? Get.locale?.languageCode]![ConstRes.statusNameKey]!}",
              ),
              Text(
                "${ConstRes.date.tr}: ${DateFormat.yMMMd().format(DateTime.parse(patientAppointmentsScreenController.appointmetDetails.value.fromDate))}",
              ),
              Text(
                "${ConstRes.fromTime.tr}: ${DateFormat(ConstRes.timePattern1).format(DateTime.parse(patientAppointmentsScreenController.appointmetDetails.value.fromDate))}",
              ),
              Text(
                "${ConstRes.toTime.tr}: ${DateFormat(ConstRes.timePattern1).format(DateTime.parse(patientAppointmentsScreenController.appointmetDetails.value.toDate))}",
              ),
              Text(
                "${ConstRes.notes.tr}: ${patientAppointmentsScreenController.appointmetDetails.value.note}",
              ),
            ],
          ),
        ));
  }
}
