import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/pages_names.dart';
import 'package:local_auth/local_auth.dart';

class LoginMiddleware extends GetMiddleware {
  final LocalAuthentication auth = LocalAuthentication();
  MainScreenController mainScreenController = Get.put(MainScreenController());
  String authorized = 'Not Authorized';
  bool isAuthenticating = false;
  @override
  RouteSettings? redirect(String? route) {
    if (PrefsService.to.getString('phone') != null) {
      if (PrefsService.to.getString("token") != null) {
        authenticate();
      }
    }
    return null;
  }

  Future<void> authenticate() async {
    bool authenticated = false;
    try {
      isAuthenticating = true;
      authorized = 'Authenticating';

      authenticated = await auth.authenticate(
        localizedReason: 'Perform Biometrics',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      if (authenticated == true) {
        if (PrefsService.to.getInt("afterLogin") == 0) {
          Get.offNamed(PagesNames.patientAppiontments);
        } else {
          if (PrefsService.to.getInt("afterLogin") == 8) {
            mainScreenController.currentPage.value = PagesNames.medicalFile;
          } else {
            Get.offNamed(PagesNames.reserveAssurence);
          }
        }
      }
    } on Exception catch (e) {
      isAuthenticating = false;
      authorized = 'Error - ${e.toString()}';
      return;
    }
    authorized = (authenticated ? 'Authorized' : 'Not Authorized');
    isAuthenticating = false;
  }
}
