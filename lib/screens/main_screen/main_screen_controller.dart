import 'package:get/get.dart';
import 'package:his_project/utils/pages_names.dart';

class MainScreenController extends GetxController {
  RxString currentPage = PagesNames.HOME.obs;
  RxBool isHome = true.obs;

  changeCurrentPage(String page) {
    if (page != PagesNames.HOME) {
      isHome.value = false;
    } else {
      isHome.value = true;
    }
    currentPage.value = page;
  }
}
