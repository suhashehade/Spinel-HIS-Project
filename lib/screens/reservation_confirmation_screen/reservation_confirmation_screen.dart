import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_button.dart';
import 'package:his_project/common/sidebar/sidebar.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/reservation_confirmation_screen/reservation_confirmation_screen_controller.dart';
import 'package:his_project/screens/reservation_confirmation_screen/widgets/appointment_info.dart';
import 'package:his_project/screens/reservation_confirmation_screen/widgets/doctor_info.dart';
import 'package:his_project/screens/reservation_confirmation_screen/widgets/patient_info.dart';
import 'package:his_project/utils/consts_res.dart';

class ReservationConfirmationScreen extends StatelessWidget {
  ReservationConfirmationScreen({super.key});
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ReservationConfirmationScreenController
        reservationConfirmationScreenController =
        Get.put(ReservationConfirmationScreenController());

    return Scaffold(
      drawer: const CustomSidebar(),
      appBar: const CustomAppBar(backWidget: Text("")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            SubAppBar(
                handleReturn: () {
                  reservationConfirmationScreenController.handleReturn();
                },
                title: ConstRes.confirmation),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              child: Form(
                key: _keyForm,
                child: Column(
                  children: <Widget>[
                    DoctorInfoConfirm(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const AppointmentDetails(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const PatientDetails(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomButton(
                      title: ConstRes.agree.tr,
                      handle: reservationConfirmationScreenController
                          .addAppointment,
                      formKey: _keyForm,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
