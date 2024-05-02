import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_button.dart';
import 'package:his_project/common/custom_text_field.dart';
import 'package:his_project/screens/registration_screen/controller/registration_screen_controller.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    RegistrationScreenController registrationScreenController =
        Get.put(RegistrationScreenController());

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
                    ConstRes.register.tr,
                    style: const TextStyle(
                      color: CustomColors.white,
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: ConstAssets.loginProcess,
                          ),
                          Text(
                            ConstRes.enterDetails.tr,
                            style: const TextStyle(
                                fontSize: 12.0, color: CustomColors.lightBlue),
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 1.0,
                        color: CustomColors.lightBlue,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: ConstAssets.loginProcess,
                          ),
                          Text(
                            ConstRes.referenceInfo.tr,
                            style: const TextStyle(
                                fontSize: 12.0, color: CustomColors.lightBlue),
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 1.0,
                        color: CustomColors.lightBlue,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: ConstAssets.loginProcess,
                          ),
                          Text(
                            ConstRes.otherDetails.tr,
                            style: const TextStyle(
                                fontSize: 12.0, color: CustomColors.lightBlue),
                          ),
                        ],
                      ),
                    ],
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
                    CustomTextField(
                      validator: registrationScreenController.validate,
                      controller:
                          registrationScreenController.countryNameController,
                      textInputType: TextInputType.name,
                      labelText: ConstRes.countryName.tr,
                      obscureText: false,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      validator: registrationScreenController.validate,
                      controller:
                          registrationScreenController.nationalIdController,
                      textInputType: TextInputType.name,
                      labelText: ConstRes.nationalId.tr,
                      obscureText: false,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      validator: registrationScreenController.validate,
                      controller: registrationScreenController.phoneController,
                      textInputType: TextInputType.name,
                      labelText: ConstRes.phone.tr,
                      obscureText: false,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      validator: registrationScreenController.validate,
                      controller: registrationScreenController.dobController,
                      textInputType: TextInputType.visiblePassword,
                      labelText: ConstRes.dob.tr,
                      obscureText: true,
                      onTap: () {
                        registrationScreenController.pickDate(context);
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          title: ConstRes.register.tr,
                          handle: registrationScreenController.handleRegister,
                          formKey: _keyForm,
                        ),
                        CustomButton(
                          title: ConstRes.cancel.tr,
                          handle: registrationScreenController.handleRegister,
                          formKey: _keyForm,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
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
