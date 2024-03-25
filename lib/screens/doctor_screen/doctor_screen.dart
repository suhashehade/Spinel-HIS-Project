import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/doctor/branch_dep_doctor.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/doctor_screen/widgets/available_appointments.dart';
import 'package:his_project/screens/doctor_screen/widgets/doctor_info.dart';

class DoctorInfoScreen extends GetView<DoctorScreenController> {
  const DoctorInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Doctor doctor = Get.arguments['doctor'];
    Get.put(DoctorScreenController());

    return DefaultTabController(
      animationDuration: const Duration(microseconds: 5),
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            doctor.label,
            textAlign: TextAlign.end,
          ),
          bottom: TabBar(
            tabs: const [
              Text("Doctor Inforamtion"),
              Text("Available appointments"),
            ],
            onTap: (value) => controller.changeChoice(value),
          ),
        ),
        body: const TabBarView(children: [
          DoctorInfo(),
          AvailableAppointment(),
        ]),
      ),
    );
  }
}
