import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar.dart';
import 'package:his_project/common/sidebar/sidebar.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/reserve_appoinment_screen/controller/reserve_appoinment_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/view/widgets/choose_clinic.dart';
import 'package:his_project/screens/reserve_appoinment_screen/view/widgets/choose_doctor.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class ReserveAppointmentScreen extends StatelessWidget {
  const ReserveAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ReserveAppointmentScreenController reserveAppointmentScreenController =
        Get.find();
    return DefaultTabController(
      animationDuration: const Duration(microseconds: 5),
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        drawer: const CustomSidebar(),
        appBar: const CustomAppBar(backWidget: SizedBox()),
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                SubAppBar(
                  title: ConstRes.reserveAppointment,
                  handleReturn:
                      reserveAppointmentScreenController.returnToHomePage,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TabBar(
                  dividerColor: CustomColors.lightBlue,
                  indicatorColor: CustomColors.lightGreen,
                  labelColor: CustomColors.lightBlue,
                  labelStyle: const TextStyle(fontSize: 18.0),
                  unselectedLabelColor: CustomColors.lightBlue,
                  indicatorWeight: 5.0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: ConstRes.clinic.tr),
                    Tab(text: ConstRes.doctor.tr),
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
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }
}
