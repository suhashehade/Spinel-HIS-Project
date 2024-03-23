import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/pages_names.dart';
import 'package:local_auth/local_auth.dart';

class LoginMiddleware extends GetMiddleware {
  final LocalAuthentication auth = LocalAuthentication();

  String authorized = 'Not Authorized';
  bool isAuthenticating = false;
  @override
  RouteSettings? redirect(String? route) {
    if (PrefsService.to.getString('userName') != null ||
        PrefsService.to.getString('password') != null) {
      if (PrefsService.to.getString("token") != null) {
        authenticate();
      }
      // return const RouteSettings(name: "/main");
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

// There are also other options.
        ),
      );
      if (authenticated == true) {
// Perform your code here when authenticated
        Get.offNamed(PagesNames.MAIN);
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
