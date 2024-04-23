import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/sidebar/sidebar.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/all_e_services_screen/all_e_services_screen_controller.dart';
import 'package:his_project/screens/all_e_services_screen/widgets/services_list.dart';
import 'package:his_project/screens/all_e_services_screen/widgets/weather.dart';
import 'package:his_project/utils/consts_res.dart';

class AllEServicesScreen extends StatelessWidget {
  const AllEServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllEServicesScreenController allEServicesScreenController =
        Get.put(AllEServicesScreenController());
    return Scaffold(
      drawer: const CustomSidebar(),
      appBar: AppBar(
        title: Text(ConstRes.eServices.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SubAppBar(
              handleReturn: allEServicesScreenController.handleReturn,
              title: ConstRes.showAllServices,
            ),
            const Weather(),
            const ServicesList(),
          ],
        ),
      ),
    );
  }
}
