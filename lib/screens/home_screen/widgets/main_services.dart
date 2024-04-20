import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class MainServices extends StatelessWidget {
  const MainServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(CustomColors.lightGreen),
            Color(CustomColors.lightBlue),
          ],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(0.0),
            width: 100,
            height: 80,
            child: Image.asset(ConstRes.mainServiceIcon),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ConstRes.emergencyServices.tr,
                style: TextStyle(
                  color: Color(CustomColors.white),
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ConstRes.mainServicesCallToAction.tr,
                style: TextStyle(
                  color: Color(CustomColors.white),
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
