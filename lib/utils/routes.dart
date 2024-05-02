import 'package:get/get.dart';
import 'package:his_project/screens/all_e_services_screen/view/all_e_services_screen.dart';
import 'package:his_project/screens/ask_login_screen/view/ask_login_screen.dart';
import 'package:his_project/screens/doctor_screen/binding/doctor_screen_binding.dart';
import 'package:his_project/screens/doctor_screen/view/doctor_screen.dart';
import 'package:his_project/screens/doctors_list_screen/view/doctors_list_screen.dart';
import 'package:his_project/screens/emergency_screen/view/emergency_screen.dart';
import 'package:his_project/screens/languages_screen/view/languages_screen.dart';
import 'package:his_project/screens/login_options_screen/view/login_options_screen.dart';
import 'package:his_project/screens/login_screen/binding/login_screen_binding.dart';
import 'package:his_project/screens/login_screen/middleware/login_middleware.dart';
import 'package:his_project/screens/login_screen/view/login_screen.dart';
import 'package:his_project/screens/main_screen/binding/main_screen_binding.dart';
import 'package:his_project/screens/main_screen/view/main_screen.dart';
import 'package:his_project/screens/medical_test_screen/view/medical_test_screen.dart';
import 'package:his_project/screens/patient_appointments_screen/binding/patient_appointment_screen_binding.dart';
import 'package:his_project/screens/patient_appointments_screen/view/patient_appointments_screen.dart';
import 'package:his_project/screens/pre_login_screen/view/pre_login_screen.dart';
import 'package:his_project/screens/registration_screen/view/registration_screen.dart';
import 'package:his_project/screens/reservation_confirmation_screen/binding/reservation_confirmation_screen_binding.dart';
import 'package:his_project/screens/reservation_confirmation_screen/view/reservation_confirmation_screen.dart';
import 'package:his_project/screens/reserve_appoinment_screen/binding/reserve_appointment_screen_binding.dart';
import 'package:his_project/screens/reserve_appoinment_screen/view/reserve_appoinment_screen.dart';
import 'package:his_project/screens/splash_screen/view/splash_screen.dart';
import 'package:his_project/utils/pages_names.dart';

List<GetPage> routes = [
  GetPage(
    name: PagesNames.root,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: PagesNames.main,
    page: () => const MainScreen(),
    binding: MainScreenBinding(),
  ),
  GetPage(
    name: PagesNames.reserveAppointment,
    page: () => const ReserveAppointmentScreen(),
    binding: ReserveAppointmentScreenBinding(),
  ),
  GetPage(
    name: PagesNames.doctorsList,
    page: () => const DocotrsListScreen(),
  ),
  GetPage(
    name: PagesNames.doctorInfo,
    page: () => const DoctorInfoScreen(),
    binding: DoctorScreenBinding(),
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
      binding: LoginScreenBinding(),
      middlewares: [LoginMiddleware()]),
  GetPage(
    name: PagesNames.confirmReservation,
    page: () => ReservationConfirmationScreen(),
    binding: ReservationConfirmationScreenBinding(),
  ),
  GetPage(
    name: PagesNames.appiontmentsList,
    page: () => const PatientAppointmentsScreen(),
    binding: PatientAppointmentsScreenBinding(),
  ),
  GetPage(
    name: PagesNames.registration,
    page: () => RegistrationScreen(),
  ),
  GetPage(
    name: PagesNames.medicalAnalyisResults,
    page: () => const MedicalTestScreen(),
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
    name: PagesNames.emergency,
    page: () => const EmergencyScreen(),
  ),
  GetPage(
    name: PagesNames.askLoginScreen,
    page: () => const AskLoginScreen(),
  ),
];
