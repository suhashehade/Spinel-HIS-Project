import 'package:flutter/widgets.dart';
import 'package:his_project/models/medical_result/cbc_result.dart';
import 'package:his_project/models/medical_result/pathology_result.dart';
import 'package:his_project/models/service.dart';
import 'package:his_project/screens/family_medical_file_screen/view/family_medical_file_screen.dart';
import 'package:his_project/screens/help_screen/view/help_screen.dart';
import 'package:his_project/screens/home_screen/view/home_screen.dart';
import 'package:his_project/screens/medical_file_screen/view/medical_file_screen.dart';
import 'package:his_project/screens/tasks_screen/view/tasks_screen.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:intl/intl.dart';

class Lists {
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

  static List<Widget> starsList = [
    ConstAssets.starIcon,
    ConstAssets.starIcon,
    ConstAssets.starIcon,
    ConstAssets.starIcon,
    ConstAssets.starIcon
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
      serviceIcon: ConstAssets.reserveAppointmentIcon,
    ),
    Service(
      serviceName: ConstRes.lifeCare,
      serviceIcon: ConstAssets.lifeCareIcon,
    ),
    Service(
      serviceName: ConstRes.emergency,
      serviceIcon: ConstAssets.ambulanceIcon,
    ),
    Service(
      serviceName: ConstRes.homeCare,
      serviceIcon: ConstAssets.homeCareIcon,
    ),
    Service(
      serviceName: ConstRes.comprehensiveExamination,
      serviceIcon: ConstAssets.comprehensiveExaminationIcon,
    ),
    Service(
      serviceName: ConstRes.pharmacy,
      serviceIcon: ConstAssets.pharmacyIcon,
    ),
    Service(
      serviceName: ConstRes.fileDetails,
      serviceIcon: ConstAssets.fileDetailsIcon,
    ),
    Service(
      serviceName: ConstRes.familyFiles,
      serviceIcon: ConstAssets.familyFilesIcon,
    ),
    Service(
      serviceName: ConstRes.payment,
      serviceIcon: ConstAssets.visaIcon,
    ),
    Service(
      serviceName: ConstRes.childrenVaccine,
      serviceIcon: ConstAssets.childrenVaccineIcon,
    ),
    Service(
      serviceName: ConstRes.insuranceUpdate,
      serviceIcon: ConstAssets.cardIcon,
    ),
    Service(
      serviceName: ConstRes.assignments,
      serviceIcon: ConstAssets.assignmentsIcon,
    ),
    Service(
      serviceName: ConstRes.waterConsume,
      serviceIcon: ConstAssets.waterIcon,
    ),
    Service(
      serviceName: ConstRes.calculator,
      serviceIcon: ConstAssets.calculatorIcon,
    ),
    Service(
      serviceName: ConstRes.transformMesurments,
      serviceIcon: ConstAssets.twoWaysArrows,
    ),
    Service(
      serviceName: ConstRes.tasks,
      serviceIcon: ConstAssets.tasksIcon,
    ),
    Service(
      serviceName: ConstRes.bloodDonation,
      serviceIcon: ConstAssets.bloodIcon,
    ),
    Service(
      serviceName: ConstRes.covid19,
      serviceIcon: ConstAssets.covid19Icon,
    ),
    Service(
      serviceName: ConstRes.virtualTour,
      serviceIcon: ConstAssets.view360Icon,
    ),
    Service(
      serviceName: ConstRes.smartWatches,
      serviceIcon: ConstAssets.smartWatchIcon,
    ),
    Service(
      serviceName: ConstRes.parking,
      serviceIcon: ConstAssets.parkingIcon,
    ),
    Service(
      serviceName: ConstRes.news,
      serviceIcon: ConstAssets.microphoneIcon,
    ),
    Service(
      serviceName: ConstRes.contactUs,
      serviceIcon: ConstAssets.contactUsIcon,
    ),
  ];

  static List<Service> medicalServiceList = [
    Service(
      serviceName: ConstRes.appointmentsList,
      serviceIcon: ConstAssets.appointmentIcon,
    ),
    Service(
      serviceName: ConstRes.medicalAnalyisResults,
      serviceIcon: ConstAssets.labIcon,
    ),
    Service(
      serviceName: ConstRes.xrays,
      serviceIcon: ConstAssets.xrayIcon,
    ),
    Service(
      serviceName: ConstRes.prescriptions,
      serviceIcon: ConstAssets.prescriptionsIcon,
    ),
    Service(
      serviceName: ConstRes.vitalSigns,
      serviceIcon: ConstAssets.vitalSignsIcon,
    ),
    Service(
      serviceName: ConstRes.drugs,
      serviceIcon: ConstAssets.drugsIcon,
    ),
    Service(
      serviceName: ConstRes.doctorsVisited,
      serviceIcon: ConstAssets.doctorIcon,
    ),
    Service(
      serviceName: ConstRes.invoices,
      serviceIcon: ConstAssets.invoicesIcon,
    ),
    Service(
      serviceName: ConstRes.orders,
      serviceIcon: ConstAssets.orderIcon,
    ),
    Service(
      serviceName: ConstRes.eyeTest,
      serviceIcon: ConstAssets.eyeTestIcon,
    ),
    Service(
      serviceName: ConstRes.insuranceCards,
      serviceIcon: ConstAssets.insuranceCardsIcon,
    ),
    Service(
      serviceName: ConstRes.insuranceUpdates,
      serviceIcon: ConstAssets.insuranceUpdatesIcon,
    ),
    Service(
      serviceName: ConstRes.insuranceApprovals,
      serviceIcon: ConstAssets.insuranceApprovalsIcon,
    ),
    Service(
      serviceName: ConstRes.allergies,
      serviceIcon: ConstAssets.allergiesIcon,
    ),
    Service(
      serviceName: ConstRes.immunization,
      serviceIcon: ConstAssets.immunizationIcon,
    ),
    Service(
      serviceName: ConstRes.medicalReports,
      serviceIcon: ConstAssets.medicalReportsIcon,
    ),
    Service(
      serviceName: ConstRes.monthlyReports,
      serviceIcon: ConstAssets.monthlyReportsIcon,
    ),
    Service(
      serviceName: ConstRes.sickLeaves,
      serviceIcon: ConstAssets.sickLeavesIcon,
    ),
    Service(
      serviceName: ConstRes.walletBalance,
      serviceIcon: ConstAssets.walletBalanceIcon,
    ),
    Service(
      serviceName: ConstRes.medicalReading,
      serviceIcon: ConstAssets.medicalReadingIcon,
    ),
    Service(
      serviceName: ConstRes.smartWatch,
      serviceIcon: ConstAssets.smartWatchIcon,
    ),
    Service(
      serviceName: ConstRes.askDoctor,
      serviceIcon: ConstAssets.doctorIcon,
    ),
    Service(
      serviceName: ConstRes.internetConnection,
      serviceIcon: ConstAssets.wifiIcon,
    ),
    Service(
      serviceName: ConstRes.chatBot,
      serviceIcon: ConstAssets.chatbotIcon,
    ),
  ];

  static List<Service> emergencyServicesList = [
    Service(
      serviceName: ConstRes.askAmbulance,
      serviceIcon: ConstAssets.ambulanceIcon,
    ),
    Service(
      serviceName: ConstRes.closestEmergencyLocation,
      serviceIcon: ConstAssets.sirenIcon,
    ),
    Service(
      serviceName: ConstRes.fastResponseTeam,
      serviceIcon: ConstAssets.fastResponseTeamIcon,
    ),
    Service(
      serviceName: ConstRes.ourLocation,
      serviceIcon: ConstAssets.locationIcon,
    ),
    Service(
      serviceName: ConstRes.yourOpinion,
      serviceIcon: ConstAssets.opinionIcon,
    ),
    Service(
      serviceName: ConstRes.chat,
      serviceIcon: ConstAssets.chatIcon,
    ),
  ];
}
