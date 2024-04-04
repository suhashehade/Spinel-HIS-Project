import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/pages_names.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainScreenController mainScreenController = Get.put(MainScreenController());
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.lightGreen,
                    Colors.lightBlue,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      mainScreenController.currentPage.value = PagesNames.home;
                    },
                    child: const Icon(
                      Icons.home,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "خدمة الطوارئ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
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
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset("assets/images/amblance_icon.png"),
                  ),
                  const Text("طلب نقل اسعافي"),
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
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset("assets/images/amplifire_icon.png"),
                  ),
                  const Text("أقرب طوارئ للموقع"),
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
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset("assets/images/fast_response_icon.png"),
                  ),
                  const Text("خدمة فريق الاستجابة السريع"),
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
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset("assets/images/location_icon.png"),
                  ),
                  const Text("أين تجدنا"),
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
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset("assets/images/opinion_icon.png"),
                  ),
                  const Text("رأيك يهمنا"),
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
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset("assets/images/chat_icon.png"),
                  ),
                  const Text("محادثة مباشرة"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
