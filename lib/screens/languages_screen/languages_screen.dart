import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/languages_screen/languages_screen_controller.dart';
import 'package:his_project/utils/consts_res.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LanguagesScreenController languagesScreenController =
        Get.put(LanguagesScreenController());
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          InkWell(
            child: Card(
              child: ListTile(
                title: Text(ConstRes.arabicAr),
              ),
            ),
            onTap: () {
              languagesScreenController.changeLanguage(ConstRes.arKey);
            },
          ),
          InkWell(
            child: Card(
              child: ListTile(
                title: Text(ConstRes.englishEn),
              ),
            ),
            onTap: () {
              languagesScreenController.changeLanguage(ConstRes.enKey);
            },
          ),
        ],
      ),
    );
  }
}
