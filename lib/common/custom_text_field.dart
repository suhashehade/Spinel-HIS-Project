import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:his_project/utils/colors_res.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      required this.textInputType,
      required this.labelText,
      required this.obscureText,
      required this.validator,
      required this.onTap});

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType textInputType;
  Function validator;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator(value),
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const GradientOutlineInputBorder(
            gradient: LinearGradient(colors: [
          CustomColors.lightBlue,
          CustomColors.lightGreen,
        ])),
        label: Text(labelText),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
