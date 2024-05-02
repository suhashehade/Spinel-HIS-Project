import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/screens/reservation_confirmation_screen/controller/reservation_confirmation_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:intl/intl.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReservationConfirmationScreenController
        reservationConfirmationScreenController = Get.find();
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: const GradientBoxBorder(
          gradient: LinearGradient(colors: [
            CustomColors.lightBlue,
            CustomColors.lightGreen,
          ]),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ConstRes.appointmentDetails.tr,
            style: const TextStyle(
              color: CustomColors.lightBlue,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "${ConstRes.clinic.tr}: ${reservationConfirmationScreenController.doctorScreenController.doctorsListArguments.value.depName}",
            style: const TextStyle(
              color: CustomColors.lightBlue,
              fontSize: 16.0,
            ),
          ),
          Text(
            "${ConstRes.date.tr}: ${DateFormat.yMMMd().format(DateTime.parse(reservationConfirmationScreenController.reserveArguments.value.fromDate))}",
            style: const TextStyle(
              color: CustomColors.lightBlue,
              fontSize: 16.0,
            ),
          ),
          Text(
            "${ConstRes.fromTime.tr}: ${DateFormat(ConstRes.timePattern1).format(DateTime.parse(reservationConfirmationScreenController.reserveArguments.value.fromDate))}",
            style: const TextStyle(
              color: CustomColors.lightBlue,
              fontSize: 16.0,
            ),
          ),
          Text(
            "${ConstRes.toTime.tr}: ${DateFormat(ConstRes.timePattern1).format(DateTime.parse(reservationConfirmationScreenController.doctorScreenController.reserveArguments.value.toDate))}",
            style: const TextStyle(
              color: CustomColors.lightBlue,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
