import 'dart:convert';

import 'package:get/get.dart';
import 'package:his_project/models/appointment/patient_appointments.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/urls.dart';
import "package:http/http.dart" as http;

class PatientAppointmentsScreenController extends GetxController {
  RxList<PatientAppointment> appointments = <PatientAppointment>[].obs;

  getPatientAppointments() async {
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

    appointments.value =
        toPatientAppointmentsList(json.decode(response.body)['lstData']);
  }

  List<PatientAppointment> toPatientAppointmentsList(
      List<dynamic> dynamicList) {
    List<PatientAppointment> list = <PatientAppointment>[];

    for (int i = 0; i < dynamicList.length; i++) {
      list.add(PatientAppointment(
          branchName: dynamicList[i]['branchName'] ?? '',
          departmentName: dynamicList[i]['departmentName'] ?? '',
          doctorName: dynamicList[i]['doctorName'] ?? '',
          fromDate: dynamicList[i]['fromDate'] ?? '',
          toDate: dynamicList[i]['toDate'] ?? '',
          patientName: dynamicList[i]['patientName'] ?? '',
          departmentId: dynamicList[i]['departmentId'] ?? 0,
          doctorId: dynamicList[i]['doctorId'] ?? 0,
          patientId: dynamicList[i]['patientId'] ?? 0,
          reasonId: dynamicList[i]['reasonId'] ?? 0,
          statusName: dynamicList[i]['statusName'] ?? ''));
    }

    return list;
  }

  @override
  void onInit() async {
    await getPatientAppointments();
    super.onInit();
  }
}
