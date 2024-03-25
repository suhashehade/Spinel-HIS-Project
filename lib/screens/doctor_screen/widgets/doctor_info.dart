import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';

class DoctorInfo extends GetView<DoctorScreenController> {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorScreenController());
    return Scaffold(
      body: Obx(
        () => Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text("Doctor Inforamation"),
                  Text("Gender: ${controller.doctorInfo.value.gender}"),
                  Text(
                      "Nationality:  ${controller.doctorInfo.value.nationality} "),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text("Doctor Inforamation"),
                  Text(
                      "Description: ${controller.doctorInfo.value.description}"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
