import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/screens/pre_login_screen/pre_login_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class PreLoginScreen extends StatelessWidget {
  const PreLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PreLoginScreenController preLoginScreenController =
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.0,
                width: 100.0,
                child: Image.asset(ConstRes.logoIcon),
              ),
              Text(
                ConstRes.welcome.tr,
                style: TextStyle(
                  color: Color(
                    CustomColors.lightBlue,
                  ),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ConstRes.preLoginSentence.tr,
                style: TextStyle(
                  color: Color(
                    CustomColors.lightBlue,
                  ),
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: preLoginScreenController.yesOption,
                  height: MediaQuery.of(context).size.height * 0.06,
                  minWidth: MediaQuery.of(context).size.width * 0.45,
                  color: Color(CustomColors.green),
                  child: Text(
                    ConstRes.yes.tr,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: preLoginScreenController.noOption,
                  height: MediaQuery.of(context).size.height * 0.06,
                  minWidth: MediaQuery.of(context).size.width * 0.45,
                  color: Color(CustomColors.red),
                  child: Text(
                    ConstRes.no.tr,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
