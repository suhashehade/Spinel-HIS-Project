import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:his_project/models/appointment/reservArguments.dart';
import 'package:his_project/models/user/user.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/urls.dart';

class ReserveationAssurenceScreenController extends GetxController {
  TextEditingController mrnController = TextEditingController();
  TextEditingController name1EnController = TextEditingController();
  TextEditingController name2EnController = TextEditingController();
  TextEditingController name3EnController = TextEditingController();
  TextEditingController name4EnController = TextEditingController();
  TextEditingController name1ArController = TextEditingController();
  TextEditingController name2ArController = TextEditingController();
  TextEditingController name3ArController = TextEditingController();
  TextEditingController name4ArController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController idController = TextEditingController();
  Rx<User> patient = User(id: 0, phone: "").obs;

  getPatientId() async {
    Map<String, String> headers = {
      "content-type": "application/json; charset=utf-8",
    };
    if (PrefsService.to.getString("token") != null) {
      String? token = PrefsService.to.getString("token");
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
        Uri.parse("${Urls.account}UserList?page=1&pageSize=1000&UserType=3"),
        headers: headers);

    patient.value.id =
        returnPatient(json.decode(response.body)['lstData'])[0]['id'];
    PrefsService.to.setInt("id", patient.value.id);
  }

  returnPatient(List list) {
    Iterable iterable = list
        .where((element) =>
            element['phone1'] == PrefsService.to.getString("phone"))
        .toList();
    return iterable;
  }

  getUserReservations() async {
    Map<String, String> headers = {
      "content-type": "application/json; charset=utf-8",
    };
    if (PrefsService.to.getString("token") != null) {
      String? token = PrefsService.to.getString("token");
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
        Uri.parse(
            "${Urls.logicUrl}AppointmentsList?Page=1&PageSize=1000&PatientId=${PrefsService.to.getInt("id")}"),
        headers: headers);
    return json.decode(response.body)['lstData'];
  }

  isPatientHaveReservation() async {
    List res = await getUserReservations();
    if (res.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  addAppointment() async {
    DoctorScreenController doctorScreenController =
        Get.put(DoctorScreenController());
    ReserveArguments reserveArgs =
        doctorScreenController.reserveArguments.value;

    Map<String, String> headers = {
      "content-type": "application/json; charset=utf-8",
    };
    if (PrefsService.to.getString("token") != null) {
      String? token = PrefsService.to.getString("token");
      headers['Authorization'] = 'Bearer $token';
    }

    Map<String, dynamic> body = {
      "branchId": reserveArgs.branchId,
      "clinicId": null,
      "doctorId": reserveArgs.doctorId,
      "fromDate": reserveArgs.fromDate,
      "toDate": reserveArgs.toDate,
      "reasonId": null,
      "statusId": null,
      "patientId": PrefsService.to.getInt("id"),
      "departmentId": reserveArgs.depId,
      "note": "string"
    };
    if (await isPatientHaveReservation() == false) {
      body['pationt'] = {
        "patient": {
          "manualUserId": "string",
          "nameEn1": "string",
          "nameEn2": "string",
          "nameEn3": "string",
          "nameEn4": "string",
          "nameAr1": "string",
          "nameAr2": "string",
          "nameAr3": "string",
          "nameAr4": "string",
          "phone1": "string",
          "idNumber": "string",
          "birthDate": "2024-03-27T17:47:48.266Z",
          "genderId": 0,
          "countryId": 0,
          "addressEn": "string",
          "addressAr": "string",
          "userType": 3,
          "isActive": true
        },
      };
    }

    http.Response response = await http.post(
        Uri.parse("${Urls.logicUrl}AddAppointment"),
        body: jsonEncode(body),
        headers: headers);
    print(response.body);
  }

  @override
  void onInit() async {
    await getPatientId();
    super.onInit();
  }
}
