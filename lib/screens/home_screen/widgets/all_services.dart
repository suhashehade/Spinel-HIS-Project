import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/home_screen/widgets/service.dart';
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
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          InkWell(
            onTap: () {
              PrefsService.to.setInt("afterLogin", 4);
              mainScreenController.currentPage.value = PagesNames.emergency;
            },
            child: const Service(
              serviceName: "الطوارئ",
              serviceIcon: "assets/images/emergency_icon.png",
            ),
          ),
          InkWell(
            onTap: () {
              PrefsService.to.setInt("afterLogin", 2);
              mainScreenController.isHome.value = false;
              Get.toNamed(PagesNames.reserveAppointment);
            },
            child: const Service(
              serviceName: "لايف كير",
              serviceIcon: "assets/images/life_care_icon.png",
            ),
          ),
          InkWell(
            onTap: () {
              PrefsService.to.setInt("afterLogin", 1);
              mainScreenController.isHome.value = false;
              mainScreenController.currentPage.value =
                  PagesNames.reserveAppointment1;
            },
            child: const Service(
              serviceName: "حجز موعد",
              serviceIcon: "assets/images/reserve_appointment_icon.png",
            ),
          ),
          InkWell(
            onTap: () {
              PrefsService.to.setInt("afterLogin", 5);
              mainScreenController.isHome.value = false;
              Get.toNamed(PagesNames.reserveAppointment);
            },
            child: const Service(
              serviceName: "الدفع الإلكتروني",
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
            child: const Service(
              serviceName: "كافة المواعيد",
              serviceIcon: "assets/images/reserve_appointment_icon.png",
            ),
          ),
          InkWell(
            onTap: () {
              PrefsService.to.setInt("afterLogin", 3);
              Get.toNamed(PagesNames.reserveAppointment);
            },
            child: const Service(
              serviceName: "الرعاية المنزلية",
              serviceIcon: "assets/images/home_care_icon.png",
            ),
          ),
          InkWell(
            onTap: () {
              PrefsService.to.setInt("afterLogin", 6);
              Get.toNamed(PagesNames.reserveAppointment);
            },
            child: const Service(
              serviceName: "تواصل معنا",
              serviceIcon: "assets/images/contact_icon.png",
            ),
          ),
          InkWell(
            onTap: () {
              PrefsService.to.setInt("afterLogin", 7);
              Get.toNamed(PagesNames.reserveAppointment);
            },
            child: const Service(
              serviceName: "الفحص الشامل",
              serviceIcon: "assets/images/full_check_icon.png",
            ),
          ),
        ],
      ),
    );
  }
}
