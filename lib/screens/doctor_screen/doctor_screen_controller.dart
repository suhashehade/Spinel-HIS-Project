import 'package:get/get.dart';

class DoctorInfoScreenController extends GetxController {
  RxString choice = 'info'.obs;

  changeChoice(int value) {
    choice.value = value == 0 ? 'info' : 'available appointments';
  }
}
