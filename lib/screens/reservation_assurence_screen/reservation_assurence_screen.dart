import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_button.dart';
import 'package:his_project/common/custom_text_field.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/reservation_assurence_screen/reservation_assurence_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:intl/intl.dart';

class ReservationAssurrenceScreen
    extends GetView<ReservationAssurenceScreenController> {
  ReservationAssurrenceScreen({super.key});
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(ReservationAssurenceScreenController());
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
              const Center(child: Text("Appointment Assurence")),
              const SizedBox(
                height: 20.0,
              ),
              Form(
                key: _keyForm,
                child: Column(
                  children: <Widget>[
                    Text(
                        "Branch Name: ${reserveAppointmentScreenController.doctorsListArguments.value.branchName}"),
                    Text(
                        "Department Name: ${reserveAppointmentScreenController.doctorsListArguments.value.depName}"),
                    Text(
                        "Doctor Name: ${reserveAppointmentScreenController.doctorsListArguments.value.doctorName}"),
                    Text(
                        "Date: ${DateFormat.yMMMd().format(DateTime.parse(doctorScreenController.reserveArguments.value.fromDate))}"),
                    Text(
                        "From Time: ${DateFormat('HH:mm a').format(DateTime.parse(doctorScreenController.reserveArguments.value.fromDate))}"),
                    Text(
                        "To Time: ${DateFormat('HH:mm a').format(DateTime.parse(doctorScreenController.reserveArguments.value.toDate))}"),
                    PrefsService.to.getInt("id") == null
                        ? Column(
                            children: [
                              const Text("you have to add your info"),
                              CustomTextField(
                                validator: () {},
                                controller: controller.mrnController,
                                textInputType: TextInputType.name,
                                labelText: 'MRN',
                                obscureText: false,
                              ),
                              CustomTextField(
                                validator: () {},
                                controller: controller.name1EnController,
                                textInputType: TextInputType.name,
                                labelText: 'Name1 English',
                                obscureText: false,
                              ),
                              CustomTextField(
                                validator: () {},
                                controller: controller.name2EnController,
                                textInputType: TextInputType.name,
                                labelText: 'Name2 English',
                                obscureText: false,
                              ),
                              CustomTextField(
                                validator: () {},
                                controller: controller.name3EnController,
                                textInputType: TextInputType.name,
                                labelText: 'Name3 English',
                                obscureText: false,
                              ),
                              CustomTextField(
                                validator: () {},
                                controller: controller.name4EnController,
                                textInputType: TextInputType.name,
                                labelText: 'Name4 English',
                                obscureText: false,
                              ),
                              CustomTextField(
                                validator: () {},
                                controller: controller.name1ArController,
                                textInputType: TextInputType.name,
                                labelText: 'Name1 Arabic',
                                obscureText: false,
                              ),
                              CustomTextField(
                                validator: () {},
                                controller: controller.name2ArController,
                                textInputType: TextInputType.name,
                                labelText: 'Name2 Arabic',
                                obscureText: false,
                              ),
                              CustomTextField(
                                validator: () {},
                                controller: controller.name3ArController,
                                textInputType: TextInputType.name,
                                labelText: 'Name3 Arabic',
                                obscureText: false,
                              ),
                              CustomTextField(
                                validator: () {},
                                controller: controller.name4ArController,
                                textInputType: TextInputType.name,
                                labelText: 'Name4 Arabic',
                                obscureText: false,
                              ),
                              CustomTextField(
                                validator: () {},
                                controller: controller.phoneController,
                                textInputType: TextInputType.name,
                                labelText: 'Phone Number',
                                obscureText: false,
                              ),
                              CustomTextField(
                                validator: () {},
                                controller: controller.idController,
                                textInputType: TextInputType.name,
                                labelText: 'ID Number',
                                obscureText: false,
                              ),
                              CustomTextField(
                                validator: () {},
                                controller: controller.addressEnController,
                                textInputType: TextInputType.name,
                                labelText: 'Address in English',
                                obscureText: false,
                              ),
                              CustomTextField(
                                validator: () {},
                                controller: controller.addressArController,
                                textInputType: TextInputType.name,
                                labelText: 'Address in Arabic',
                                obscureText: false,
                              ),
                              TextFormField(
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please fill the input';
                                  }
                                  return null;
                                },
                                controller: controller.dateOfBirthController,
                                decoration: const InputDecoration(
                                  label: Text(
                                    'Data of birth',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ),
                                onTap: () async {
                                  controller.pickDate(context);
                                },
                              ),
                            ],
                          )
                        : const Text(""),
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
