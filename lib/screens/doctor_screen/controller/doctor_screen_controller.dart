import 'dart:convert';

import 'package:his_project/models/branch/branch.dart';
import 'package:his_project/models/clinic/clinic.dart';
import 'package:his_project/models/doctor/branch_dep_doctor.dart';
import 'package:his_project/models/doctor/doctor_list_arguments.dart';
import 'package:his_project/models/user/user.dart';
import 'package:his_project/screens/main_screen/controller/main_screen_controller.dart';
import 'package:his_project/models/appointment/available_appointments_days.dart';
import 'package:his_project/models/event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/appointment/available_appointment.dart';
import 'package:his_project/models/appointment/reserve_arguments.dart';
import 'package:his_project/models/doctor/doctor_info.dart';
import 'package:his_project/screens/doctors_list_screen/controller/doctors_list_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/controller/reserve_appoinment_screen_controller.dart';
import 'package:his_project/services/appointment_api_service.dart';
import 'package:his_project/services/doctor_api_service.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/messages.dart';
import 'package:his_project/utils/pages_names.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class DoctorScreenController extends GetxController {
  RxList<AvailableAppointment> availableAppointments =
      <AvailableAppointment>[].obs;
  RxBool isLoading = false.obs;
  RxBool isTimesLoading = false.obs;
  RxBool isDaysLoading = false.obs;
  Rx<DateTime> today = DateTime.now().obs;
  Rx<DoctorInfo> doctorInfo = DoctorInfo("", "", "", "", "", "").obs;
  RxList<AvailableAppointmentsDays> events = <AvailableAppointmentsDays>[].obs;
  RxInt doctorId = 0.obs;
  RxInt depId = 0.obs;
  RxInt branchId = 0.obs;
  Rx<User> patient =
      User(0, "", "", "", "", "", "", "", "", "", "", false, "", 0, "").obs;
  Rx<ReserveArguments> reserveArguments = ReserveArguments(
          doctorId: 0, depId: 0, branchId: 0, fromDate: "", toDate: "")
      .obs;
  Rx<DoctorsListArguments> doctorsListArguments = DoctorsListArguments(
          branchId: 0,
          depId: 0,
          doctorId: 0,
          doctorName: "",
          branchName: "",
          depName: "")
      .obs;
  late ReserveAppointmentScreenController reserveAppointmentScreenController;
  DoctorsListScreenController doctorsListScreenController =
      Get.put(DoctorsListScreenController());
  MainScreenController mainScreenController = Get.put(MainScreenController());

  changeIsAppointmentSelected(AvailableAppointment aa) {
    aa.isSelected.value = !aa.isSelected.value;
  }

  List<Event> checkMarker(DateTime day) {
    try {
      bool dd = events
          .firstWhere((p0) =>
              DateTime.parse(p0.dayDate).year == day.year &&
              DateTime.parse(p0.dayDate).month == day.month &&
              DateTime.parse(p0.dayDate).day == day.day)
          .isAvailable;

      if (dd) {
        return [Event(Messages.noEventsMessage)];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  getDoctorAvailableAppointementsDays() async {
    isDaysLoading.value = true;
    events.value = await AppointmentAPI.getDoctorAvailableAppointementsDaysAPI(
        doctorId.value,
        depId.value,
        branchId.value,
        today.value.toIso8601String(),
        today.value.add(const Duration(days: 90)).toIso8601String());
    isDaysLoading.value = false;
  }

  getDoctorAvailableAppointements() async {
    isTimesLoading.value = true;

    reserveArguments.value.doctorId = doctorId.value;
    reserveArguments.value.branchId = branchId.value;
    reserveArguments.value.depId = depId.value;

    var response = await AppointmentAPI.getDoctorAvailableAppointementsAPI(
        doctorId.value,
        depId.value,
        branchId.value,
        today.value.toIso8601String());

    if (response.statusCode == 200) {
      availableAppointments.value =
          (json.decode(response.body)['lstData'] as List)
              .map((tagJson) => AvailableAppointment.fromJson(tagJson))
              .toList();
      isTimesLoading.value = false;
    } else {
      isTimesLoading.value = false;
    }
  }

  onTimeSelected(AvailableAppointment aa) {
    for (var a in availableAppointments) {
      if (a.fromTime != aa.fromTime) {
        a.isSelected.value = false;
      }
    }
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formatedDate = DateFormat.yMMMd().format(dateTime);
    return formatedDate;
  }

  DateTime makeDate(String time) {
    DateTime fromDateTime = Jiffy.parse(time, pattern: ConstRes.timePattern2)
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
      String formatedTime =
          DateFormat(ConstRes.timePattern1).format(fromDateTime);
      return formatedTime;
    } else {
      return DateFormat(ConstRes.timePattern1).format(DateTime.now());
    }
  }

  onSelectedDay(DateTime day, DateTime focusedDay) async {
    for (var aa in availableAppointments) {
      aa.isSelected.value = false;
    }
    today.value = day;
    await getDoctorAvailableAppointements();
  }

  getDoctorInfo() async {
    isLoading.value = true;

    var response = await DoctoAPI.getDoctorInfoAPI(doctorId.value);
    if (response.statusCode == 200) {
      isLoading.value = false;
      doctorInfo.value = DoctorInfo.fromJson(json.decode(response.body));
    } else {
      isLoading.value = false;
    }
  }

  returnToDoctorList() {
    Get.back();
  }

  goToReserveConfirmation() async {
    if (reserveArguments.value.fromDate != '') {
      for (var aa in availableAppointments) {
        aa.isSelected.value = false;
      }
      PrefsService.to.setString(ConstRes.afterLoginKey, "confirm");

      Get.toNamed(PagesNames.preLogin, arguments: {
        ConstRes.reserveArgsKey: reserveArguments,
      });
    } else {
      Get.snackbar(
        ConstRes.fail,
        Messages.choosetimeErrorMessage,
        colorText: CustomColors.white,
        snackPosition: SnackPosition.TOP,
        backgroundColor: CustomColors.red,
        icon: const Icon(Icons.error),
      );
    }
  }

  reserve(AvailableAppointment aa) {
    changeIsAppointmentSelected(aa);
    onTimeSelected(aa);
    if (aa.isSelected.value) {
      reserveArguments.value.fromDate = makeDate(aa.fromTime).toIso8601String();
      reserveArguments.value.toDate = makeDate(aa.toTime).toIso8601String();
    }
  }

  changeDoctorName() {
    Doctor d = doctorsListScreenController.doctors
        .where((p0) => p0.id == reserveArguments.value.doctorId)
        .toList()[0];
    reserveAppointmentScreenController.doctorsListArguments.value.doctorName =
        d.keys[PrefsService.to.getString(ConstRes.langkey) ??
            Get.locale?.languageCode]![ConstRes.labelKey]!;
  }

  changeBranchName() {
    Branch b = reserveAppointmentScreenController.branches
        .where((p0) => p0.id == reserveArguments.value.branchId)
        .toList()[0];

    doctorsListArguments.value.branchName = b.keys[
        PrefsService.to.getString(ConstRes.langkey) ??
            Get.locale?.languageCode]![ConstRes.labelKey]!;
  }

  changeClinicName() {
    Clinic c = reserveAppointmentScreenController.clinics
        .where((p0) => p0.id == reserveArguments.value.depId)
        .toList()[0];

    doctorsListArguments.value.depName = c.keys[
        PrefsService.to.getString(ConstRes.langkey) ??
            Get.locale?.languageCode]![ConstRes.nameKey]!;
  }

// كملي حاليا هيك بس تخلصي الجزئية الي بايدك بتبلشي تصليح بالكود اهم اشي الي حكيتلك عنهم
// بالنسبة للموضع الي الحق علي فيه بس تخلصي الجزئية هاي بفرجيكي كيف بالحرف
// اول ما تخلصيها بتحكيلي تمام ؟
  @override
  void onInit() async {
    doctorsListArguments.value = Get.arguments ??
        DoctorsListArguments(
            branchId: 0,
            depId: 0,
            doctorId: 0,
            doctorName: "",
            branchName: "",
            depName: "");
    doctorId.value = doctorsListArguments.value.doctorId;
    depId.value = doctorsListArguments.value.depId;
    branchId.value = doctorsListArguments.value.branchId;
    reserveAppointmentScreenController =
        Get.put(ReserveAppointmentScreenController());
    await getDoctorInfo();
    await getDoctorAvailableAppointements();
    await getDoctorAvailableAppointementsDays();
    super.onInit();
  }
}
