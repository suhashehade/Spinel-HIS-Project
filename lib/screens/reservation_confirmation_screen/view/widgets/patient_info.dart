import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/common/custome_circular_progress_indicator.dart';
import 'package:his_project/screens/reservation_confirmation_screen/controller/reservation_confirmation_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ReservationConfirmationScreenController
        reservationConfirmationScreenController = Get.find();

    return Container(
      padding: const EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: const GradientBoxBorder(
          gradient: LinearGradient(colors: [
            CustomColors.lightBlue,
            CustomColors.lightGreen,
          ]),
        ),
      ),
      child: Obx(
        () => reservationConfirmationScreenController.isLoading.value
            ? const CustomCircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ConstRes.patientInfo.tr,
                    style: const TextStyle(
                      color: CustomColors.lightBlue,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "${ConstRes.patientName.tr}: ${reservationConfirmationScreenController.patient.value.keys[PrefsService.to.getString(ConstRes.langkey) ?? Get.locale?.languageCode]![ConstRes.nameKey]!}",
                    style: const TextStyle(
                      color: CustomColors.lightBlue,
                      fontSize: 16.0,
                    ),
                  ),
                  reservationConfirmationScreenController.isLoading.value
                      ? const CustomCircularProgressIndicator()
                      : Text(
                          "${ConstRes.age.tr}: ${reservationConfirmationScreenController.age.value}",
                          style: const TextStyle(
                            color: CustomColors.lightBlue,
                            fontSize: 16.0,
                          ),
                        ),
                ],
              ),
      ),
    );
  }
}
