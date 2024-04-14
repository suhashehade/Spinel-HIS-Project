import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/widgets/choose_clinic.dart';
import 'package:his_project/screens/reserve_appoinment_screen/widgets/choose_doctor.dart';
import 'package:his_project/utils/colors_res.dart';

class ReserveAppointmentScreen
    extends GetView<ReserveAppointmentScreenController> {
  const ReserveAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReserveAppointmentScreenController());

    return DefaultTabController(
      animationDuration: const Duration(microseconds: 5),
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                dividerColor: Color(CustomColors.lightBlue),
                indicatorColor: Color(CustomColors.lightGreen),
                indicatorWeight: 5.0,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: "clinic".tr),
                  Tab(text: "doctor".tr),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    ChooseClinic(),
                    ChooseDoctor(),
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
