import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:his_project/screens/medical_file_screen/controller/medical_file_screen_controller.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    MedicalFileScreenController medicalFileScreenController =
        Get.put(MedicalFileScreenController());
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      height: MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: const GradientBoxBorder(
            gradient: LinearGradient(
          colors: [
            CustomColors.lightGreen,
            CustomColors.lightBlue,
          ],
        )),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      ConstRes.schedule.tr,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: CustomColors.lightBlue,
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      ConstRes.callToAction.tr,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: CustomColors.lightBlue,
                        height: 1.0,
                      ),
                    ),
                    MaterialButton(
                      color: CustomColors.lightBlue,
                      height: 20,
                      onPressed: () {
                        medicalFileScreenController.login();
                      },
                      child: Text(
                        ConstRes.login.tr,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: CustomColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.height * 0.15,
                child: ConstAssets.appointmentIcon,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
