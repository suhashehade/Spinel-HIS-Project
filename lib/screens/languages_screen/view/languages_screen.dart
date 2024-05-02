import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/languages_screen/controller/languages_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LanguagesScreenController languagesScreenController =
        Get.put(LanguagesScreenController());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: CustomColors.lightGreen,
      ),
      body: Obx(
        () => languagesScreenController.isArabicTop.value
            ? ListView(
                children: [
                  Card(
                    child: ListTile(
                      title: Text(ConstRes.arabicAr),
                    ),
                  ),
                  Draggable(
                    axis: Axis.vertical,
                    onDragEnd: (details) {
                      languagesScreenController.onDragEnd(
                          details.wasAccepted, ConstRes.enKey);
                    },
                    feedback: SizedBox(
                      height: 70.0,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                          child: Text(
                            ConstRes.englishEn,
                          ),
                        ),
                      ),
                    ),
                    child: Card(
                      child: ListTile(
                        title: Text(ConstRes.englishEn),
                        trailing: const Icon(Icons.drag_handle),
                      ),
                    ),
                  )
                ],
              )
            : ListView(
                children: [
                  Card(
                    child: ListTile(
                      title: Text(ConstRes.englishEn),
                    ),
                  ),
                  Draggable(
                    axis: Axis.vertical,
                    onDragEnd: (details) {
                      languagesScreenController.onDragEnd(
                          details.wasAccepted, ConstRes.arKey);
                    },
                    feedback: SizedBox(
                      height: 70.0,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                          child: Text(
                            ConstRes.arabicAr,
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: Card(
                      child: ListTile(
                        title: Text(ConstRes.arabicAr),
                      ),
                    ),
                    child: Card(
                      child: ListTile(
                        title: Text(ConstRes.arabicAr),
                        trailing: const Icon(Icons.drag_handle),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
