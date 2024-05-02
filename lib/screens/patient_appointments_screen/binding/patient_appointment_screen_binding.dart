import 'package:get/get.dart';
import 'package:his_project/screens/patient_appointments_screen/controller/patient_appointments_screen_controller.dart';

class PatientAppointmentsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PatientAppointmentsScreenController());
  }
}
