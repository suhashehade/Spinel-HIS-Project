import 'dart:convert';

import 'package:get/get.dart';
import 'package:his_project/models/appointment/appointment_details.dart';
import 'package:his_project/models/appointment/available_appointments_days.dart';
import 'package:his_project/models/appointment/reserve_arguments.dart';
import 'package:his_project/screens/login_screen/controller/login_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;

class AppointmentAPI {
  static Map<String, String> headers = {
    "Content-Type": "application/json; charset=utf-8",
  };

  static Future addAppointmentAPI(ReserveArguments reserveArgs) async {
    LoginScreenController loginScreenController =
        Get.put(LoginScreenController());
    headers["accept"] = "*/*";
    if (PrefsService.to.getString(ConstRes.tokenKey) != null) {
      String? token = PrefsService.to.getString(ConstRes.tokenKey);
      headers['Authorization'] = 'Bearer $token';
    }

    Map<String, dynamic> body = {
      "branchId": reserveArgs.branchId,
      "clinicId": null,
      "doctorId": reserveArgs.doctorId,
      "fromDate": reserveArgs.fromDate,
      "toDate": reserveArgs.toDate,
      "reasonId": 54,
      "statusId": 48,
      "departmentId": reserveArgs.depId,
      "note": "string"
    };

    http.Response response = await http.post(
      Uri.parse(Urls.addAppointment),
      body: jsonEncode(body),
      headers: headers,
    );
    if (response.statusCode == 401) {
      loginScreenController.logout();
      Get.toNamed(PagesNames.preLogin);
      Get.snackbar("Error", "you have to login again");
    }
    return response;
  }

  static Future getPatientAppointments() async {
    LoginScreenController loginScreenController =
        Get.put(LoginScreenController());
    if (PrefsService.to.getString(ConstRes.tokenKey) != null) {
      String? token = PrefsService.to.getString(ConstRes.tokenKey);
      headers['Authorization'] = 'Bearer $token';
    }
    if (PrefsService.to.getInt("id") != null) {
      http.Response response = await http.get(
          Uri.parse(
              "${Urls.patientAppointments}PatientId=${PrefsService.to.getInt("id")}"),
          headers: headers);

      if (response.statusCode == 401) {
        loginScreenController.logout();
      }
      return response;
    }
  }

  static Future<AppointmentDetails> getAppointmentDetails(int id) async {
    if (PrefsService.to.getString(ConstRes.tokenKey) != null) {
      String? token = PrefsService.to.getString(ConstRes.tokenKey);
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
        Uri.parse("${Urls.appointmentViewDetails}Id=$id"),
        headers: headers);

    return AppointmentDetails.fromJson(json.decode(response.body));
  }

  static Future getDoctorAvailableAppointementsDaysAPI(
      doctorId, depId, branchId, fromDate, toDate) async {
    http.Response response = await http.get(
      Uri.parse(
          "${Urls.getAvailableAppointmentsDays}DoctorId=$doctorId&DepartmentId=$depId&BranchId=$branchId&FromDate=$fromDate&ToDate=$toDate"),
      headers: headers,
    );

    return (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => AvailableAppointmentsDays.fromJson(tagJson))
        .toList();
  }

  static Future getDoctorAvailableAppointementsAPI(
      doctorId, depId, branchId, currenDate) async {
    http.Response response = await http.get(
      Uri.parse(
          "${Urls.getAvailableAppointments}?DoctorId=$doctorId&DepartmentId=$depId&BranchId=$branchId&CurrentDate=$currenDate"),
      headers: headers,
    );
    return response;
  }
}
