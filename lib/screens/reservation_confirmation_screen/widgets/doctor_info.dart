import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

// ignore: must_be_immutable
class DoctorInfoConfirm extends StatelessWidget {
  DoctorInfoConfirm({super.key});
  ReserveAppointmentScreenController reserveAppointmentScreenController =
      Get.put(ReserveAppointmentScreenController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(360.0),
                border: GradientBoxBorder(
                    width: 3.0,
                    gradient: LinearGradient(
                      colors: [
                        Color(CustomColors.lightBlue),
                        Color(CustomColors.lightGreen),
                      ],
                    ))),
            child: Image.asset(ConstRes.doctorIcon),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reserveAppointmentScreenController
                    .doctorsListArguments.value.doctorName,
                style: TextStyle(
                  color: Color(
                    CustomColors.lightBlue,
                  ),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(reserveAppointmentScreenController
                  .doctorsListArguments.value.branchName, style: TextStyle(
              color: Color(CustomColors.black),
              fontSize: 16.0,
            ),),
            ],
          )
        ],
      ),
    );
  }
}
