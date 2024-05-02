import 'package:flutter/material.dart';
import 'package:his_project/utils/colors_res.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: CustomColors.lightGreen,
    ));
  }
}
