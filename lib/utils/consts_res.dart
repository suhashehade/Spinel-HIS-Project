import 'package:get/get.dart';

class ConstRes {
  static List pages = [
    "medicalFile".tr,
    "familyFile".tr,
    "home".tr,
    "tasks".tr,
    "help".tr
  ];
  static String base = 'http://192.236.146.134:9000';
  static String baseUrl = '$base/api';

  static String languageCode = Get.locale?.languageCode ?? 'en';
}
