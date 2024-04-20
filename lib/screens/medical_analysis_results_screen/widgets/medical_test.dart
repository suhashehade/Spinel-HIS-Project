import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/models/medical_result/cbc_result.dart';
import 'package:his_project/utils/colors_res.dart';

// ignore: must_be_immutable
class MedicalTest extends StatelessWidget {
  MedicalTest({super.key, required this.cbcResult});
  CBCResult cbcResult;
  @override
  Widget build(BuildContext context) {
    return TableRow(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [
            Color(CustomColors.lightBlue),
            Color(CustomColors.lightGreen),
          ]),
        ),
      ),
      children: [
        Text(
          cbcResult.description,
          textAlign: TextAlign.start,
        ),
        Text(
          cbcResult.result,
          textAlign: TextAlign.start,
        ),
        Text(
          cbcResult.unit,
          textAlign: TextAlign.start,
        ),
        Text(
          cbcResult.range,
          textAlign: TextAlign.start,
        )
      ],
    ) as MedicalTest;
  }
}
