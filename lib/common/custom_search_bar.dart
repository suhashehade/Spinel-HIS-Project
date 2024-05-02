import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

// ignore: must_be_immutable
class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key});
  TextEditingController seacrhController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.90,
      child: TextFormField(
        controller: seacrhController,
        decoration: InputDecoration(
          border: const GradientOutlineInputBorder(
              gradient: LinearGradient(colors: [
            CustomColors.lightBlue,
            CustomColors.lightGreen,
          ])),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.search,
                size: 14.0,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                ConstRes.search.tr,
                style: const TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
