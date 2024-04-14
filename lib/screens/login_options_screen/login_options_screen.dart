import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/screens/login_options_screen/login_options_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';

class LoginOptionsScreen extends GetView<LoginOptionsScreenController> {
  const LoginOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginOptionsScreenController());
    return Scaffold(
      appBar: const CustomAppBar(
        backWidget: Text(""),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100.0,
              ),
              Text("optionSentence".tr),
              const SizedBox(
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: controller.goToNILogin,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      height: 180.0,
                      width: 180.0,
                      decoration: BoxDecoration(
                        color: Color(CustomColors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Color(CustomColors.lightBlue),
                            size: 40.0,
                          ),
                          Text(
                            "nationalId".tr,
                            style: TextStyle(
                              color: Color(CustomColors.lightBlue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: controller.goToMRNLogin,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      height: 180.0,
                      width: 180.0,
                      decoration: BoxDecoration(
                        color: Color(CustomColors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.medical_information,
                            color: Color(CustomColors.lightBlue),
                            size: 40.0,
                          ),
                          Text(
                            "mrn".tr,
                            style: TextStyle(
                              color: Color(CustomColors.lightBlue),
                            ),
                          ),
                        ],
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
