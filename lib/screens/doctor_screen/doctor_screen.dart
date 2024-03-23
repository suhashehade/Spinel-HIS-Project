import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/doctor/doctor.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/doctor_screen/widgets/doctor_appointments.dart';
import 'package:his_project/screens/doctor_screen/widgets/doctor_info.dart';

class DoctorInfoScreen extends GetView<DoctorInfoScreenController> {
  const DoctorInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorInfoScreenController());
    Doctor doctor = Get.arguments['doctor'];
    return DefaultTabController(
      animationDuration: const Duration(microseconds: 5),
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            doctor.name,
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
          DoctorAppointments(),
        ]),
      ),
    );
  }
}
