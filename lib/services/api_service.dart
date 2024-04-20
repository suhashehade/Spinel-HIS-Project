import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:his_project/models/appointment/appointment_details.dart';
import 'package:his_project/models/appointment/available_appointments_days.dart';
import 'package:his_project/models/patient/patient.dart';
import 'package:his_project/models/user/login.dart';
import 'package:his_project/screens/login_options_screen/login_options_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;
import '../models/appointment/reserve_arguments.dart';

class Api {
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

  static Future getDoctorInfoAPI(doctorId) async {
    http.Response response = await http.get(
      Uri.parse("${Urls.getDoctorInfo}Id=$doctorId"),
      headers: headers,
    );
    return response;
  }

  static Future getDoctorsAPI(branchId, depId) async {
    http.Response response = await http.get(
      Uri.parse(
          "${Urls.getDoctors}BranchId=$branchId&DepartmentId=$depId&UserTypeId=2"),
      headers: headers,
    );
    return response;
  }

  static Future getClinicsAPI() async {
    http.Response response = await http.get(
      Uri.parse(Urls.getClinics),
      headers: getHeaders(headers),
    );

    return response;
  }

  static Future getBranchesAPI(depId) async {
    http.Response response = await http.get(
      Uri.parse("${Urls.getBranches}=$depId"),
      headers: Api.getHeaders({}),
    );

    return response;
  }

  static Future addAppointmentAPI(ReserveArguments reserveArgs) async {
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

    return response;
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

  static Future getPatientAppointments() async {
    if (PrefsService.to.getString(ConstRes.tokenKey) != null) {
      String? token = PrefsService.to.getString(ConstRes.tokenKey);
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
        Uri.parse(
            "${Urls.patientAppointments}PatientId=${PrefsService.to.getInt("id")}"),
        headers: headers);
    return response;
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

  static Future<Patient> getPatients(String phone) async {
    if (PrefsService.to.getString(ConstRes.tokenKey) != null) {
      String? token = PrefsService.to.getString(ConstRes.tokenKey);
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
        Uri.parse("${Urls.patientDetails}&strSearch=$phone"),
        headers: headers);

    return Patient.fromJson(json.decode(response.body)['lstData'][0]);
  }
}
