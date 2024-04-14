import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/service.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/pages_names.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    MainScreenController mainScreenController = Get.put(MainScreenController());
    return Container(
      padding: const EdgeInsets.all(0.0),
      height: 500,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  PrefsService.to.setInt("afterLogin", 1);
                  mainScreenController.isHome.value = false;
                  mainScreenController.currentPage.value =
                      PagesNames.reserveAppointment1;
                },
                child: Service(
                  serviceName: "reserveAppointment".tr,
                  serviceIcon: "assets/images/reserve_appointment_icon.png",
                ),
              ),
              InkWell(
                onTap: () {
                  PrefsService.to.setInt("afterLogin", 2);
                  mainScreenController.isHome.value = false;
                  Get.toNamed(PagesNames.reserveAppointment);
                },
                child: Service(
                  serviceName: "lifeCare".tr,
                  serviceIcon: "assets/images/life_care_icon.png",
                ),
              ),
              InkWell(
                onTap: () {
                  PrefsService.to.setInt("afterLogin", 4);
                  mainScreenController.isHome.value = false;
                  mainScreenController.currentPage.value = PagesNames.emergency;
                },
                child: Service(
                  serviceName: "emergency".tr,
                  serviceIcon: "assets/images/emergency_icon.png",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  PrefsService.to.setInt("afterLogin", 5);
                  mainScreenController.isHome.value = false;
                  Get.toNamed(PagesNames.reserveAppointment);
                },
                child: Service(
                  serviceName: "payment".tr,
                  serviceIcon: "assets/images/payment_icon.png",
                ),
              ),
              InkWell(
                onTap: () {
                  PrefsService.to.setInt("afterLogin", 0);
                  if (PrefsService.to.getString("token") == null) {
                    Get.toNamed(PagesNames.preLogin);
                  } else {
                    Get.toNamed(PagesNames.patientAppiontments);
                  }
                },
                child: Service(
                  serviceName: "allAppointments".tr,
                  serviceIcon: "assets/images/reserve_appointment_icon.png",
                ),
              ),
              InkWell(
                onTap: () {
                  PrefsService.to.setInt("afterLogin", 3);
                  Get.toNamed(PagesNames.reserveAppointment);
                },
                child: Service(
                  serviceName: "homeCare".tr,
                  serviceIcon: "assets/images/home_care_icon.png",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  PrefsService.to.setInt("afterLogin", 6);
                  Get.toNamed(PagesNames.reserveAppointment);
                },
                child: Service(
                  serviceName: "contactUs".tr,
                  serviceIcon: "assets/images/contact_icon.png",
                ),
              ),
              InkWell(
                onTap: () {
                  PrefsService.to.setInt("afterLogin", 7);
                  Get.toNamed(PagesNames.reserveAppointment);
                },
                child: Service(
                  serviceName: "comprehensiveExamination".tr,
                  serviceIcon: "assets/images/full_check_icon.png",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
