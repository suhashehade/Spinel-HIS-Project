import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
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
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                          Color(CustomColors.lightBlue),
                          Color(CustomColors.lightGreen),
                        ]),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: Image.asset(ConstRes.nationalNumberIcon),
                        ),
                        const SizedBox(
                          height: 10.0,
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
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                          Color(CustomColors.lightBlue),
                          Color(CustomColors.lightGreen),
                        ]),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: Image.asset(ConstRes.mrnIcon),
                        ),
                        const SizedBox(
                          height: 10.0,
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
