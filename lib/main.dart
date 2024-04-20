import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/locale/locale_controller.dart';
import 'package:his_project/locale/my_locale.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PrefsService prefsService = Get.put(PrefsService());
  await prefsService.init();
  MyLocaleController localeController = Get.put(MyLocaleController());

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'TheSans'),
    translations: MyLocal(),
    locale: localeController.initialLang,
    getPages: routes,
  ));
}
