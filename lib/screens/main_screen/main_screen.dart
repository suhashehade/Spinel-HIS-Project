import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen.dart';
import 'package:his_project/screens/doctors_list_screen/doctors_list_screen.dart';
import 'package:his_project/screens/emergency_screen/emergency_screen.dart';
import 'package:his_project/screens/family_medical_file_screen/family_medical_file_screen.dart';
import 'package:his_project/screens/help_screen/help_screen.dart';
import 'package:his_project/screens/home_screen/home_screen.dart';
import 'package:his_project/common/sidebar.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/screens/medical_file_screen/medical_file_screen.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen.dart';
import 'package:his_project/screens/tasks_screen/tasks_screen.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/pages_names.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenController());

    return Scaffold(
      drawer: const CustomSidebar(),
      appBar: const CustomAppBar(
        backWidget: Text(""),
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
                  color: Colors.white,
                ),
                child: FloatingActionButton(
                  shape: const CircleBorder(eccentricity: 0.6),
                  backgroundColor: Color(CustomColors.pacificBlue),
                  onPressed: () {
                    controller.currentPage.value =
                        PagesNames.reserveAppointment1;
                    controller.isHome.value = false;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        height: 40.0,
                        width: 40.0,
                        child:
                            Image.asset("assets/images/reserve_btn_icon.png"),
                      ),
                      Text(
                        "reserveAppointment".tr,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
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
                              : controller.currentPage.value ==
                                      PagesNames.reserveAppointment1
                                  ? const ReserveAppointmentScreen()
                                  : controller.currentPage.value ==
                                          PagesNames.doctorsList
                                      ? const DocotrsListScreen()
                                      : controller.currentPage.value ==
                                              PagesNames.doctorInfo
                                          ? const DoctorInfoScreen()
                                          : controller.currentPage.value ==
                                                  PagesNames.emergency
                                              ? const EmergencyScreen()
                                              : null,
        );
      }),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
