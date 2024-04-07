import 'package:his_project/services/api_service.dart';
import 'package:his_project/models/appointment/available_appointments_days.dart';
import 'package:his_project/models/event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/appointment/available_appointment.dart';
import 'package:his_project/models/appointment/reserve_arguments.dart';
import 'package:his_project/models/doctor/doctor_info.dart';
import 'package:his_project/screens/doctors_list_screen/doctors_list_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/utils/pages_names.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class DoctorScreenController extends GetxController {
  RxList<AvailableAppointment> availableAppointments =
      <AvailableAppointment>[].obs;
  Rx<DateTime> today = DateTime.now().obs;
  Rx<DoctorInfo> doctorInfo = DoctorInfo("", "", "", "", "", "").obs;
  RxList<AvailableAppointmentsDays> events = <AvailableAppointmentsDays>[].obs;

  Rx<ReserveArguments> reserveArguments = ReserveArguments(
          doctorId: 0, depId: 0, branchId: 0, fromDate: "", toDate: "")
      .obs;

  ReserveAppointmentScreenController reserveAppointmentScreenController =
      Get.put(ReserveAppointmentScreenController());
  DoctorsListScreenController doctorsListScreenController =
      Get.put(DoctorsListScreenController());

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
        return [Event('Today\'s Event ')];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  getDoctorAvailableAppointementsDays() async {
    int branchId = doctorsListScreenController.branchId.value;
    int depId = doctorsListScreenController.depId.value;
    int doctorId =
        reserveAppointmentScreenController.doctorsListArguments.value.doctorId;

    events.value = await Api.getDoctorAvailableAppointementsDaysAPI(
        doctorId,
        depId,
        branchId,
        today.value.toIso8601String(),
        today.value.add(const Duration(days: 90)).toIso8601String());
  }

  getDoctorAvailableAppointements() async {
    int doctorId =
        reserveAppointmentScreenController.doctorsListArguments.value.doctorId;

    int branchId = doctorsListScreenController.branchId.value;
    int depId = doctorsListScreenController.depId.value;

    reserveArguments.value.doctorId = doctorId;
    reserveArguments.value.branchId = branchId;
    reserveArguments.value.depId = depId;

    availableAppointments.value = await Api.getDoctorAvailableAppointementsAPI(
        doctorId, depId, branchId, today.value.toIso8601String());
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
    DateTime fromDateTime = Jiffy.parse(time, pattern: "HH:mm")
        .add(
            years: today.value.year - 1970,
            days: today.value.day - 1,
            months: today.value.month - 1)
        .dateTime;

    return fromDateTime;
  }

  formatTime(String fromTime) {
    // لشو هاد ؟
    if (fromTime != '') {
      DateTime fromDateTime = makeDate(fromTime);
      String formatedTime = DateFormat("HH:mm a").format(fromDateTime);
      return formatedTime;
    } else {
      return DateFormat("HH:mm a").format(DateTime.now());
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
    int doctorId =
        reserveAppointmentScreenController.doctorsListArguments.value.doctorId;
    doctorInfo.value = await Api.getDoctorInfoAPI(doctorId);
  }

  goToReserveAssurence() {
    if (reserveArguments.value.fromDate != '') {
      for (var aa in availableAppointments) {
        aa.isSelected.value = false;
      }
      Get.toNamed(PagesNames.preLogin, arguments: {
        "reserveArgs": reserveArguments,
      });
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

// كملي حاليا هيك بس تخلصي الجزئية الي بايدك بتبلشي تصليح بالكود اهم اشي الي حكيتلك عنهم
// بالنسبة للموضع الي الحق علي فيه بس تخلصي الجزئية هاي بفرجيكي كيف بالحرف
// اول ما تخلصيها بتحكيلي تمام ؟
  // @override
  // void onInit() async {
  //   ReserveAppointmentScreenController reserveAppointmentScreenController =
  //       Get.find();
  //   // int doctorId =
  //   //     reserveAppointmentScreenController.doctorsListArguments.value.doctorId;

  //   // int branchId = doctorsListScreenController.branchId.value;
  //   // int depId = reserveAppointmentScreenController.depId.value;
  //   // reserveArguments.value.doctorId = doctorId;
  //   // reserveArguments.value.branchId = branchId;
  //   // reserveArguments.value.depId = depId;

  //   // print(
  //   //     reserveAppointmentScreenController.doctorsListArguments.value.doctorId);
  //   await getDoctorInfo();
  //   await getDoctorAvailableAppointements();
  //   await getDoctorAvailableAppointementsDays();
  //   super.onInit();
  // }
}
