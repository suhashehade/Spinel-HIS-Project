import 'dart:convert';
import 'package:get/get.dart';
import 'package:his_project/models/appointment/available_appointment.dart';
import 'package:his_project/models/doctor/branch_dep_doctor.dart';
import 'package:his_project/models/doctor/doctor_info.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class DoctorScreenController extends GetxController {
  RxString choice = 'info'.obs;
  RxList<AvailableAppointment> availableAppointments =
      <AvailableAppointment>[].obs;
  RxString currentDate = '0000-00-00T00:00:00'.obs;
  Rx<DateTime> today = DateTime.now().obs;
  Rx<Doctor> selectedDoctor =
      Doctor(id: 0, label: "", depId: 0, branchId: 0).obs;
  late int depId;
  late int branchId;
  late int doctorId;
  Rx<DoctorInfo> doctorInfo =
      DoctorInfo(gender: "", nationality: "", description: "").obs;

  changeChoice(int value) {
    choice.value = value == 0 ? 'info' : 'available appointments';
  }

  changeIsAppointmentSelected(AvailableAppointment aa) {
    aa.isSelected.value = !aa.isSelected.value;
  }

  getDoctorAvailableAppointements() async {
    http.Response response = await http.get(Uri.parse(
        "${Urls.logicUrl}DoctorAvailableAppointmentsQuery?DoctorId=$doctorId&DepartmentId=$depId&BranchId=$branchId&CurrentDate=${today.value}"));
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

  // setCurrentDate() {
  //   currentDate.value = availableAppointments[0].dayDate;
  // }

  getCurrentDateAsDateTime() {
    if (currentDate.value != '') {
      return DateTime.parse(currentDate.value);
    }
    // return DateTime.parse('2024-03-09T23:03:00');
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formatedDate = DateFormat.yMMMd().format(dateTime);
    return formatedDate;
  }

  formatTime(String fromTime, String dayDate) {
    if (fromTime != '' && dayDate != '') {
      DateTime dayDateTime = DateTime.parse(dayDate);
      DateTime fromDateTime = Jiffy.parse(fromTime, pattern: "HH:mm")
          .add(
              years: dayDateTime.year,
              days: dayDateTime.day,
              months: dayDateTime.month)
          .dateTime;
      String formatedTime = DateFormat("HH:mm a").format(fromDateTime);
      return formatedTime;
    } else {
      return DateFormat("HH:mm a").format(DateTime.now());
    }
  }

  onSelectedDay(DateTime day, DateTime focusedDay) {
    today.value = day;
  }

  getDoctorInfo() async {
    http.Response response = await http
        .get(Uri.parse('${Urls.account}/DoctorViewDetails?Id=$doctorId'));
    doctorInfo.value = toDoctorInfo(json.decode(response.body));
    print(json.decode(response.body));
  }

  DoctorInfo toDoctorInfo(infoMap) {
    return DoctorInfo(
      gender: infoMap['genderEn'] ?? "",
      nationality: infoMap['nationalityEn'] ?? "",
      description: infoMap['description'] ?? "",
    );
  }

  @override
  void onInit() async {
    depId = Get.arguments['doctor'].depId;
    branchId = Get.arguments['doctor'].branchId;
    doctorId = Get.arguments['doctor'].id;

    await getDoctorAvailableAppointements();
    await getDoctorInfo();
    // setCurrentDate();

    super.onInit();
  }
}
