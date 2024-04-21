import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:his_project/models/medical_result/cbc_result.dart';
import 'package:his_project/models/medical_result/pathology_result.dart';
import 'package:his_project/models/service.dart';
import 'package:his_project/screens/family_medical_file_screen/family_medical_file_screen.dart';
import 'package:his_project/screens/help_screen/help_screen.dart';
import 'package:his_project/screens/home_screen/home_screen.dart';
import 'package:his_project/screens/medical_file_screen/medical_file_screen.dart';
import 'package:his_project/screens/tasks_screen/tasks_screen.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:intl/intl.dart';

class ConstRes {
  /* --------------- MAIN ----------------- */
  static String base = 'http://192.236.146.134:9000';
  static String baseUrl = '$base/api';
  static String languageCode =
      PrefsService.to.getString('lang') ?? Get.locale?.languageCode ?? 'en';
  static String timePattern1 = 'HH:mm a';
  static String timePattern2 = "HH:mm";
  static String lastDay = "2030-06-06T00:00:00";
  static List<Widget> pages = [
    const MedicalFileScreen(),
    const FamilyMedicalFileScreen(),
    const HomeScreen(),
    const TasksScreen(),
    const HelpScreen(),
  ];
  static List mediaclTestTypes = [
    "lab",
    "pathology",
    "genetics",
    "microbiology"
  ];
  static List<CBCResult> cbcResultsList = [
    CBCResult("WBCs", "l40", "mmh/sa", ">18"),
    CBCResult("NEUTROPHILS", "ul6", "x10^3", "2 - 6.9"),
    CBCResult("LYMPHOCYTES", "ul3", "x10^3", "4 - 0.6"),
    CBCResult("MONOCYTES", "ul0.8", "x10^3", "<0.9"),
    CBCResult("MONO%", "5%", "", "1 - 6"),
    CBCResult("EOSINOPHILS", "ul0.3", "x10^3", "<0.5"),
    CBCResult("EO%", "4%", "", "5 - 0"),
    CBCResult("BASOPHILS", "ul0.1", "x10^3", "<0.2"),
  ];

  static List<PathologyTest> pathologyList = [
    PathologyTest(
      doctorName: "Israr Assi",
      testName: "CBC",
      departmentName: "Nutrition and dietecs",
      date: DateFormat.yMMMMd().format(DateTime.now()),
      status: true,
    ),
    PathologyTest(
      doctorName: "Israr Assi",
      testName: "CBC",
      departmentName: "Nutrition and dietecs",
      date: DateFormat.yMMMMd().format(DateTime.now()),
      status: true,
    ),
    PathologyTest(
      doctorName: "Israr Assi",
      testName: "CBC",
      departmentName: "Nutrition and dietecs",
      date: DateFormat.yMMMMd().format(DateTime.now()),
      status: true,
    ),
  ];

  static List<Service> servicesList = [
    Service(
      serviceName: ConstRes.reserveAppointment,
      serviceIcon: ConstRes.reserveAppointmentIcon,
    ),
    Service(
      serviceName: ConstRes.lifeCare,
      serviceIcon: ConstRes.lifeCareIcon,
    ),
    Service(
      serviceName: ConstRes.emergency,
      serviceIcon: ConstRes.emergencyIcon,
    ),
    Service(
      serviceName: ConstRes.homeCare,
      serviceIcon: ConstRes.homeCareIcon,
    ),
    Service(
      serviceName: ConstRes.comprehensiveExamination,
      serviceIcon: ConstRes.comprehensiveExaminationIcon,
    ),
    Service(
      serviceName: ConstRes.pharmacy,
      serviceIcon: ConstRes.pharmacyIcon,
    ),
    Service(
      serviceName: ConstRes.fileDetails,
      serviceIcon: ConstRes.fileDetailsIcon,
    ),
    Service(
      serviceName: ConstRes.familyFiles,
      serviceIcon: ConstRes.familyFilesIcon,
    ),
    Service(
      serviceName: ConstRes.payment,
      serviceIcon: ConstRes.visaIcon,
    ),
    Service(
      serviceName: ConstRes.childrenVaccine,
      serviceIcon: ConstRes.childrenVaccineIcon,
    ),
    Service(
      serviceName: ConstRes.insuranceUpdate,
      serviceIcon: ConstRes.cardIcon,
    ),
    Service(
      serviceName: ConstRes.assignments,
      serviceIcon: ConstRes.assignmentsIcon,
    ),
    Service(
      serviceName: ConstRes.waterConsume,
      serviceIcon: ConstRes.waterIcon,
    ),
    Service(
      serviceName: ConstRes.calculator,
      serviceIcon: ConstRes.calculatorIcon,
    ),
    Service(
      serviceName: ConstRes.transformMesurments,
      serviceIcon: ConstRes.twoWaysArrows,
    ),
    Service(
      serviceName: ConstRes.tasks,
      serviceIcon: ConstRes.tasksIcon,
    ),
    Service(
      serviceName: ConstRes.bloodDonation,
      serviceIcon: ConstRes.bloodIcon,
    ),
    Service(
      serviceName: ConstRes.covid19,
      serviceIcon: ConstRes.covid19Icon,
    ),
    Service(
      serviceName: ConstRes.virtualTour,
      serviceIcon: ConstRes.view360Icon,
    ),
    Service(
      serviceName: ConstRes.smartWatches,
      serviceIcon: ConstRes.smartWatchIcon,
    ),
    Service(
      serviceName: ConstRes.parking,
      serviceIcon: ConstRes.parkingIcon,
    ),
    Service(
      serviceName: ConstRes.news,
      serviceIcon: ConstRes.microphoneIcon,
    ),
    Service(
      serviceName: ConstRes.contactUs,
      serviceIcon: ConstRes.contactUsIcon,
    ),
  ];

  static List<Service> medicalServiceList = [
    Service(
      serviceName: ConstRes.appointmentsList,
      serviceIcon: ConstRes.appointmentIcon,
    ),
    Service(
      serviceName: ConstRes.medicalAnalyisResults,
      serviceIcon: ConstRes.labIcon,
    ),
    Service(
      serviceName: ConstRes.xrays,
      serviceIcon: ConstRes.xrayIcon,
    ),
    Service(
      serviceName: ConstRes.prescriptions,
      serviceIcon: ConstRes.prescriptionsIcon,
    ),
    Service(
      serviceName: ConstRes.vitalSigns,
      serviceIcon: ConstRes.vitalSignsIcon,
    ),
    Service(
      serviceName: ConstRes.drugs,
      serviceIcon: ConstRes.drugsIcon,
    ),
    Service(
      serviceName: ConstRes.doctorsVisited,
      serviceIcon: ConstRes.doctorIcon,
    ),
    Service(
      serviceName: ConstRes.invoices,
      serviceIcon: ConstRes.invoicesIcon,
    ),
    Service(
      serviceName: ConstRes.orders,
      serviceIcon: ConstRes.orderIcon,
    ),
    Service(
      serviceName: ConstRes.eyeTest,
      serviceIcon: ConstRes.eyeTestIcon,
    ),
    Service(
      serviceName: ConstRes.insuranceCards,
      serviceIcon: ConstRes.insuranceCardsIcon,
    ),
    Service(
      serviceName: ConstRes.insuranceUpdates,
      serviceIcon: ConstRes.insuranceUpdatesIcon,
    ),
    Service(
      serviceName: ConstRes.insuranceApprovals,
      serviceIcon: ConstRes.insuranceApprovalsIcon,
    ),
    Service(
      serviceName: ConstRes.allergies,
      serviceIcon: ConstRes.allergiesIcon,
    ),
    Service(
      serviceName: ConstRes.immunization,
      serviceIcon: ConstRes.immunizationIcon,
    ),
    Service(
      serviceName: ConstRes.medicalReports,
      serviceIcon: ConstRes.medicalReportsIcon,
    ),
    Service(
      serviceName: ConstRes.monthlyReports,
      serviceIcon: ConstRes.monthlyReportsIcon,
    ),
    Service(
      serviceName: ConstRes.sickLeaves,
      serviceIcon: ConstRes.sickLeavesIcon,
    ),
    Service(
      serviceName: ConstRes.walletBalance,
      serviceIcon: ConstRes.walletBalanceIcon,
    ),
    Service(
      serviceName: ConstRes.medicalReading,
      serviceIcon: ConstRes.medicalReadingIcon,
    ),
    Service(
      serviceName: ConstRes.smartWatch,
      serviceIcon: ConstRes.smartWatchIcon,
    ),
    Service(
      serviceName: ConstRes.askDoctor,
      serviceIcon: ConstRes.doctorIcon,
    ),
    Service(
      serviceName: ConstRes.internetConnection,
      serviceIcon: ConstRes.wifiIcon,
    ),
    Service(
      serviceName: ConstRes.chatBot,
      serviceIcon: ConstRes.chatbotIcon,
    ),
  ];

  static List<Service> emergencyServicesList = [
    Service(
      serviceName: ConstRes.askAmbulance,
      serviceIcon: ConstRes.ambulanceIcon,
    ),
    Service(
      serviceName: ConstRes.closestEmergencyLocation,
      serviceIcon: ConstRes.amplifireicon,
    ),
    Service(
      serviceName: ConstRes.fastResponseTeam,
      serviceIcon: ConstRes.fastResponseTeamIcon,
    ),
    Service(
      serviceName: ConstRes.ourLocation,
      serviceIcon: ConstRes.locationIcon,
    ),
    Service(
      serviceName: ConstRes.yourOpinion,
      serviceIcon: ConstRes.opinionIcon,
    ),
    Service(
      serviceName: ConstRes.chat,
      serviceIcon: ConstRes.chatIcon,
    ),
  ];

/* ----------------- IMAGES/ ICONS URL ------------------ */

  static String companyLogo = "assets/images/spinel_logo.png";
  static String notificationIcon = "assets/images/notification_icon.png";
  static String homeCallToAcationIcon = "assets/images/call_to_action_icon.png";
  static String reserveAppointmentIcon =
      "assets/images/reserve_appointment_icon.png";
  static String ambulanceIcon = "assets/images/amblance_icon.png";
  static String amplifireicon = "assets/images/amplifire_icon.png";
  static String fastResponseTeamIcon = "assets/images/fast_response_icon.png";
  static String locationIcon = "assets/images/location_icon.png";
  static String opinionIcon = "assets/images/opinion_icon.png";
  static String chatIcon = "assets/images/chat_icon.png";
  static String reserveBtnIcon = "assets/images/reserve_btn_icon.png";
  static String lifeCareIcon = "assets/images/life_care_icon.png";
  static String emergencyIcon = "assets/images/emergency_icon.png";
  static String paymentIcon = "assets/images/payment_icon.png";
  static String homeCareIcon = "assets/images/home_care_icon.png";
  static String contactUsIcon = "assets/images/contact_icon.png";
  static String comprehensiveExaminationIcon =
      "assets/images/full_check_icon.png";
  static String mainServiceIcon = "assets/images/main_service_icon.png";
  static String clinicImageIcon = "assets/images/Vector.svg";
  static String doctorIcon = 'assets/images/ask_doctor_icon.png';
  static String logoIcon = "assets/images/app_logo.png";
  static String appointmentIcon = 'assets/images/appointments_icon.png';
  static String labIcon = 'assets/images/lab_icon.png';
  static String xrayIcon = 'assets/images/xray_icon.png';
  static String prescriptionsIcon = 'assets/images/prescriptions_icon.png';
  static String vitalSignsIcon = 'assets/images/vital_signs_icon.png';
  static String drugsIcon = 'assets/images/drugs_icon.png';
  static String invoicesIcon = 'assets/images/invoices_icon.png';
  static String orderIcon = 'assets/images/orders_icon.png';
  static String eyeTestIcon = 'assets/images/eye_test_icon.png';
  static String insuranceCardsIcon = 'assets/images/insurance_cards_icon.png';
  static String insuranceUpdatesIcon =
      'assets/images/insurance_updates_icon.png';
  static String insuranceApprovalsIcon =
      'assets/images/insurance_approvals_icon.png';
  static String allergiesIcon = 'assets/images/allergies_icon.png';
  static String immunizationIcon = 'assets/images/vaccinates_icon.png';
  static String medicalReportsIcon = 'assets/images/medical_reports_icon.png';
  static String monthlyReportsIcon = 'assets/images/monthly_reports_icon.png';
  static String sickLeavesIcon = 'assets/images/sick_leaves_icon.png';
  static String walletBalanceIcon = 'assets/images/wallet_balance_icon.png';
  static String medicalReadingIcon = 'assets/images/medical_readings_icon.png';
  static String smartWatchIcon = 'assets/images/smart_watch_icon.png';
  static String wifiIcon = 'assets/images/wifi_icon.png';
  static String chatbotIcon = 'assets/images/chatbot_icon.png';
  static String loginProcess = "assets/images/login_process_icon.png";
  static String weatherIcon =
      "assets/images/fluent--weather-partly-cloudy-day-20-regular.png";
  static String visaIcon = "assets/images/mage--visa-square.png";
  static String pharmacyIcon =
      "assets/images/healthicons--pharmacy-negative.png";
  static String fileDetailsIcon = "assets/images/uil--folder-medical.png";
  static String familyFilesIcon = "assets/images/noto-v1--family.png";
  static String childrenVaccineIcon = "assets/images/vaccinates_icon.png";
  static String cardIcon = "assets/images/noto--identification-card.png";
  static String assignmentsIcon =
      "assets/images/material-symbols--assignment-return.png";
  static String waterIcon = "assets/images/ion--water.png";
  static String calculatorIcon = "assets/images/mdi--calculator.png";
  static String twoWaysArrows =
      "assets/images/clarity--two-way-arrows-line.png";
  static String tasksIcon = "assets/images/fluent--tasks-app-20-filled.png";
  static String bloodIcon = "assets/images/twemoji--drop-of-blood.png";
  static String covid19Icon = "assets/images/covid--covid19-virus-1.png";
  static String view360Icon = "assets/images/iconoir--view-360.png";
  static String parkingIcon = "assets/images/icon-park-outline--parking.png";
  static String microphoneIcon = "assets/images/twemoji--studio-microphone.png";
  static String arrowDownward = "assets/images/arrow_downward.png";
  static String arrowUpward = "assets/images/arrow_upward.png";

  /* ---------------- STATIC ----------------- */

  static String appName = "Doctor.io";
  static String tasks = 'tasks';
  static String reserveAppointment = "reserveAppointment";
  static String clinic = "clinic";
  static String doctor = "doctor";
  static String branch = "branch";
  static String home = "home";
  static String help = "help";
  static String date = 'date';
  static String fromTime = 'fromTime';
  static String toTime = 'toTime';
  static String agree = 'agree';
  static String confirmation = "confirmation";
  static String register = "register";
  static String login = "login";
  static String enterDetails = "enterDetails";
  static String referenceInfo = "referenecInfo";
  static String otherDetails = "otherDetails";
  static String countryName = 'countryName';
  static String nationalId = 'nationalId';
  static String phone = 'phone';
  static String dob = 'dob';
  static String cancel = "cancel";
  static String yes = "yes";
  static String no = "no";
  static String myAppointments = "myAppointments";
  static String medicalFile = "medicalFile";
  static String appointmentsList = "appointmentsList";
  static String medicalAnalyisResults = "medicalAnalyisResults";
  static String xrays = "xrays";
  static String prescriptions = "prescriptions";
  static String vitalSigns = "vitalSigns";
  static String drugs = "drugs";
  static String doctorsVisited = "doctorsVisited";
  static String payment = "payment";
  static String homeCare = "homeCare";
  static String contactUs = "contactUs";
  static String lifeCare = "lifeCare";
  static String comprehensiveExamination = "comprehensiveExamination";
  static String allAppointments = "allAppointments";
  static String invoices = "invoices";
  static String orders = "orders";
  static String eyeTest = "eyeTest";
  static String insuranceCards = "insuranceCards";
  static String insuranceUpdates = "insuranceUpdates";
  static String insuranceApprovals = "insuranceApprovals";
  static String allergies = "allergies";
  static String immunization = "immunization";
  static String medicalReports = "medicalReports";
  static String monthlyReports = "monthlyReports";
  static String sickLeaves = "sickLeaves";
  static String walletBalance = "walletBalance";
  static String medicalReading = "medicalReading";
  static String smartWatch = "smartWatch";
  static String askDoctor = "askDoctor";
  static String internetConnection = "internetConnection";
  static String chatBot = "chatBot";
  static String callToAction = "callToAction";
  static String schedule = 'schedule';
  static String welcome = "welcome";
  static String patientApp = "patientApp";
  static String loginIdSentence = "loginIdSentence";
  static String loginMRNSentence = "loginMRNSentence";
  static String mrn = 'mrn';
  static String password = 'password';
  static String rememberMe = "rememberMe";
  static String forgetPass = "forgetPass";
  static String notAuthorized = 'Not Authorized';
  static String authorized = 'Authorized';
  static String authenticating = 'Authenticating';
  static String biometrics = 'Perform Biometrics';
  static String authError = "Error -";
  static String optionSentence = "optionSentence";
  static String arabicAr = "عربي";
  static String englishEn = "English";
  static String eServices = "eServices";
  static String showAllServices = "showAllServices";
  static String emergencyServices = "emergencyServices";
  static String mainServicesCallToAction = "mainServicesCallToAction";
  static String myMedicalFile = "myMedicalFile";
  static String askAmbulance = "askAmbulance";
  static String emergency = "emergency";
  static String closestEmergencyLocation = "closestEmergencyLocation";
  static String chat = "chat";
  static String yourOpinion = "yourOpinion";
  static String ourLocation = "ourLocation";
  static String fastResponseTeam = "fastResponseTeam";
  static String doctorInfo = "doctorInfo";
  static String availableAppointments = "availableAppointments";
  static String fail = "Fail";
  static String gender = 'gender';
  static String nationality = "nationality";
  static String details = "details";
  static String description = 'description';
  static String appointmentDetails = "appointmentDetails";
  static String patient = 'patient';
  static String reason = 'reason';
  static String status = 'status';
  static String notes = 'notes';
  static String weatherSentence = "weatherSentence";
  static String weatherMesurments = "weatherMesurments";
  static String weatherDash = "--";
  static String pharmacy = "pharmacy";
  static String fileDetails = "fileDetails";
  static String familyFiles = "familyFiles";
  static String familyFile = "familyFile";
  static String childrenVaccine = "childrenVaccine";
  static String insuranceUpdate = "insuranceUpdate";
  static String assignments = "assignments";
  static String waterConsume = "waterConsume";
  static String calculator = "calculator";
  static String transformMesurments = "transformMesurments";
  static String bloodDonation = "bloodDonation";
  static String covid19 = "covid19";
  static String virtualTour = "virtualTour";
  static String smartWatches = "smartWatches";
  static String parking = "parking";
  static String news = "news";
  static String language = 'language';
  static String logout = 'logout';
  static String search = 'search';
  static String preLoginSentence = "preLoginSentence";
  static String cbcResults = "cbcResults";
  static String generalResults = "generalResults";
  static String pathology = "pathology";
  static String newOrder = "newOrder";
  static String prevOrder = "prevOrder";
  static String test = "testName";
  static String approved = "Approved";
  static String notApproved = "Not Approved";

  /* ------------------- KEYS ------------------------ */

  static String afterLoginKey = "afterLogin";
  static String langkey = 'lang';
  static String labelKey = 'label';
  static String nameKey = 'name';
  static String tokenKey = "token";
  static String reserveArgsKey = 'reserveArgs';
  static String statusNameKey = 'statusName';
  static String phoneKey = "phone";
  static String idKey = 'id';
  static String idNumberKey = 'idNumber';
  static String lstErrorKey = 'lstError';
  static String nationalIdkey = 'nationalId';
  static String passwordKey = 'Password';
  static String phone1Key = 'phone1';
  static String optionkey = "option";
  static String arKey = 'ar';
  static String enKey = 'en';
  static String patientNameKey = 'patientName';
  static String doctorNameKey = 'doctorName';
  static String departmentNameKey = 'departmentName';
  static String branchNameKey = 'branchName';
  static String reasonNameKey = 'reasonName';

  /* ------------------- MESSAGES ------------------- */

  static String noEventsMessage = "toDayEvent";
  static String choosetimeErrorMessage = "noTimePickedError";
  static String noAvailableAppointmentsError = 'noAvailableAppointments';
  static String passwordLengthError = "passwordLengthError";
  static String userNameLengthError = "userNameLengthError";
  static String nationalIdError = "phoneRequiredError";
  static String emptyFieldsError = "feildsFilledError";
  static String noDoctorMessage = "noDoctors";
  static String noClinicsMessage = "noClinics";
  static String noBranches = "noBranches";
}
