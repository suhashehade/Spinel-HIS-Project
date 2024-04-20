import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/screens/medical_analysis_results_screen/medical_analysis_results_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:intl/intl.dart';

class GeneralResultsContainer extends StatelessWidget {
  const GeneralResultsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    MedicalAnalysisResultScreenController
        medicalAnalysisResultScreenController =
        Get.put(MedicalAnalysisResultScreenController());
    return Obx(() => Container(
          key: Key(medicalAnalysisResultScreenController.keyValue.value),
          padding: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          height: medicalAnalysisResultScreenController.generalHeight.value,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: GradientBoxBorder(
              gradient: LinearGradient(colors: [
                Color(CustomColors.lightBlue),
                Color(CustomColors.lightGreen),
              ]),
            ),
          ),
          child: InkWell(
            onTap: () {
              medicalAnalysisResultScreenController.generalClick();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstRes.generalResults.tr,
                      style: TextStyle(
                          color: Color(CustomColors.lightBlue), fontSize: 15.0),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.05,
                      child: medicalAnalysisResultScreenController
                              .isGeneralCollapsed.value
                          ? Image.asset(ConstRes.arrowUpward)
                          : Image.asset(ConstRes.arrowDownward),
                    ),
                  ],
                ),
                medicalAnalysisResultScreenController.isGeneralCollapsed.value
                    ? Expanded(
                        child: ListView(children: [
                          ListTile(
                            title: Text(
                              DateFormat.yMMMMd()
                                  .format(DateTime.now())
                                  .toString(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color(CustomColors.lightBlue),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Description',
                                    style: TextStyle(
                                        color: Color(CustomColors.lightBlue),
                                        fontSize: 15.0),
                                  ),
                                  Text(
                                    'Result',
                                    style: TextStyle(
                                        color: Color(CustomColors.lightBlue),
                                        fontSize: 15.0),
                                  ),
                                  Text(
                                    'Unit',
                                    style: TextStyle(
                                        color: Color(CustomColors.lightBlue),
                                        fontSize: 15.0),
                                  ),
                                  Text(
                                    'Range',
                                    style: TextStyle(
                                        color: Color(CustomColors.lightBlue),
                                        fontSize: 15.0),
                                  ),
                                ]),
                          ),
                          ...ConstRes.cbcResultsList.map(
                            (cbc) => ListTile(
                              title: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: GradientBoxBorder(
                                    gradient: LinearGradient(colors: [
                                      Color(CustomColors.lightBlue),
                                      Color(CustomColors.lightGreen),
                                    ]),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        cbc.description,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color:
                                                Color(CustomColors.lightBlue),
                                            fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        cbc.result,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color:
                                                Color(CustomColors.lightBlue),
                                            fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        cbc.unit,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color:
                                                Color(CustomColors.lightBlue),
                                            fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        cbc.range,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color:
                                                Color(CustomColors.lightBlue),
                                            fontSize: 15.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                      )
                    : const Text("")
              ],
            ),
          ),
        ));
  }
}
