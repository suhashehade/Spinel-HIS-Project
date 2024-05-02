import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_button.dart';
import 'package:his_project/common/custom_text_field.dart';
import 'package:his_project/screens/login_screen/controller/login_screen_controller.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    LoginScreenController loginScreenController = Get.find();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: CustomColors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    CustomColors.lightGreen,
                    CustomColors.lightBlue,
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
                  const Icon(
                    Icons.home,
                    size: 30.0,
                    color: CustomColors.white,
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
                      child: ConstAssets.logoIcon,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ConstRes.welcome.tr,
                          style: const TextStyle(
                            color: CustomColors.lightBlue,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          ConstRes.appName,
                          style: const TextStyle(
                            color: CustomColors.lightBlue,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ConstRes.patientApp.tr,
                          style: const TextStyle(
                            color: CustomColors.lightBlue,
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
                    loginScreenController
                                .loginOptionsScreenController.option.value ==
                            1
                        ? ConstRes.loginIdSentence.tr
                        : ConstRes.loginMRNSentence.tr,
                    style: const TextStyle(
                      color: CustomColors.lightBlue,
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
                        style: const TextStyle(color: CustomColors.red),
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
