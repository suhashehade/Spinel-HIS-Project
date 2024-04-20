import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/home_screen/home_screen.dart';

class MainScreenController extends GetxController {
  Rx currentPage = const HomeScreen().obs;
  RxBool isHome = true.obs;

  changeCurrentPage(Widget page) {
    if (page != const HomeScreen()) {
      isHome.value = false;
    } else {
      isHome.value = true;
    }
    currentPage.value = page;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
