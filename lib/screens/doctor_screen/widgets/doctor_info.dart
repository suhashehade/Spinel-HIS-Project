import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class DoctorInfo extends GetView<DoctorScreenController> {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorScreenController());

    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360.0),
                        border: GradientBoxBorder(
                            width: 3.0,
                            gradient: LinearGradient(
                              colors: [
                                Color(CustomColors.lightBlue),
                                Color(CustomColors.lightGreen),
                              ],
                            ))),
                    child: Image.asset("assets/images/help_doctor_icon.png"),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 500.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                          colors: [
                            Color(CustomColors.lightBlue),
                            Color(CustomColors.lightGreen),
                          ],
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "doctorInfo".tr,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            "${'gender'.tr}: ${controller.doctorInfo.value.keys[ConstRes.languageCode]!['gender']!}"),
                        Text(
                            "${'nationality'.tr}:  ${controller.doctorInfo.value.keys[ConstRes.languageCode]!['nationality']!}")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 500.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                          colors: [
                            Color(CustomColors.lightBlue),
                            Color(CustomColors.lightGreen),
                          ],
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "details".tr,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            "${'description'.tr}: ${controller.doctorInfo.value.keys[ConstRes.languageCode]!['description']!}")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
