import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/sidebar/sidebar.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/medical_test_screen/controller/medical_test_screen_controller.dart';
import 'package:his_project/screens/medical_test_screen/view/widgets/medical_test_list.dart';
import 'package:his_project/utils/consts_res.dart';

class MedicalTestScreen extends StatelessWidget {
  const MedicalTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MedicalTestScreenController medicalTestScreenController =
        Get.put(MedicalTestScreenController());
    return Scaffold(
      drawer: const CustomSidebar(),
      appBar: const CustomAppBar(backWidget: Text("")),
      body: Column(
        children: [
          SubAppBar(
              handleReturn: () {
                medicalTestScreenController.handleReturn();
              },
              title: ConstRes.medicalAnalyisResults),
          const SizedBox(
            height: 50.0,
          ),
          const MediacTestList(),
        ],
      ),
    );
  }
}
