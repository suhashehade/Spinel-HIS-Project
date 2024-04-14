import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_button.dart';
import 'package:his_project/common/custom_text_field.dart';
import 'package:his_project/screens/login_screen/login_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';

// ignore: must_be_immutable
class LoginScreen extends GetView<LoginScreenController> {
  LoginScreen({super.key});

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(LoginScreenController());

    return Scaffold(
      appBar: AppBar(),
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
                    Colors.lightGreen,
                    Colors.lightBlue,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "login".tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  const Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        height: 40.0,
                        width: 40.0,
                        child:
                            Image.asset("assets/images/login_process_icon.png"),
                      ),
                      Text("enterDetails".tr)
                    ],
                  ),
                  Container(
                    width: 70.0,
                    height: 1.0,
                    color: Color(CustomColors.lightBlue),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        height: 40.0,
                        width: 40.0,
                        child:
                            Image.asset("assets/images/login_process_icon.png"),
                      ),
                      Text("referenecInfo".tr)
                    ],
                  ),
                  Container(
                    width: 70.0,
                    height: 1.0,
                    color: Color(CustomColors.lightBlue),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          height: 40.0,
                          width: 40.0,
                          child: Image.asset(
                              "assets/images/login_process_icon.png"),
                        ),
                        Text("otherDetails".tr),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(50.0),
              child: Form(
                key: _keyForm,
                child: Column(
                  children: <Widget>[
                    controller.loginOptionsScreenController.option.value == 1
                        ? CustomTextField(
                            validator: controller.validate,
                            controller: controller.nationalIdController,
                            textInputType: TextInputType.name,
                            labelText: 'nationalId'.tr,
                            obscureText: false,
                          )
                        : CustomTextField(
                            validator: controller.validate,
                            controller: controller.mrnController,
                            textInputType: TextInputType.name,
                            labelText: 'mrn'.tr,
                            obscureText: false,
                          ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      validator: controller.validate,
                      controller: controller.phoneController,
                      textInputType: TextInputType.name,
                      labelText: 'phone'.tr,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      validator: controller.validate,
                      controller: controller.passwordController,
                      textInputType: TextInputType.visiblePassword,
                      labelText: 'password'.tr,
                      obscureText: true,
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
                                value: controller.isChecked.value,
                                onChanged: (value) => controller.rememberMe(
                                    controller.phoneController.text, value),
                              ),
                            ),
                            Text("rememberMe".tr),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text("forgetPass".tr),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          title: "login".tr,
                          handle: controller.handleLogin,
                          formKey: _keyForm,
                        ),
                        CustomButton(
                          title: "cancel".tr,
                          handle: controller.handleLogin,
                          formKey: _keyForm,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Obx(
                      () => Text(
                        controller.error.value,
                        style: const TextStyle(color: Colors.red),
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
