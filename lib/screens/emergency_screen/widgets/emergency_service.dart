import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/utils/colors_res.dart';

// ignore: must_be_immutable
class EmergencyService extends StatelessWidget {
  EmergencyService(
      {super.key, required this.serviceName, required this.serviceIcon});
  String serviceName;
  String serviceIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: GradientBoxBorder(
            gradient: LinearGradient(colors: [
          Color(CustomColors.lightBlue),
          Color(CustomColors.lightGreen),
        ])),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(0.0),
            height: 40.0,
            width: 40.0,
            child: Image.asset(serviceIcon),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            serviceName.tr,
            style:
                TextStyle(fontSize: 11.0, color: Color(CustomColors.lightBlue)),
            maxLines: 3,
          ),
        ],
      )),
    );
  }
}
