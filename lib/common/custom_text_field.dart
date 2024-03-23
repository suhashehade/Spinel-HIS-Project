import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      required this.textInputType,
      required this.labelText,
      required this.obscureText,
      required this.validator,
      required this.handleOnChanged});

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType textInputType;
  Function validator;
  Function handleOnChanged;

  // final int maxLine;
  // final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator(value),
      onChanged: (value) => handleOnChanged(value),
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(label: Text(labelText)),
    );
  }
}
