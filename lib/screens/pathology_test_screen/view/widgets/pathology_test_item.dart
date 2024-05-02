import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

// ignore: must_be_immutable
class PathologyTestItem extends StatelessWidget {
  PathologyTestItem(
      {super.key,
      required this.doctorName,
      required this.testName,
      required this.departmentName,
      required this.date,
      required this.status});
  String doctorName;
  String testName;
  String departmentName;
  String date;
  bool status;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      decoration: const BoxDecoration(
          border: GradientBoxBorder(
            gradient: LinearGradient(colors: [
              CustomColors.lightGreen,
              CustomColors.lightBlue,
            ]),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${ConstRes.test.tr}: $testName",
                style: const TextStyle(color: CustomColors.lightBlue),
              ),
              Text(
                "${ConstRes.status.tr}: ${status ? ConstRes.approved : ConstRes.notApproved}",
                style: const TextStyle(color: CustomColors.lightBlue),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${ConstRes.doctor.tr}: $doctorName",
                style: const TextStyle(color: CustomColors.lightBlue),
              ),
              Text(
                "${ConstRes.date.tr}: $date",
                style: const TextStyle(color: CustomColors.lightBlue),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${ConstRes.clinic.tr}: $departmentName",
                style: const TextStyle(color: CustomColors.lightBlue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
