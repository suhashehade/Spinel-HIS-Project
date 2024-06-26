import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';

// ignore: must_be_immutable
class MedicalTestItem extends StatelessWidget {
  MedicalTestItem({super.key, required this.title, required this.onTap});
  String title;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(title);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: const GradientBoxBorder(
            gradient: LinearGradient(colors: [
              CustomColors.lightBlue,
              CustomColors.lightGreen,
            ]),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: ConstAssets.labIcon,
            ),
            Text(
              title.tr,
              style: const TextStyle(
                color: CustomColors.lightBlue,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
