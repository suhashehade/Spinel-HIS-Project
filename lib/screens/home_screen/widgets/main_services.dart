import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/utils/colors_res.dart';

class MainServices extends StatelessWidget {
  const MainServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
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
            width: 120,
            height: 100,
            child: Image.asset("assets/images/main_service_icon.png"),
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "emergencyServices".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "mainServicesCallToAction".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
         
        ],
      ),
    );
  }
}
