import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar.dart';
import 'package:his_project/common/sidebar/sidebar.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/doctor_screen/widgets/available_appointments.dart';
import 'package:his_project/screens/doctor_screen/widgets/doctor_info.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class DoctorInfoScreen extends StatelessWidget {
  const DoctorInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorScreenController doctorScreenController =
        Get.put(DoctorScreenController());
    ReserveAppointmentScreenController reserveAppointmentScreenController =
        Get.put(ReserveAppointmentScreenController());
    
    return Scaffold(
      drawer: const CustomSidebar(),
      appBar: const CustomAppBar(backWidget: Text("")),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              SubAppBar(
                title: ConstRes.reserveAppointment,
                handleReturn: doctorScreenController.returnToDoctorList,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                reserveAppointmentScreenController
                    .doctorsListArguments.value.doctorName,
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TabBar(
                dividerColor: Color(CustomColors.lightBlue),
                indicatorColor: Color(CustomColors.lightGreen),
                indicatorWeight: 5.0,
                labelColor: Color(CustomColors.lightBlue),
                unselectedLabelColor: Color(CustomColors.lightBlue),
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
