import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/medical_test_screen/medical_test_screen_controller.dart';
import 'package:his_project/screens/medical_test_screen/widgets/medical_test_item.dart';
import 'package:his_project/utils/consts_res.dart';

class MediacTestList extends StatelessWidget {
  const MediacTestList({super.key});

  @override
  Widget build(BuildContext context) {
    MedicalTestScreenController medicalTestScreenController =
        Get.put(MedicalTestScreenController());
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ...ConstRes.mediaclTestTypes.map((t) => MedicalTestItem(
                onTap: medicalTestScreenController.handleList,
                title: t.toString(),
              ))
        ],
      ),
    );
  }
}
