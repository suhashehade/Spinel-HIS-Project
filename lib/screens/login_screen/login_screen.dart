import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_button.dart';
import 'package:his_project/common/custom_text_field.dart';
import 'package:his_project/screens/login_screen/login_screen_controller.dart';

// ignore: must_be_immutable
class LoginScreen extends GetView<LoginScreenController> {
  LoginScreen({super.key});
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(LoginScreenController());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _keyForm,
          child: Column(
            children: <Widget>[
              CustomTextField(
                validator: controller.validate,
                controller: controller.userNameController,
                textInputType: TextInputType.name,
                labelText: 'User Name',
                obscureText: false,
                handleOnChanged: controller.handleOnChanged,
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                validator: controller.validate,
                controller: controller.passwordController,
                textInputType: TextInputType.visiblePassword,
                labelText: 'Password',
                obscureText: true,
                handleOnChanged: controller.handleOnChanged,
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
                              userNameController.text,
                              passwordController.text,
                              value),
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
    );
  }
}
