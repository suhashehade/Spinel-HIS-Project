import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar.dart';
import 'package:his_project/common/sidebar/sidebar.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/emergency_screen/controller/emergency_screen_controller.dart';
import 'package:his_project/screens/emergency_screen/view/widgets/emergency_services.dart';
import 'package:his_project/utils/consts_res.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EmergencyScreenController emergencyScreenController =
        Get.put(EmergencyScreenController());

    return Scaffold(
      drawer: const CustomSidebar(),
      appBar: const CustomAppBar(backWidget: SizedBox()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            SubAppBar(
              title: ConstRes.emergencyServices,
              handleReturn: emergencyScreenController.returnToHome,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const EmergencyServices(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
