import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:get/get.dart';

class MedicalFileDepartment extends StatelessWidget {
  const MedicalFileDepartment(
      {super.key,
      required this.depName,
      required this.depIcon,
      required this.handleClick});
  final String depName;
  final String depIcon;
  final Function handleClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        handleClick();
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
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
              height: 50.0,
              width: 50.0,
              child: Image.asset(depIcon),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              depName.tr,
              style: const TextStyle(fontSize: 10.0),
            ),
          ],
        )),
      ),
    );
  }
}
