import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/screens/reservation_confirmation_screen/reservation_confirmation_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ReservationConfirmationScreenController
        reservationConfirmationScreenController =
        Get.put(ReservationConfirmationScreenController());

    return Container(
      padding: const EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [
            Color(CustomColors.lightBlue),
            Color(CustomColors.lightGreen),
          ]),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ConstRes.patientInfo.tr,
            style: TextStyle(
              color: Color(CustomColors.lightBlue),
              fontSize: 20.0,
            ),
          ),
          Obx(
            () => Text(
              "${ConstRes.patientName.tr}: ${reservationConfirmationScreenController.patient.value.keys[PrefsService.to.getString(ConstRes.langkey) ?? Get.locale?.languageCode]![ConstRes.nameKey]!}",
              style: TextStyle(
                color: Color(CustomColors.lightBlue),
                fontSize: 16.0,
              ),
            ),
          ),
          Obx(
            () => Text(
              "${ConstRes.age.tr}: ${reservationConfirmationScreenController.age.value}",
              style: TextStyle(
                color: Color(CustomColors.lightBlue),
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
