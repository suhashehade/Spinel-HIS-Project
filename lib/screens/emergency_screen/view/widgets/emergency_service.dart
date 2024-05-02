import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/utils/colors_res.dart';

// ignore: must_be_immutable
class EmergencyService extends StatelessWidget {
  EmergencyService(
      {super.key, required this.serviceName, required this.serviceIcon});
  String serviceName;
  Image serviceIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      padding: const EdgeInsets.all(2.0),
      width: MediaQuery.of(context).size.width * 0.30,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: const GradientBoxBorder(
            gradient: LinearGradient(colors: [
          CustomColors.lightBlue,
          CustomColors.lightGreen,
        ])),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.14,
            width: MediaQuery.of(context).size.width * 0.20,
            child: serviceIcon,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            serviceName.tr,
            style:
                const TextStyle(fontSize: 11.0, color: CustomColors.lightBlue),
            maxLines: 3,
          ),
        ],
      )),
    );
  }
}
