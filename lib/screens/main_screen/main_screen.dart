import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar.dart';
import 'package:his_project/screens/family_medical_file_screen/family_medical_file_screen.dart';
import 'package:his_project/screens/help_screen/help_screen.dart';
import 'package:his_project/screens/home_screen/home_screen.dart';
import 'package:his_project/screens/login_screen/login_screen_controller.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/screens/medical_file_screen/medical_file_screen.dart';
import 'package:his_project/screens/tasks_screen/tasks_screen.dart';
import 'package:his_project/utils/pages_names.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenController());
    LoginScreenController loginScreenController =
        Get.put(LoginScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
        actions: [
          IconButton(
              onPressed: loginScreenController.logout,
              icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: GetX<MainScreenController>(
          builder: (MainScreenController controller) {
        return controller.isHome.value
            ? Container(
                padding: const EdgeInsets.all(10.0),
                height: 130.0,
                width: 130.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  color: Color.fromARGB(255, 234, 234, 234),
                ),
                child: FloatingActionButton(
                  shape: const CircleBorder(eccentricity: 0.6),
                  backgroundColor: Colors.red,
                  onPressed: () {
                    Get.toNamed(PagesNames.reserveAppointment);
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month, color: Colors.white),
                      Text('احجز موعد',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white)),
                    ],
                  ),
                ),
              )
            : const Text('');
      }),
      body: GetX<MainScreenController>(
          builder: (MainScreenController controller) {
        return Container(
          child: controller.currentPage.value == PagesNames.medicalFile
              ? const MedicalFileScreen()
              : controller.currentPage.value == PagesNames.familyFile
                  ? const FamilyMedicalFileScreen()
                  : controller.currentPage.value == PagesNames.home
                      ? const HomeScreen()
                      : controller.currentPage.value == PagesNames.tasks
                          ? const TasksScreen()
                          : controller.currentPage.value == PagesNames.help
                              ? const HelpScreen()
                              : null,
        );
      }),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
