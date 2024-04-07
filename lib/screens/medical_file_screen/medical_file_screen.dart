import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/screens/medical_file_screen/widgets/call_to_action.dart';
import 'package:his_project/screens/medical_file_screen/widgets/medical_file_departments.dart';
import 'package:his_project/utils/pages_names.dart';

class MedicalFileScreen extends StatelessWidget {
  const MedicalFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainScreenController mainScreenController = Get.put(MainScreenController());
    return Scaffold(
      body: Column(
        children: [
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
                const Icon(
                  Icons.home,
                  size: 30.0,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    const Text(
                      "الملف الطبي",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        mainScreenController.currentPage.value =
                            PagesNames.home;
                        mainScreenController.isHome.value = true;
                      },
                      alignment: Alignment.topRight,
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
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
            child: const SizedBox(
              width: 500.0,
              child: Text(
                "الملف الطبي",
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const MedicalFileDepartments(),
          )
        ],
      ),
    );
  }
}
