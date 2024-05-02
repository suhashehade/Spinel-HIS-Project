import 'package:get/get.dart';
import 'package:his_project/screens/doctor_screen/controller/doctor_screen_controller.dart';

class DoctorScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorScreenController());
  }
  
}