import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/services/shared_prefs_service.dart';

class MyLocaleController extends GetxController {
  Locale initialLang = PrefsService.to.getString('lang') == null
      ? Locale(Get.deviceLocale!.languageCode)
      : PrefsService.to.getString('lang') == 'ar'
          ? const Locale('ar')
          : const Locale('en');

  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    PrefsService.to.setString('lang', codeLang);
    
    Get.updateLocale(locale);
  }
}
