import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/home_screen/widgets/service.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/pages_names.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        InkWell(
            onTap: () {
              PrefsService.to.setInt("afterLogin", 1);
              Get.toNamed(PagesNames.reserveAppointment);
            },
            child: const Service(
              serviceName: "Reserve Appointment",
            )),
        InkWell(
            onTap: () {
              if (PrefsService.to.getInt("afterLogin") != null) {
                Get.toNamed(PagesNames.patientAppiontments);
              } else {
                PrefsService.to.setInt("afterLogin", 0);
                Get.toNamed(PagesNames.preLogin);
              }
            },
            child: const Service(
              serviceName: "Appointments",
            )),
      ],
    );
  }
}
