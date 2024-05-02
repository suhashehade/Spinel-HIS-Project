import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/screens/reservation_confirmation_screen/controller/reservation_confirmation_screen_controller.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';

class DoctorInfoConfirm extends StatelessWidget {
  const DoctorInfoConfirm({super.key});

  @override
  Widget build(BuildContext context) {
  
    ReservationConfirmationScreenController
        reservationConfirmationScreenController = Get.find();
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
                border: const GradientBoxBorder(
                    width: 3.0,
                    gradient: LinearGradient(
                      colors: [
                        CustomColors.lightBlue,
                        CustomColors.lightGreen,
                      ],
                    ))),
            child: ConstAssets.doctorIcon,
          ),
          const SizedBox(
            width: 15.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reservationConfirmationScreenController.reserveAppointmentScreenController
                    .doctorsListArguments.value.doctorName,
                style: const TextStyle(
                  color: CustomColors.lightBlue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                reservationConfirmationScreenController.reserveAppointmentScreenController
                    .doctorsListArguments.value.branchName,
                style: const TextStyle(
                  color: CustomColors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
