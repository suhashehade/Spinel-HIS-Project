import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_button.dart';
import 'package:his_project/common/custom_text_field.dart';
import 'package:his_project/screens/reservation_assurence_screen/reservation_assurence_screen_controller.dart';

class ReservationAssurrenceScreen
    extends GetView<ReserveationAssurenceScreenController> {
  ReservationAssurrenceScreen({super.key});
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(ReserveationAssurenceScreenController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          child: Column(
            children: [
              const Text("Appointment Assurence"),
              Form(
                key: _keyForm,
                child: Column(
                  children: <Widget>[
                    // CustomTextField(
                    //   validator: () {},
                    //   controller: controller.mrnController,
                    //   textInputType: TextInputType.name,
                    //   labelText: 'MRN',
                    //   obscureText: false,
                    // ),
                    // CustomTextField(
                    //   validator: () {},
                    //   controller: controller.name1EnController,
                    //   textInputType: TextInputType.name,
                    //   labelText: 'Name1 English',
                    //   obscureText: false,
                    // ),
                    // CustomTextField(
                    //   validator: () {},
                    //   controller: controller.name2EnController,
                    //   textInputType: TextInputType.name,
                    //   labelText: 'Name2 English',
                    //   obscureText: false,
                    // ),
                    // CustomTextField(
                    //   validator: () {},
                    //   controller: controller.name3EnController,
                    //   textInputType: TextInputType.name,
                    //   labelText: 'Name3 English',
                    //   obscureText: false,
                    // ),
                    // CustomTextField(
                    //   validator: () {},
                    //   controller: controller.name4EnController,
                    //   textInputType: TextInputType.name,
                    //   labelText: 'Name4 English',
                    //   obscureText: false,
                    // ),
                    // CustomTextField(
                    //   validator: () {},
                    //   controller: controller.name1ArController,
                    //   textInputType: TextInputType.name,
                    //   labelText: 'Name1 Arabic',
                    //   obscureText: false,
                    // ),
                    // CustomTextField(
                    //   validator: () {},
                    //   controller: controller.name2ArController,
                    //   textInputType: TextInputType.name,
                    //   labelText: 'Name2 Arabic',
                    //   obscureText: false,
                    // ),
                    // CustomTextField(
                    //   validator: () {},
                    //   controller: controller.name3ArController,
                    //   textInputType: TextInputType.name,
                    //   labelText: 'Name3 Arabic',
                    //   obscureText: false,
                    // ),
                    // CustomTextField(
                    //   validator: () {},
                    //   controller: controller.name4ArController,
                    //   textInputType: TextInputType.name,
                    //   labelText: 'Name4 Arabic',
                    //   obscureText: false,
                    // ),
                    // CustomTextField(
                    //   validator: () {},
                    //   controller: controller.phoneController,
                    //   textInputType: TextInputType.name,
                    //   labelText: 'Phone Number',
                    //   obscureText: false,
                    // ),
                    // CustomTextField(
                    //   validator: () {},
                    //   controller: controller.idController,
                    //   textInputType: TextInputType.name,
                    //   labelText: 'ID Number',
                    //   obscureText: false,
                    // ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomButton(
                      title: 'Agree',
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
