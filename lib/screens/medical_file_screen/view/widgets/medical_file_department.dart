import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:get/get.dart';

class MedicalFileDepartment extends StatelessWidget {
  const MedicalFileDepartment({
    super.key,
    required this.depName,
    required this.depIcon,
  });
  final String depName;
  final Image depIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.12,
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
          Container(
            padding: const EdgeInsets.all(0.0),
            height: 50.0,
            width: 50.0,
            child: depIcon,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            depName.tr,
            style: const TextStyle(fontSize: 10.0, color: CustomColors.lightBlue),
          ),
        ],
      )),
    );
  }
}
