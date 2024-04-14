import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/emergency_screen/emergency_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EmergencyScreenController emergencyScreenController =
        Get.put(EmergencyScreenController());

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            SubAppBar(
              title: "emergency",
              handleReturn: emergencyScreenController.returnToHome,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(CustomColors.white),
                  border: GradientBoxBorder(
                      gradient: LinearGradient(colors: [
                    Color(CustomColors.lightBlue),
                    Color(CustomColors.lightGreen),
                  ]))),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("askAmbulance".tr),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset("assets/images/amblance_icon.png"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(CustomColors.white),
                  border: GradientBoxBorder(
                      gradient: LinearGradient(colors: [
                    Color(CustomColors.lightBlue),
                    Color(CustomColors.lightGreen),
                  ]))),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("closestEmergencyLocation".tr),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset("assets/images/amplifire_icon.png"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(CustomColors.white),
                  border: GradientBoxBorder(
                      gradient: LinearGradient(colors: [
                    Color(CustomColors.lightBlue),
                    Color(CustomColors.lightGreen),
                  ]))),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("fastResponseTeam".tr),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset("assets/images/fast_response_icon.png"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(CustomColors.white),
                  border: GradientBoxBorder(
                      gradient: LinearGradient(colors: [
                    Color(CustomColors.lightBlue),
                    Color(CustomColors.lightGreen),
                  ]))),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ourLocation".tr),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset("assets/images/location_icon.png"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(CustomColors.white),
                  border: GradientBoxBorder(
                      gradient: LinearGradient(colors: [
                    Color(CustomColors.lightBlue),
                    Color(CustomColors.lightGreen),
                  ]))),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("yourOpinion".tr),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset("assets/images/opinion_icon.png"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(CustomColors.white),
                  border: GradientBoxBorder(
                      gradient: LinearGradient(colors: [
                    Color(CustomColors.lightBlue),
                    Color(CustomColors.lightGreen),
                  ]))),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("chat".tr),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset("assets/images/chat_icon.png"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
