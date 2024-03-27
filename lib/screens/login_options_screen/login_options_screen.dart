import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/login_options_screen/login_options_screen_controller.dart';

class LoginOptionsScreen extends GetView<LoginOptionsScreenController> {
  const LoginOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginOptionsScreenController());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text("Choose one of these ways to login"),
              Row(
                children: [
                  InkWell(
                    onTap: controller.goToNILogin,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const Card(
                        child: Center(
                          child: Text("National ID"),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: controller.goToMRNLogin,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const Card(
                        child: Center(
                          child: Text("MRN"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
