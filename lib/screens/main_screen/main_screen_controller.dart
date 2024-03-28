import 'package:get/get.dart';
import 'package:his_project/utils/pages_names.dart';


class MainScreenController extends GetxController {
  RxString currentPage = PagesNames.home.obs;
  RxBool isHome = true.obs;
  

  changeCurrentPage(String page) {
    if (page != PagesNames.home) {
      isHome.value = false;
    } else {
      isHome.value = true;
    }
    currentPage.value = page;
  }
}
