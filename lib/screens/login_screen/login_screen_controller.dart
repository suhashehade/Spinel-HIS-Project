import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/user/login.dart';
import 'package:his_project/screens/login_options_screen/login_options_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/messages.dart';
import 'package:his_project/utils/pages_names.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;

class LoginScreenController extends GetxController {
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController mrnController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLogin = false.obs;
  RxMap<String, dynamic> listError = <String, dynamic>{}.obs;
  RxString error = ''.obs;
  RxBool isChecked = false.obs;
  LoginOptionsScreenController loginOptionsScreenController =
      Get.put(LoginOptionsScreenController());
  int? option;

  toggleChecked(value) {
    isChecked.value = value;
  }

  rememberMe(String phone, bool? value) async {
    if (value == true) {
      await PrefsService.to.setString("phone", phone);
    } else {
      if (PrefsService.to.getString("phone") != null) {
        PrefsService.to.remove("phone");
      }
    }
    toggleChecked(value);
  }

  logout() {
    if (PrefsService.to.getString('phone') != null) {
      PrefsService.to.remove('phone');
    }
    PrefsService.to.remove('token');
    isLogin.value = false;
    Get.offNamed(PagesNames.root);
  }

  login(UserCredintals userCredintals) async {
    http.Response response = await http.post(
      Uri.parse("${Urls.account}OtherLogin"),
      headers: {
        "accept": "*/*",
        "Content-Type": "application/json-patch+json",
        "charset": "utf-8"
      },
      body: jsonEncode(
        {
          "loginMethod": loginOptionsScreenController.option.value,
          "password": userCredintals.password,
          "phone": userCredintals.phone,
          "mrn": userCredintals.mrn ?? "",
          "nationalId": userCredintals.nationalId ?? ""
        },
      ),
    );
    if (jsonDecode(response.body)['token'] == null) {
      error.value = jsonDecode(response.body)['lstError'][0];

      return;
    }
    LoginResponse loginResponse = LoginResponse(
        token: jsonDecode(response.body)['token'],
        lstError: jsonDecode(response.body)['errors']);

    if (response.statusCode == 200) {
      isLogin.value = true;
      PrefsService.to.setString("token", loginResponse.token!);
      PrefsService.to.setString("phone", userCredintals.phone!);

      error.value = '';
      nationalIdController.text = '';
      mrnController.text = '';
      phoneController.text = '';
      passwordController.text = '';
      isChecked.value = false;
      Get.offNamed(PagesNames.reserveAssurence);
    } else {
      if (loginResponse.lstError!['nationalId'] != null) {
        listError['nationalId'] = loginResponse.lstError!['nationalId'];
      }

      if (loginResponse.lstError!['Password'] != null) {
        listError['Password'] = loginResponse.lstError!['Password'];
      }
    }
  }

  handleLogin() async {
    UserCredintals userCredintals;
    if (loginOptionsScreenController.option.value == 1) {
      userCredintals = UserCredintals(
          loginMethod: loginOptionsScreenController.option.value,
          nationalId: nationalIdController.text,
          password: passwordController.text,
          phone: phoneController.text);
    } else {
      userCredintals = UserCredintals(
          loginMethod: loginOptionsScreenController.option.value,
          password: passwordController.text,
          mrn: mrnController.text,
          phone: phoneController.text);
    }

    await login(userCredintals);
  }

  validate(String value) {
    if (value.isEmpty) {
      return Messages.emptyFieldsError;
    } else {
      if (value == nationalIdController.text && value.length < 3) {
        return Messages.userNameLengthError;
      }
      if (value == passwordController.text && value.length < 3) {
        return Messages.passwordLengthError;
      }
    }
    listError.clear();
    return null;
  }

  registrationRedirect() {
    Get.offNamed(PagesNames.registration);
  }

  @override
  void onInit() {
    // option = Get.arguments['option'];
    super.onInit();
  }
}
