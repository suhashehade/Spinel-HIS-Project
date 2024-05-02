import 'package:get/get.dart';
import 'package:his_project/screens/reserve_appoinment_screen/controller/reserve_appoinment_screen_controller.dart';

class ReserveAppointmentScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ReserveAppointmentScreenController());
  }


}