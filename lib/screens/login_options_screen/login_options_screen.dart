import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/screens/login_options_screen/login_options_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class LoginOptionsScreen extends StatelessWidget {
  const LoginOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginOptionsScreenController loginOptionsScreenController =
        Get.put(LoginOptionsScreenController());
    return Scaffold(
      appBar: const CustomAppBar(
        backWidget: Text(""),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 100.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 100.0,
                      width: 100.0,
                      child: Image.asset(ConstRes.logoIcon),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ConstRes.welcome.tr,
                          style: TextStyle(
                            color: Color(
                              CustomColors.lightBlue,
                            ),
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          ConstRes.appName,
                          style: TextStyle(
                            color: Color(
                              CustomColors.lightBlue,
                            ),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ConstRes.patientApp.tr,
                          style: TextStyle(
                            color: Color(
                              CustomColors.lightBlue,
                            ),
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  ConstRes.optionSentence.tr,
                  style: TextStyle(
                    color: Color(
                      CustomColors.lightBlue,
                    ),
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: loginOptionsScreenController.goToNILogin,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
                    height: 150.0,
                    width: 150.0,
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
                          ConstRes.nationalId.tr,
                          style: TextStyle(
                            color: Color(CustomColors.lightBlue),
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: loginOptionsScreenController.goToMRNLogin,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                    height: 150.0,
                    width: 150.0,
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
                          ConstRes.mrn.tr,
                          style: TextStyle(
                            color: Color(CustomColors.lightBlue),
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              onPressed: () {
                loginOptionsScreenController.goToRegistration();
              },
              minWidth: 330.0,
              color: Color(CustomColors.lightBlue),
              child: Text(
                ConstRes.register.tr,
                style: TextStyle(color: Color(CustomColors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
