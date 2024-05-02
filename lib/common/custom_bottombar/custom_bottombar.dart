import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar_controller.dart';
import 'package:his_project/screens/main_screen/controller/main_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    CustomBottombarController customBottombarController =
        Get.put(CustomBottombarController());
    MainScreenController mainScreenController = Get.put(MainScreenController());
    return GetX(builder: (CustomBottombarController controller) {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomColors.lightBlue,
              CustomColors.lightGreen,
            ],
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: controller.index.value,
          backgroundColor: Colors.transparent,
          selectedItemColor: CustomColors.white,
          unselectedItemColor: CustomColors.transparentWhite,
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
              label: ConstRes.medicalFile.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.family_restroom,
              ),
              label: ConstRes.familyFile.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
              ),
              label: mainScreenController.isHome.value ? '' : ConstRes.home.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.calendar_month,
              ),
              label: ConstRes.tasks.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.help,
                color: CustomColors.white,
              ),
              label: ConstRes.help.tr,
            ),
          ],
          onTap: (index) {
            Get.back();
            customBottombarController.changeIndex(index);
            customBottombarController.switchPages(index);
          },
        ),
      );
    });
  }
}
