import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/ask_login_screen/controller/ask_login_screen_controller.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class AskLoginScreen extends StatelessWidget {
  const AskLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AskLoginScreenController askLoginScreenController =
        Get.put(AskLoginScreenController());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: CustomColors.lightGreen,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20, 10.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: ConstAssets.logoIcon,
                ),
                Text(
                  ConstRes.welcome.tr,
                  style: const TextStyle(
                    color: CustomColors.lightBlue,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ConstRes.callToAction.tr,
                  style: const TextStyle(
                    color: CustomColors.lightBlue,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
            ),
            MaterialButton(
              onPressed: askLoginScreenController.toPreLogin,
              height: MediaQuery.of(context).size.height * 0.06,
              minWidth: MediaQuery.of(context).size.width * 0.70,
              color: CustomColors.red,
              child: Text(
                ConstRes.login.tr,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
