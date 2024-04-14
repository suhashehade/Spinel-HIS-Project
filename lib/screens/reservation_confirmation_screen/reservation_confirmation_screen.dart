import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_button.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/reservation_confirmation_screen/reservation_confirmation_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:intl/intl.dart';

class ReservationConfirmationScreen
    extends GetView<ReservationConfirmationScreenController> {
  ReservationConfirmationScreen({super.key});
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(ReservationConfirmationScreenController());
    DoctorScreenController doctorScreenController =
        Get.put(DoctorScreenController());

    ReserveAppointmentScreenController reserveAppointmentScreenController =
        Get.put(ReserveAppointmentScreenController());
    return Scaffold(
      appBar: const CustomAppBar(backWidget: Text("")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Center(child: Text("confirmation".tr)),
              const SizedBox(
                height: 20.0,
              ),
              Form(
                key: _keyForm,
                child: Column(
                  children: <Widget>[
                    Text(
                        "${'clinic'.tr}: ${reserveAppointmentScreenController.doctorsListArguments.value.depName}"),
                    Text(
                        "${'branch'.tr}: ${reserveAppointmentScreenController.doctorsListArguments.value.branchName}"),
                    Text(
                        "${'doctor'.tr}: ${reserveAppointmentScreenController.doctorsListArguments.value.doctorName}"),
                    Text(
                        "${'date'.tr}: ${DateFormat.yMMMd().format(DateTime.parse(doctorScreenController.reserveArguments.value.fromDate))}"),
                    Text(
                        "${'fromTime'.tr}: ${DateFormat('HH:mm a').format(DateTime.parse(doctorScreenController.reserveArguments.value.fromDate))}"),
                    Text(
                        "${'toTime'.tr}: ${DateFormat('HH:mm a').format(DateTime.parse(doctorScreenController.reserveArguments.value.toDate))}"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomButton(
                      title: 'agree'.tr,
                      handle: controller.addAppointment,
                      formKey: _keyForm,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
