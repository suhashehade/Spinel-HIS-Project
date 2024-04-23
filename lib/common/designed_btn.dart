import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/utils/colors_res.dart';

// ignore: must_be_immutable
class DesignedButton extends StatelessWidget {
  DesignedButton({
    super.key,
    required this.title,
    required this.handle,
    required this.backGround,
  });
  String title;
  Function handle;
  Color backGround;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: backGround,
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [
            Color(CustomColors.lightGreen),
            Color(CustomColors.lightBlue),
          ]),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: MaterialButton(
        onPressed: () {
          handle();
        },
        child: Text(title.tr),
      ),
    );
  }
}
