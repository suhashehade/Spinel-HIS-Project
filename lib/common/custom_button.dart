import 'package:flutter/material.dart';
import 'package:his_project/utils/colors_res.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.title,
    required this.handle,
    required this.formKey,
  });
  String title;
  Function handle;
  GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Color(CustomColors.lightBlue),
      minWidth: MediaQuery.of(context).size.width * 0.40,
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          await handle();
        }
      },
      child: Text(
        title,
        style: TextStyle(color: Color(CustomColors.white)),
      ),
    );
  }
}
