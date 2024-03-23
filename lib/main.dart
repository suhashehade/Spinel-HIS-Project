import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/login_screen/loginMiddleware.dart';
import 'package:his_project/screens/login_screen/login_screen.dart';
import 'package:his_project/screens/main_screen/main_screen.dart';
import 'package:his_project/screens/registration_screen/registration_screen.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/pages_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PrefsService prefsService = Get.put(PrefsService());
  await prefsService.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(
          name: PagesNames.ROOT,
          page: () => LoginScreen(),
          middlewares: [LoginMiddleware()]),
      GetPage(
        name: PagesNames.MAIN,
        page: () => const MainScreen(),
      ),
      GetPage(
          name: PagesNames.REGISTRATION,
          page: () => const RegistrationScreen()),
    ],
  ));
}
