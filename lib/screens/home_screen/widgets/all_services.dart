import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/service.dart';
import 'package:his_project/screens/home_screen/home_screen_controller.dart';
import 'package:his_project/utils/consts_res.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    return Container(
      padding: const EdgeInsets.all(0.0),
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  homeScreenController.toReserveAppointment();
                },
                child: Service(
                  serviceName: ConstRes.reserveAppointment.tr,
                  serviceIcon: ConstRes.reserveAppointmentIcon,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Service(
                  serviceName: ConstRes.lifeCare.tr,
                  serviceIcon: ConstRes.lifeCareIcon,
                ),
              ),
              InkWell(
                onTap: () {
                  homeScreenController.toEmergency();
                },
                child: Service(
                  serviceName: ConstRes.emergencyServices.tr,
                  serviceIcon: ConstRes.emergencyIcon,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Service(
                  serviceName: ConstRes.payment.tr,
                  serviceIcon: ConstRes.paymentIcon,
                ),
              ),
              InkWell(
                onTap: () {
                  homeScreenController.toPatientAppointments();
                },
                child: Service(
                  serviceName: ConstRes.allAppointments.tr,
                  serviceIcon: ConstRes.reserveAppointmentIcon,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Service(
                  serviceName: ConstRes.homeCare.tr,
                  serviceIcon: ConstRes.homeCareIcon,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Service(
                  serviceName: ConstRes.contactUs.tr,
                  serviceIcon: ConstRes.contactUsIcon,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Service(
                  serviceName: ConstRes.comprehensiveExamination.tr,
                  serviceIcon: ConstRes.comprehensiveExaminationIcon,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
