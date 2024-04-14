import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:his_project/screens/medical_file_screen/medical_file_screen_controller.dart';
import 'package:his_project/screens/medical_file_screen/widgets/call_to_action.dart';
import 'package:his_project/screens/medical_file_screen/widgets/medical_file_departments.dart';
import 'package:his_project/utils/colors_res.dart';

class MedicalFileScreen extends StatelessWidget {
  const MedicalFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MedicalFileScreenController medicalFileScreenController =
    //     Get.put(MedicalFileScreenController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.lightGreen,
                    Colors.lightBlue,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "medicalFile".tr,
                        style: TextStyle(
                          color: Color(CustomColors.white),
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.home,
                    size: 30.0,
                    color: Color(CustomColors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: const CallToAction(),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: SizedBox(
                width: 500.0,
                child: Text(
                  "medicalFile".tr,
                  style: const TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: const MedicalFileDepartments(),
            )
          ],
        ),
      ),
    );
  }
}
