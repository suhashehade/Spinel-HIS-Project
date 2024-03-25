import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/user/login.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/pages_names.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;

class LoginScreenController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLogin = false.obs;
  RxMap<String, dynamic> listError = <String, dynamic>{}.obs;
  RxString error = ''.obs;
  RxBool isChecked = false.obs;

  toggleChecked(value) {
    isChecked.value = value;
  }

  rememberMe(String userName, String password, bool? value) async {
    if (value == true) {
      await PrefsService.to.setString("userName", userName);
      await PrefsService.to.setString("password", password);
    } else {
      if (PrefsService.to.getString("userName") != null ||
          PrefsService.to.getString("password") != null) {
        PrefsService.to.remove("userName");
        PrefsService.to.remove("password");
      }
    }
    toggleChecked(value);
  }

  logout() {
    if (PrefsService.to.getString('userName') != null ||
        PrefsService.to.getString('password') != null) {
      PrefsService.to.remove('userName');
      PrefsService.to.remove('password');
    }
    PrefsService.to.remove('token');
    isLogin.value = false;
    Get.offNamed(PagesNames.ROOT);
  }

  login(UserCredintals userCredintals) async {
    http.Response response = await http.post(
      Uri.parse("${Urls.account}/OtherLogin"),
      headers: {
        "accept": "*/*",
        "Content-Type": "application/json-patch+json",
        "charset": "utf-8"
      },
      body: jsonEncode({
        'userName': userCredintals.userName,
        'password': userCredintals.password
      }),
    );
    if (jsonDecode(response.body)['token'] == null) {
      error.value = jsonDecode(response.body)['lstError'][0];
      return;
    }
    LoginResponse loginResponse = LoginResponse(
        token: jsonDecode(response.body)['token'],
        lstError: jsonDecode(response.body)['errors']);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      isLogin.value = true;
      PrefsService.to.setString("token", loginResponse.token!);
      error.value = '';
      Get.offNamed(PagesNames.MAIN);
    } else {
      if (loginResponse.lstError!['UserName'] != null) {
        listError['UserName'] = loginResponse.lstError!['UserName'];
      }

      if (loginResponse.lstError!['Password'] != null) {
        listError['Password'] = loginResponse.lstError!['Password'];
      }
    }
  }

  handleLogin() async {
    UserCredintals userCredintals = UserCredintals(
      userName: userNameController.text,
      password: passwordController.text,
    );

    await login(userCredintals);
  }

  validate(String value) {
    if (value.isEmpty) {
      return 'Please fill the input';
    } else {
      if (value == userNameController.text && value.length < 3) {
        return 'the length of the username must me 3 at least';
      }
      if (value == passwordController.text && value.length < 3) {
        return 'the length of the password must me 3 at least';
      }
    }
    listError.clear();
    return null;
  }

  registrationRedirect() {
    Get.offNamed(PagesNames.REGISTRATION);
  }

  handleOnChanged(String value) {}
}
