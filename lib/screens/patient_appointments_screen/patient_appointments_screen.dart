import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/patient_appointments_screen/patient_appointments_screen_controller.dart';

class PatientAppointmentsScreen
    extends GetView<PatientAppointmentsScreenController> {
  const PatientAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PatientAppointmentsScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Appointments"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () => ListView(
            children: controller.appointments
                .map((a) => Card(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text("Department Name: ${a.departmentName}"),
                            Text("Branch Name: ${a.branchName}"),
                            Text("Doctor Name: ${a.doctorName}"),
                            Text("Patient Name: ${a.patientName}"),
                            Text("From Date: ${a.fromDate}"),
                            Text("To Date: ${a.toDate}"),
                            Text("Status Name: ${a.statusName}"),
                            Text("Resone Name: ${a.reasonId}"),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
