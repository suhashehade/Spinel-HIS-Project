import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.title,
      required this.handle,
      required this.formKey});
  String title;
  Function handle;
  GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          await handle();
        }
      },
      child: Text(title),
    );
  }
}
