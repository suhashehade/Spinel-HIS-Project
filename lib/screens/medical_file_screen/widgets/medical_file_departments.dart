import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/medical_file_screen/medical_file_screen_controller.dart';
import 'package:his_project/screens/medical_file_screen/widgets/medical_file_department.dart';
import 'package:his_project/utils/consts_res.dart';

class MedicalFileDepartments extends StatelessWidget {
  const MedicalFileDepartments({super.key});

  @override
  Widget build(BuildContext context) {
    MedicalFileScreenController medicalFileScreenController =
        Get.put(MedicalFileScreenController());
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: ConstRes.appointmentsList,
              depIcon: ConstRes.appointmentIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.medicalAnalyisResults,
              depIcon: ConstRes.labIcon,
              handleClick: medicalFileScreenController.toMedicalLabResult,
            ),
            MedicalFileDepartment(
              depName: ConstRes.xrays,
              depIcon: ConstRes.xrayIcon,
              handleClick: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: ConstRes.prescriptions,
              depIcon: ConstRes.prescriptionsIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.vitalSigns,
              depIcon: ConstRes.vitalSignsIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.drugs,
              depIcon: ConstRes.drugsIcon,
              handleClick: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: ConstRes.doctorsVisited,
              depIcon: ConstRes.doctorIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.invoices,
              depIcon: ConstRes.invoicesIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.orders,
              depIcon: ConstRes.orderIcon,
              handleClick: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: ConstRes.eyeTest,
              depIcon: ConstRes.eyeTestIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.insuranceCards,
              depIcon: ConstRes.insuranceCardsIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.insuranceUpdates,
              depIcon: ConstRes.insuranceUpdatesIcon,
              handleClick: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: ConstRes.insuranceApprovals,
              depIcon: ConstRes.insuranceApprovalsIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.allergies,
              depIcon: ConstRes.allergiesIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.immunization,
              depIcon: ConstRes.immunizationIcon,
              handleClick: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: ConstRes.medicalReports,
              depIcon: ConstRes.medicalReportsIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.monthlyReports,
              depIcon: ConstRes.monthlyReportsIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.sickLeaves,
              depIcon: ConstRes.sickLeavesIcon,
              handleClick: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: ConstRes.walletBalance,
              depIcon: ConstRes.walletBalanceIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.medicalReading,
              depIcon: ConstRes.medicalReadingIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.smartWatch,
              depIcon: ConstRes.smartWatchIcon,
              handleClick: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MedicalFileDepartment(
              depName: ConstRes.askDoctor,
              depIcon: ConstRes.doctorIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.internetConnection,
              depIcon: ConstRes.wifiIcon,
              handleClick: () {},
            ),
            MedicalFileDepartment(
              depName: ConstRes.chatBot,
              depIcon: ConstRes.chatbotIcon,
              handleClick: () {},
            ),
          ],
        ),
      ],
    );
  }
}
