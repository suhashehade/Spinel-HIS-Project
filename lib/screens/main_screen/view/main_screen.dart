import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar_controller.dart';
import 'package:his_project/common/sidebar/sidebar.dart';
import 'package:his_project/screens/main_screen/controller/main_screen_controller.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/lists.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomBottombarController customBottombarController =
        Get.put(CustomBottombarController());
    MainScreenController mainScreenController = Get.put(MainScreenController());
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return !Get.isOpaqueRouteDefault;
      },
      child: Scaffold(
        drawer: const CustomSidebar(),
        appBar: const CustomAppBar(
          backWidget: SizedBox(),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: GetX<MainScreenController>(
            builder: (MainScreenController controller) {
          return controller.isHome.value
              ? Container(
                  padding: const EdgeInsets.all(5.0),
                  height: 80.0,
                  width: 80.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    color: CustomColors.white,
                  ),
                  child: FloatingActionButton(
                    shape: const CircleBorder(eccentricity: 0.5),
                    backgroundColor: CustomColors.pacificBlue,
                    onPressed: () {
                      mainScreenController.toReserveAppointment();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: ConstAssets.reserveBtnIcon,
                        ),
                        Text(
                          ConstRes.reserveAppointment.tr,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 13.0,
                            color: CustomColors.white,
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
              child: Lists.pages[customBottombarController.index.value]);
        }),
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }
}
