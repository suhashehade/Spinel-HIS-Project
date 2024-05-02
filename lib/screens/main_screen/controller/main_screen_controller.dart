import 'package:get/get.dart';
import 'package:his_project/utils/lists.dart';
import 'package:his_project/utils/pages_names.dart';

class MainScreenController extends GetxController {
  Rx currentPage = Lists.pages[2].obs;
  RxBool isHome = true.obs;

  toReserveAppointment() {
    Get.toNamed(PagesNames.reserveAppointment);
    isHome.value = false;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
