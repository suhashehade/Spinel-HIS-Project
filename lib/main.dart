import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/login_options_screen/login_options_screen.dart';
import 'package:his_project/screens/login_screen/login_middleware.dart';
import 'package:his_project/screens/login_screen/login_screen.dart';
import 'package:his_project/screens/main_screen/main_screen.dart';
import 'package:his_project/screens/patient_appointments_screen/patient_appointments_screen.dart';
import 'package:his_project/screens/pre_login_screen/pre_login_screen.dart';
import 'package:his_project/screens/registration_screen/registration_screen.dart';
import 'package:his_project/screens/reservation_assurence_screen/reservation_assurence_screen.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/pages_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PrefsService prefsService = Get.put(PrefsService());
  await prefsService.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'TheSans'),
    getPages: [
      GetPage(
        name: PagesNames.root,
        page: () => const MainScreen(),
      ),
      GetPage(
        name: PagesNames.reserveAppointment,
        page: () => const ReserveAppointmentScreen(),
      ),
      GetPage(
        name: PagesNames.preLogin,
        page: () => const PreLoginScreen(),
      ),
      GetPage(
        name: PagesNames.loginOptions,
        page: () => const LoginOptionsScreen(),
      ),
      GetPage(
          name: PagesNames.login,
          page: () => LoginScreen(),
          middlewares: [LoginMiddleware()]),
      GetPage(
          name: PagesNames.reserveAssurence,
          page: () => ReservationAssurrenceScreen(),
          middlewares: [LoginMiddleware()]),
      GetPage(
          name: PagesNames.patientAppiontments,
          page: () => const PatientAppointmentsScreen(),
          middlewares: [LoginMiddleware()]),
      GetPage(
        name: PagesNames.registration,
        page: () => const RegistrationScreen(),
      ),
    ],
  ));
}
