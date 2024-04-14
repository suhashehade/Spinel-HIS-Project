import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/screens/pre_login_screen/pre_login_screen_controller.dart';

class PreLoginScreen extends GetView<PreLoginScreenController> {
  const PreLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PreLoginScreenController());
    return Scaffold(
      appBar: const CustomAppBar(
        backWidget: Text(""),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100.0,
          ),
          Text("preLoginSentence".tr),
          const SizedBox(
            height: 500.0,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: controller.yesOption,
                  minWidth: 180.0,
                  color: Colors.green,
                  child: Text("yes".tr),
                ),
                MaterialButton(
                  onPressed: controller.noOption,
                  minWidth: 180.0,
                  color: Colors.red,
                  child: Text("no".tr),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
