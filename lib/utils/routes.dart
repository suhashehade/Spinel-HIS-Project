import 'package:get/get.dart';
import 'package:his_project/screens/all_e_services_screen/all_e_services_screen.dart';
import 'package:his_project/screens/doctors_list_screen/doctors_list_screen.dart';
import 'package:his_project/screens/languages_screen/languages_screen.dart';
import 'package:his_project/screens/login_options_screen/login_options_screen.dart';
import 'package:his_project/screens/login_screen/login_middleware.dart';
import 'package:his_project/screens/login_screen/login_screen.dart';
import 'package:his_project/screens/main_screen/main_screen.dart';
import 'package:his_project/screens/medical_file_screen/medical_file_screen.dart';
import 'package:his_project/screens/patient_appointments_screen/patient_appointments_screen.dart';
import 'package:his_project/screens/pre_login_screen/pre_login_screen.dart';
import 'package:his_project/screens/registration_screen/registration_screen.dart';
import 'package:his_project/screens/reservation_confirmation_screen/reservation_confirmation_screen.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen.dart';
import 'package:his_project/utils/pages_names.dart';

List<GetPage> routes = [
  GetPage(
    name: PagesNames.root,
    page: () => const MainScreen(),
  ),
  GetPage(
    name: PagesNames.reserveAppointment,
    page: () => const ReserveAppointmentScreen(),
  ),
  GetPage(
    name: PagesNames.doctorsList,
    page: () => const DocotrsListScreen(),
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
      page: () => ReservationConfirmationScreen(),
      middlewares: [LoginMiddleware()]),
  GetPage(
      name: PagesNames.patientAppiontments,
      page: () => const PatientAppointmentsScreen(),
      middlewares: [LoginMiddleware()]),
  GetPage(
    name: PagesNames.registration,
    page: () => RegistrationScreen(),
  ),
  GetPage(
    name: PagesNames.allEServices,
    page: () => const AllEServicesScreen(),
  ),
  GetPage(
    name: PagesNames.languagesScreen,
    page: () => const LanguagesScreen(),
  ),
  GetPage(
    name: PagesNames.medicalFile1,
    page: () => const MedicalFileScreen(),
    middlewares: [LoginMiddleware()],
  ),
];
