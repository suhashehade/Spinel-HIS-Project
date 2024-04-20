import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar_controller.dart';
import 'package:his_project/common/sidebar.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomBottombarController customBottombarController =
        Get.put(CustomBottombarController());
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
                padding: const EdgeInsets.all(8.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                  color: Color(CustomColors.white),
                ),
                child: FloatingActionButton(
                  shape: const CircleBorder(eccentricity: 0.5),
                  backgroundColor: Color(CustomColors.pacificBlue),
                  onPressed: () {
                    Get.to(() => const ReserveAppointmentScreen());
                    controller.isHome.value = false;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        height: 30.0,
                        width: 30.0,
                        child: Image.asset(ConstRes.reserveBtnIcon),
                      ),
                      Text(
                        ConstRes.reserveAppointment.tr,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(CustomColors.white),
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
            child: ConstRes.pages[customBottombarController.index.value]);
      }),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
