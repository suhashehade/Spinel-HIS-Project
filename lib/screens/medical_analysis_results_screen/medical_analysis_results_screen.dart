import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar.dart';
import 'package:his_project/common/sidebar.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/medical_analysis_results_screen/medical_analysis_results_screen_controller.dart';
import 'package:his_project/screens/medical_analysis_results_screen/widgets/cbc_results_container.dart';
import 'package:his_project/screens/medical_analysis_results_screen/widgets/general_results.dart';
import 'package:his_project/utils/consts_res.dart';

class MedicalAnalysisResultScreen extends StatelessWidget {
  const MedicalAnalysisResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MedicalAnalysisResultScreenController
        medicalAnalysisResultScreenController =
        Get.put(MedicalAnalysisResultScreenController());
    return Scaffold(
      drawer: const CustomSidebar(),
      appBar: const CustomAppBar(backWidget: Text("")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SubAppBar(
                handleReturn: () {
                  medicalAnalysisResultScreenController.handleReturn();
                },
                title: ConstRes.medicalAnalyisResults),
            const SizedBox(
              height: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CBCResultsContainer(),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: GeneralResultsContainer(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
