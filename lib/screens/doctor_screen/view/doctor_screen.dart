import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar.dart';
import 'package:his_project/common/sidebar/sidebar.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/doctor_screen/controller/doctor_screen_controller.dart';
import 'package:his_project/screens/doctor_screen/view/widgets/available_appointments.dart';
import 'package:his_project/screens/doctor_screen/view/widgets/doctor_info.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class DoctorInfoScreen extends StatelessWidget {
  const DoctorInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorScreenController doctorScreenController = Get.find();

    return Scaffold(
      drawer: const CustomSidebar(),
      appBar: const CustomAppBar(backWidget: Text("")),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              SubAppBar(
                title: ConstRes.reserveAppointment,
                handleReturn: doctorScreenController.returnToDoctorList,
              ),
              Text(
                doctorScreenController.reserveAppointmentScreenController
                    .doctorsListArguments.value.doctorName,
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
              TabBar(
                dividerColor: CustomColors.lightBlue,
                indicatorColor: CustomColors.lightGreen,
                indicatorWeight: 5.0,
                labelColor: CustomColors.lightBlue,
                unselectedLabelColor: CustomColors.lightBlue,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: ConstRes.doctorInfo.tr),
                  Tab(text: ConstRes.availableAppointments.tr),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    DoctorInfo(),
                    AvailableAppointment(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
