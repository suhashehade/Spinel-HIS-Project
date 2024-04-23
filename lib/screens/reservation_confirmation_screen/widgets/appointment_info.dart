import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:intl/intl.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReserveAppointmentScreenController reserveAppointmentScreenController =
        Get.put(ReserveAppointmentScreenController());
    DoctorScreenController doctorScreenController =
        Get.put(DoctorScreenController());
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
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
            ConstRes.appointmentDetails.tr,
            style: TextStyle(
              color: Color(CustomColors.lightBlue),
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "${ConstRes.clinic.tr}: ${reserveAppointmentScreenController.doctorsListArguments.value.depName}",
            style: TextStyle(
              color: Color(CustomColors.lightBlue),
              fontSize: 16.0,
            ),
          ),
          Text(
            "${ConstRes.date.tr}: ${DateFormat.yMMMd().format(DateTime.parse(doctorScreenController.reserveArguments.value.fromDate))}",
            style: TextStyle(
              color: Color(CustomColors.lightBlue),
              fontSize: 16.0,
            ),
          ),
          Text(
            "${ConstRes.fromTime.tr}: ${DateFormat(ConstRes.timePattern1).format(DateTime.parse(doctorScreenController.reserveArguments.value.fromDate))}",
            style: TextStyle(
              color: Color(CustomColors.lightBlue),
              fontSize: 16.0,
            ),
          ),
          Text(
            "${ConstRes.toTime.tr}: ${DateFormat(ConstRes.timePattern1).format(DateTime.parse(doctorScreenController.reserveArguments.value.toDate))}",
            style: TextStyle(
              color: Color(CustomColors.lightBlue),
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
