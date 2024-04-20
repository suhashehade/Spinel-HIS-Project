import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_button.dart';
import 'package:his_project/common/custom_text_field.dart';
import 'package:his_project/screens/login_options_screen/login_options_screen_controller.dart';
import 'package:his_project/screens/login_screen/login_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    LoginScreenController loginScreenController =
        Get.put(LoginScreenController());
    LoginOptionsScreenController loginOptionsScreenController =
        Get.put(LoginOptionsScreenController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(CustomColors.lightGreen),
                    Color(CustomColors.lightBlue),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ConstRes.login.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  Icon(
                    Icons.home,
                    size: 30.0,
                    color: Color(CustomColors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    loginOptionsScreenController.option.value == 1
                        ? ConstRes.loginIdSentence.tr
                        : ConstRes.loginMRNSentence.tr,
                    style: TextStyle(
                      color: Color(
                        CustomColors.lightBlue,
                      ),
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _keyForm,
                child: Column(
                  children: <Widget>[
                    loginScreenController
                                .loginOptionsScreenController.option.value ==
                            1
                        ? CustomTextField(
                            validator: loginScreenController.validate,
                            controller:
                                loginScreenController.nationalIdController,
                            textInputType: TextInputType.name,
                            labelText: ConstRes.nationalId.tr,
                            obscureText: false,
                            onTap: () {},
                          )
                        : CustomTextField(
                            validator: loginScreenController.validate,
                            controller: loginScreenController.mrnController,
                            textInputType: TextInputType.name,
                            labelText: ConstRes.mrn.tr,
                            obscureText: false,
                            onTap: () {},
                          ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      validator: loginScreenController.validate,
                      controller: loginScreenController.phoneController,
                      textInputType: TextInputType.name,
                      labelText: ConstRes.phone.tr,
                      obscureText: false,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      validator: loginScreenController.validate,
                      controller: loginScreenController.passwordController,
                      textInputType: TextInputType.visiblePassword,
                      labelText: ConstRes.password.tr,
                      obscureText: true,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                value: loginScreenController.isChecked.value,
                                onChanged: (value) =>
                                    loginScreenController.rememberMe(
                                        loginScreenController
                                            .phoneController.text,
                                        value),
                              ),
                            ),
                            Text(ConstRes.rememberMe.tr),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(ConstRes.forgetPass.tr),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          title: ConstRes.login.tr,
                          handle: loginScreenController.handleLogin,
                          formKey: _keyForm,
                        ),
                        CustomButton(
                          title: ConstRes.cancel.tr,
                          handle: loginScreenController.handleLogin,
                          formKey: _keyForm,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Obx(
                      () => Text(
                        loginScreenController.error.value,
                        style: TextStyle(color: Color(CustomColors.red)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
