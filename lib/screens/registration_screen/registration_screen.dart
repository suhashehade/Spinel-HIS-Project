import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/registration_screen/registration_screen_controller.dart';

class RegistrationScreen extends GetView<RegistrationScreenController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegistrationScreenController());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text("If you already have an account just "),
            InkWell(
              onTap: () {
                controller.loginRedirect();
              },
              child: const Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
