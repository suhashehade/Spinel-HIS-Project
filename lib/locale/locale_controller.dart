import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/services/shared_prefs_service.dart';

class MyLocaleController extends GetxController {
  // Locale initialLang = Locale(Get.locale!.languageCode ?? 'en');
  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    PrefsService.to.setString('lang', codeLang);
    Get.updateLocale(locale);
  }
}
