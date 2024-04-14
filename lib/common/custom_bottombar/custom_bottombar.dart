import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar_controller.dart';
import 'package:his_project/utils/colors_res.dart';

class CustomBottomBar extends GetView<CustomBottombarController> {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomBottombarController());

    return GetX(builder: (CustomBottombarController controller) {
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(CustomColors.lightBlue),
          Color(CustomColors.lightGreen),
        ])),
        child: BottomNavigationBar(
          currentIndex: controller.index.value,
          backgroundColor: Colors.transparent,
          selectedItemColor: Color(CustomColors.white),
          unselectedItemColor: Color(CustomColors.transparentWhite),
          showUnselectedLabels: true,
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontSize: 10.0),
          unselectedLabelStyle: const TextStyle(fontSize: 10.0),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.file_present,
              ),
              label: "medicalFile".tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.family_restroom,
              ),
              label: "familyFile".tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
              ),
              label: "home".tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.calendar_month,
              ),
              label: "tasks".tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.help,
                color: Color(CustomColors.white),
              ),
              label: "help".tr,
            ),
          ],
          onTap: (index) {
            controller.changeIndex(index);
            controller.switchPages(index);
          },
        ),
      );
    });
  }
}
