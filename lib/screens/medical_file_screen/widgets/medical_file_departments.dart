import 'package:flutter/material.dart';
import 'package:his_project/screens/medical_file_screen/widgets/medical_file_department.dart';

class MedicalFileDepartments extends StatelessWidget {
  const MedicalFileDepartments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: "appointmentsList",
              depIcon: 'assets/images/appointments_icon.png',
            ),
            MedicalFileDepartment(
              depName: "labAnalysisResults",
              depIcon: 'assets/images/lab_icon.png',
            ),
            MedicalFileDepartment(
              depName: "xrays",
              depIcon: 'assets/images/xray_icon.png',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: "prescriptions",
              depIcon: 'assets/images/prescriptions_icon.png',
            ),
            MedicalFileDepartment(
              depName: "vitalSigns",
              depIcon: 'assets/images/vital_signs_icon.png',
            ),
            MedicalFileDepartment(
              depName: "drugs",
              depIcon: 'assets/images/drugs_icon.png',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: "doctorsVisited",
              depIcon: 'assets/images/doctor_icon.png',
            ),
            MedicalFileDepartment(
              depName: "invoices",
              depIcon: 'assets/images/invoices_icon.png',
            ),
            MedicalFileDepartment(
              depName: "orders",
              depIcon: 'assets/images/orders_icon.png',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: "eyeTest",
              depIcon: 'assets/images/eye_test_icon.png',
            ),
            MedicalFileDepartment(
              depName: "insuranceCards",
              depIcon: 'assets/images/insurance_cards_icon.png',
            ),
            MedicalFileDepartment(
              depName: "insuranceUpdates",
              depIcon: 'assets/images/insurance_updates_icon.png',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: "insuranceApprovals",
              depIcon: 'assets/images/insurance_approvals_icon.png',
            ),
            MedicalFileDepartment(
              depName: "allergies",
              depIcon: 'assets/images/allergies_icon.png',
            ),
            MedicalFileDepartment(
              depName: "immunization",
              depIcon: 'assets/images/vaccinates_icon.png',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: "medicalReports",
              depIcon: 'assets/images/medical_reports_icon.png',
            ),
            MedicalFileDepartment(
              depName: "monthlyReports",
              depIcon: 'assets/images/monthly_reports_icon.png',
            ),
            MedicalFileDepartment(
              depName: "sickLeaves",
              depIcon: 'assets/images/sick_leaves_icon.png',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: "walletBalance",
              depIcon: 'assets/images/wallet_balance_icon.png',
            ),
            MedicalFileDepartment(
              depName: "medicalReading",
              depIcon: 'assets/images/medical_readings_icon.png',
            ),
            MedicalFileDepartment(
              depName: "smartWatch",
              depIcon: 'assets/images/smart_watch_icon.png',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: "askDoctor",
              depIcon: 'assets/images/ask_doctor_icon.png',
            ),
            MedicalFileDepartment(
              depName: "internetConnection",
              depIcon: 'assets/images/wifi_icon.png',
            ),
            MedicalFileDepartment(
              depName: "chatBot",
              depIcon: 'assets/images/chatbot_icon.png',
            ),
          ],
        ),
      ],
    ); 
  }
}
