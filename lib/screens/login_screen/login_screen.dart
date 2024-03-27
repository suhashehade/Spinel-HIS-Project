import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_button.dart';
import 'package:his_project/common/custom_text_field.dart';
import 'package:his_project/screens/login_screen/login_screen_controller.dart';

// ignore: must_be_immutable
class LoginScreen extends GetView<LoginScreenController> {
  LoginScreen({super.key});

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(LoginScreenController());
    // controller.option = Get.arguments['option'];
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
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
                        labelText: 'National ID',
                        obscureText: false,
                      )
                    : CustomTextField(
                        validator: controller.validate,
                        controller: controller.mrnController,
                        textInputType: TextInputType.name,
                        labelText: 'MRN',
                        obscureText: false,
                      ),
                CustomTextField(
                  validator: controller.validate,
                  controller: controller.phoneController,
                  textInputType: TextInputType.name,
                  labelText: 'Phone Number',
                  obscureText: false,
                ),
                CustomTextField(
                  validator: controller.validate,
                  controller: controller.passwordController,
                  textInputType: TextInputType.visiblePassword,
                  labelText: 'Password',
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
                        const Text("Remember me"),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text("Forget Password?"),
                    ),
                  ],
                ),
                CustomButton(
                  title: 'Login',
                  handle: controller.handleLogin,
                  formKey: _keyForm,
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text("If you don't have an account "),
                    InkWell(
                      onTap: () {
                        controller.registrationRedirect();
                      },
                      child: const Text(
                        "Create account",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
