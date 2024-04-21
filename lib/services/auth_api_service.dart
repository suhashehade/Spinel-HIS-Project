import 'dart:convert';

import 'package:get/get.dart';
import 'package:his_project/models/user/login.dart';
import 'package:his_project/screens/login_options_screen/login_options_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;

import '../utils/consts_res.dart';

class AuthAPI {
   static Map<String, String> headers = {
    "Content-Type": "application/json; charset=utf-8",
   };

  static LoginOptionsScreenController loginOptionsScreenController =
      Get.put(LoginOptionsScreenController());

      static Map<String, String> getHeaders(Map<String, String> content) {
    if (PrefsService.to.getString(ConstRes.tokenKey) != null) {
      String? token = PrefsService.to.getString(ConstRes.tokenKey);
      headers['Authorization'] = 'Bearer $token';
    }
    if (content.isNotEmpty) {
      headers.addAll(content);
    }
    return headers;
  }


    static Future login(UserCredintals userCredintals) async {
    http.Response response = await http.post(
      Uri.parse(Urls.login),
      
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
    return LoginResponse.fromJson(json.decode(response.body));
  }

}