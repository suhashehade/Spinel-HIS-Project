import 'package:get/get.dart';
import 'package:his_project/screens/medical_analysis_results_screen/medical_analysis_results_screen.dart';
import 'package:his_project/screens/pathology_test_screen/pathology_test_screen.dart';

class MedicalTestScreenController extends GetxController {
  handleList(String name) {
    switch (name) {
      case 'lab':
        Get.to(() => const MedicalAnalysisResultScreen());
      case 'pathology':
        Get.to(() => const PathologyTestScreen());
    }
  }

  handleReturn(){
    Get.back();
  }
}
