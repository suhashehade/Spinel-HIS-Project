import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar_controller.dart';
import 'package:his_project/utils/pages_names.dart';

class CustomBottomBar extends GetView<CustomBottombarController> {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomBottombarController());

    return GetX(builder: (CustomBottombarController controller) {
      return BottomNavigationBar(
        currentIndex: controller.index.value,
        backgroundColor: const Color.fromARGB(255, 155, 155, 155),
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: const Color.fromARGB(255, 76, 76, 76),
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
            label: PagesNames.medicalFile,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.family_restroom,
            ),
            label: PagesNames.familyFile,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
            ),
            label: PagesNames.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.calendar_month,
            ),
            label: PagesNames.tasks,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.help,
            ),
            label: PagesNames.help,
          ),
        ],
        onTap: (index) {
          controller.changeIndex(index);
          controller.switchPages(index);
        },
      );
    });
  }
}
