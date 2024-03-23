import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService extends GetxService {
  static PrefsService get to => Get.find();
  SharedPreferences? _prefs;

  Future<PrefsService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs!.setString(key, value);
  }

  String? getString(String key) {
    return _prefs!.getString(key);
  }

  Future<bool> remove(String key) async {
    return await _prefs!.remove(key);
  }
}
