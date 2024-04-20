import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/screens/medical_file_screen/medical_file_screen.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';
import 'package:local_auth/local_auth.dart';

class LoginMiddleware extends GetMiddleware {
  final LocalAuthentication auth = LocalAuthentication();
  MainScreenController mainScreenController = Get.put(MainScreenController());
  String authorized = ConstRes.notAuthorized;
  bool isAuthenticating = false;
  @override
  RouteSettings? redirect(String? route) {
    if (PrefsService.to.getString(ConstRes.phoneKey) != null) {
      if (PrefsService.to.getString(ConstRes.tokenKey) != null) {
        authenticate();
      }
    }
    return null;
  }

  Future<void> authenticate() async {
    bool authenticated = false;
    try {
      isAuthenticating = true;
      authorized = ConstRes.authenticating;

      authenticated = await auth.authenticate(
        localizedReason: ConstRes.biometrics,
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      if (authenticated == true) {
        if (PrefsService.to.getInt(ConstRes.afterLoginKey) == 0) {
          Get.toNamed(PagesNames.patientAppiontments);
          PrefsService.to.remove(ConstRes.afterLoginKey);
        } else {
          if (PrefsService.to.getInt(ConstRes.afterLoginKey) == 8) {
            mainScreenController.currentPage.value = const MedicalFileScreen();
            PrefsService.to.remove(ConstRes.afterLoginKey);
          } else {
            if (PrefsService.to.getInt(ConstRes.afterLoginKey) == 1) {
              Get.toNamed(PagesNames.reserveAssurence);
              PrefsService.to.remove(ConstRes.afterLoginKey);
            }
          }
        }
      }
    } on Exception catch (e) {
      isAuthenticating = false;
      authorized = '${ConstRes.authError} ${e.toString()}';
      return;
    }
    authorized = (authenticated ? ConstRes.authorized : ConstRes.notAuthorized);
    isAuthenticating = false;
  }
}
