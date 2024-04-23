import 'dart:convert';

import 'package:his_project/models/user/user.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;

class PatientAPI {
  static Map<String, String> headers = {
    "Content-Type": "application/json; charset=utf-8",
  };
  static Future<User> getPatient(String phone) async {
    if (PrefsService.to.getString(ConstRes.tokenKey) != null) {
      String? token = PrefsService.to.getString(ConstRes.tokenKey);
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
        Uri.parse("${Urls.patientDetails}&strSearch=$phone"),
        headers: headers);

    return User.fromJson(json.decode(response.body)['lstData'][0]);
  }
}
