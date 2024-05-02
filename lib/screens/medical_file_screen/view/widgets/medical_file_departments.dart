import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/medical_file_screen/controller/medical_file_screen_controller.dart';
import 'package:his_project/screens/medical_file_screen/view/widgets/medical_file_department.dart';
import 'package:his_project/utils/lists.dart';

class MedicalFileDepartments extends StatelessWidget {
  const MedicalFileDepartments({super.key});

  @override
  Widget build(BuildContext context) {
    MedicalFileScreenController medicalFileScreenController =
        Get.put(MedicalFileScreenController());
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 1.0),
        itemCount: Lists.medicalServiceList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              medicalFileScreenController.redirect(
                  "file$index", Lists.medicalServiceList[index].serviceName);
            },
            child: MedicalFileDepartment(
              depName: Lists.medicalServiceList[index].serviceName.tr,
              depIcon: Lists.medicalServiceList[index].serviceIcon,
            ),
          );
        },
      ),
    );
  }
}
