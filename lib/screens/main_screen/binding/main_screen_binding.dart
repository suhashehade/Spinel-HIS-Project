import 'package:get/get.dart';
import 'package:his_project/screens/family_medical_file_screen/controller/family_medical_file_screen_controller.dart';
import 'package:his_project/screens/medical_analysis_results_screen/controller/medical_analysis_results_screen_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FamilyMedicalFileScreenController());
    Get.lazyPut(() => MedicalAnalysisResultScreenController());
  }
}
