import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/colors_res.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      height: 180.0,
      width: 520.0,
      decoration: BoxDecoration(
        border: GradientBoxBorder(
            gradient: LinearGradient(
          colors: [
            Color(CustomColors.lightGreen),
            Color(CustomColors.lightBlue),
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
                width: 160.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'schedule'.tr,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(CustomColors.lightBlue),
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "callToAction".tr,
                      textAlign: TextAlign.start, // textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(CustomColors.lightBlue),
                        height: 1.0,
                      ),
                    ),
                    MaterialButton(
                      color: Color(CustomColors.lightBlue),
                      height: 20,
                      onPressed: () {
                        PrefsService.to.setInt("afterLogin", 8);
                        Get.toNamed('/preLogin');
                      },
                      child: Text(
                        "login".tr,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(CustomColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                width: 180,
                height: 100,
                child: Image.asset("assets/images/appointments_icon.png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
