import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';

class ChooseDoctor extends GetView<ReserveAppointmentScreenController> {
  const ChooseDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Doctors"),
    );
  }
}
