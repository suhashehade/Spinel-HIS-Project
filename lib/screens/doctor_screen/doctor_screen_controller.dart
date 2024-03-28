import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/appointment/available_appointment.dart';
import 'package:his_project/models/appointment/reserve_arguments.dart';
import 'package:his_project/models/doctor/branch_dep_doctor.dart';
import 'package:his_project/models/doctor/doctor_info.dart';
import 'package:his_project/models/event.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/pages_names.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class DoctorScreenController extends GetxController {
  RxString choice = 'info'.obs;
  RxList<AvailableAppointment> availableAppointments =
      <AvailableAppointment>[].obs;
  Rx<DateTime> today = DateTime.now().obs;
  Rx<Doctor> selectedDoctor =
      Doctor(id: 0, label: "", depId: 0, branchId: 0).obs;
  Rx<DoctorInfo> doctorInfo =
      DoctorInfo(gender: "", nationality: "", description: "").obs;
  RxList events = [].obs;
  RxMap selectedEvents = {}.obs;
  Rx<ReserveArguments> reserveArguments = ReserveArguments(
          doctorId: 0, depId: 0, branchId: 0, fromDate: "", toDate: "")
      .obs;
  RxString doctorName = ''.obs;
  changeChoice(int value) {
    choice.value = value == 0 ? 'info' : 'available appointments';
  }

  changeIsAppointmentSelected(AvailableAppointment aa) {
    aa.isSelected.value = !aa.isSelected.value;
  }

  getDoctorAvailableAppointementsDays(doctorId, depId, branchId) async {
    Map<String, String> headers = {};
    if (PrefsService.to.getString("token") != null) {
      String? token = PrefsService.to.getString("token");
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
        Uri.parse(
            "${Urls.logicUrl}DoctorAvailableAppointmentsList?DoctorId=$doctorId&DepartmentId=$depId&BranchId=$branchId&FromDate=${today.value}&ToDate=${today.value.add(const Duration(days: 90))}"),
        headers: headers);

    selectedEvents.value = toEvents(json.decode(response.body)['lstData']);
  }

  List<Event> getEventsFromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  Map<DateTime, List<dynamic>> toEvents(List<dynamic> appointments) {
    Map<DateTime, List<dynamic>> parsedEvents = {};
    for (var appointment in appointments) {
      if (appointment['isAvailable']) {
        DateTime date = DateTime.parse(appointment['dayDate']);
        DateTime d = DateTime(date.year, date.month, date.day);
        if (parsedEvents[d] == null) {
          parsedEvents[d] = [];
        }
        parsedEvents[d]!.add(appointment);
        events.add({d: appointment});
      }
    }
    return parsedEvents;
  }

  getDoctorAvailableAppointements(doctorId, depId, branchId) async {
    reserveArguments.value.branchId = branchId;
    reserveArguments.value.depId = depId;
    reserveArguments.value.doctorId = doctorId;
    Map<String, String> headers = {
      "content-type": "application/json; charset=utf-8",
    };
    if (PrefsService.to.getString("token") != null) {
      String? token = PrefsService.to.getString("token");
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
        Uri.parse(
            "${Urls.logicUrl}DoctorAvailableAppointmentsQuery?DoctorId=$doctorId&DepartmentId=$depId&BranchId=$branchId&CurrentDate=${today.value}"),
        headers: headers);
    availableAppointments.value =
        toAvailableAppointment(json.decode(response.body)['lstData']);
  }

  List<AvailableAppointment> toAvailableAppointment(dynamicList) {
    List<AvailableAppointment> list = <AvailableAppointment>[];
    dynamicList.forEach((element) {
      if (element['status'] != 1) {
        list.add(AvailableAppointment(
            dayDate: element['dayDate'],
            fromTime: element['fromTime'],
            toTime: element['toTime'],
            isSelected: false.obs));
      }
    });
    return list;
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formatedDate = DateFormat.yMMMd().format(dateTime);
    return formatedDate;
  }

  makeDate(String time) {
    DateTime fromDateTime = Jiffy.parse(time, pattern: "HH:mm")
        .add(
            years: today.value.year - 1970,
            days: today.value.day - 1,
            months: today.value.month - 1)
        .dateTime;

    return fromDateTime;
  }

  formatTime(String fromTime) {
    if (fromTime != '') {
      DateTime fromDateTime = makeDate(fromTime);
      String formatedTime = DateFormat("HH:mm a").format(fromDateTime);
      return formatedTime;
    } else {
      return DateFormat("HH:mm a").format(DateTime.now().toLocal());
    }
  }

  onSelectedDay(DateTime day, DateTime focusedDay) {
    for (var aa in availableAppointments) {
      aa.isSelected.value = false;
    }
    today.value = day;
  }

  getDoctorInfo(doctorId) async {
    Map<String, String> headers = {
      "content-type": "application/json; charset=utf-8",
    };
    if (PrefsService.to.getString("token") != null) {
      String? token = PrefsService.to.getString("token");
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
        Uri.parse('${Urls.account}DoctorViewDetails?Id=$doctorId'),
        headers: headers);

    doctorInfo.value = toDoctorInfo(json.decode(response.body));
  }

  DoctorInfo toDoctorInfo(infoMap) {
    return DoctorInfo(
      gender: infoMap['genderEn'] ?? "",
      nationality: infoMap['nationalityEn'] ?? "",
      description: infoMap['description'] ?? "",
    );
  }

  goToReserveAssurence() {
    if (reserveArguments.value.fromDate != '') {
      for (var aa in availableAppointments) {
        aa.isSelected.value = false;
      }
      Get.toNamed(PagesNames.preLogin, arguments: {
        "reserveArgs": reserveArguments,
      });
      reserveArguments.value.fromDate = '';
    } else {
      Get.snackbar(
        "Fail",
        "You Have to choose time",
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color.fromARGB(255, 240, 43, 43),
        icon: const Icon(Icons.error),
      );
    }
  }

  @override
  void onInit() async {
    // depId = Get.arguments['doctor'].depId;
    // branchId = Get.arguments['doctor'].branchId;
    // doctorId = Get.arguments['doctor'].id;
    // Timer.periodic(
    //     const Duration(milliseconds: 200), (timer) => getDoctorInfo());
    // Timer.periodic(const Duration(milliseconds: 200),
    //     (timer) => getDoctorAvailableAppointements());
    // await getDoctorInfo();
    // await getDoctorAvailableAppointements();

    super.onInit();
  }
}
