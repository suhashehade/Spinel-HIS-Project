import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/service.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: "reserveAppointment".tr,
              serviceIcon: "assets/images/reserve_appointment_icon.png",
            ),
            Service(
              serviceName: "lifeCare".tr,
              serviceIcon: "assets/images/life_care_icon.png",
            ),
            Service(
              serviceName: "emergency".tr,
              serviceIcon: "assets/images/emergency_icon.png",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: "homeCare".tr,
              serviceIcon: "assets/images/home_care_icon.png",
            ),
            Service(
              serviceName: "comprehensiveExamination".tr,
              serviceIcon: "assets/images/full_check_icon.png",
            ),
            Service(
              serviceName: "pharmacy".tr,
              serviceIcon: "assets/images/healthicons--pharmacy-negative.png",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: "fileDetails".tr,
              serviceIcon: "assets/images/uil--folder-medical.png",
            ),
            Service(
              serviceName: "familyFiles".tr,
              serviceIcon: "assets/images/noto-v1--family.png",
            ),
            Service(
              serviceName: "payment".tr,
              serviceIcon: "assets/images/mage--visa-square.png",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: "childrenVaccine".tr,
              serviceIcon: "assets/images/vaccinates_icon.png",
            ),
            Service(
              serviceName: "insuranceUpdate".tr,
              serviceIcon: "assets/images/noto--identification-card.png",
            ),
            Service(
              serviceName: "assignments".tr,
              serviceIcon:
                  "assets/images/material-symbols--assignment-return.png",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: "waterConsume".tr,
              serviceIcon: "assets/images/ion--water.png",
            ),
            Service(
              serviceName: "calculator".tr,
              serviceIcon: "assets/images/mdi--calculator.png",
            ),
            Service(
              serviceName: "transformMesurments".tr,
              serviceIcon: "assets/images/clarity--two-way-arrows-line.png",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: "tasks".tr,
              serviceIcon: "assets/images/fluent--tasks-app-20-filled.png",
            ),
            Service(
              serviceName: "bloodDonation".tr,
              serviceIcon: "assets/images/twemoji--drop-of-blood.png",
            ),
            Service(
              serviceName: "covid19".tr,
              serviceIcon: "assets/images/covid--covid19-virus-1.png",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: "virtualTour".tr,
              serviceIcon: "assets/images/iconoir--view-360.png",
            ),
            Service(
              serviceName: "smartWatches".tr,
              serviceIcon: "assets/images/smart_watch_icon.png",
            ),
            Service(
              serviceName: "parking".tr,
              serviceIcon: "assets/images/icon-park-outline--parking.png",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Service(
              serviceName: "news".tr,
              serviceIcon: "assets/images/twemoji--studio-microphone.png",
            ),
            Service(
              serviceName: "contactUs".tr,
              serviceIcon: "assets/images/contact_icon.png",
            ),
          ],
        )
      ],
    );
  }
}
