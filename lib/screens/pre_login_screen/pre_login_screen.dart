import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/pre_login_screen/pre_login_screen_controller.dart';

class PreLoginScreen extends GetView<PreLoginScreenController> {
  const PreLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PreLoginScreenController());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("Had you vistsied the medical center before?"),
            Row(
              children: [
                MaterialButton(
                  onPressed: controller.yesOption,
                  color: Colors.green,
                  child: const Text("Yes"),
                ),
                MaterialButton(
                  onPressed: controller.noOption,
                  color: Colors.red,
                  child: const Text("No"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
