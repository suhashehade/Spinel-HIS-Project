import 'package:get/get.dart';
import 'package:his_project/screens/reservation_confirmation_screen/controller/reservation_confirmation_screen_controller.dart';

class ReservationConfirmationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReservationConfirmationScreenController());
  }
}
