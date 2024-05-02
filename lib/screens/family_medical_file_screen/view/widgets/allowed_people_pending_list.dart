import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/screens/family_medical_file_screen/controller/family_medical_file_screen_controller.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/lists.dart';
import 'package:intl/intl.dart';

class AllowedPeoplePendingList extends StatelessWidget {
  const AllowedPeoplePendingList({super.key});

  @override
  Widget build(BuildContext context) {
    FamilyMedicalFileScreenController familyMedicalFileScreenController =
        Get.put(FamilyMedicalFileScreenController());
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        height: familyMedicalFileScreenController.allowedPeopleListHeight.value,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: const GradientBoxBorder(
            gradient: LinearGradient(colors: [
              CustomColors.lightBlue,
              CustomColors.lightGreen,
            ]),
          ),
        ),
        child: InkWell(
          onTap: () {
            familyMedicalFileScreenController.onAllowedPeopleListClick();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ConstRes.allowedPendingsList.tr,
                    style: const TextStyle(
                        color: CustomColors.lightBlue, fontSize: 15.0),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.05,
                    child:
                        familyMedicalFileScreenController.isPersonsCollaps.value
                            ? ConstAssets.arrowUpward
                            : ConstAssets.arrowDownward,
                  ),
                ],
              ),
              familyMedicalFileScreenController.isPersonsCollaps.value
                  ? Expanded(
                      child: ListView(children: [
                        ListTile(
                          title: Text(
                            DateFormat.yMMMMd()
                                .format(DateTime.now())
                                .toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: CustomColors.lightBlue,
                            ),
                          ),
                        ),
                        const ListTile(
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(
                                      color: CustomColors.lightBlue,
                                      fontSize: 15.0),
                                ),
                                Text(
                                  'Result',
                                  style: TextStyle(
                                      color: CustomColors.lightBlue,
                                      fontSize: 15.0),
                                ),
                                Text(
                                  'Unit',
                                  style: TextStyle(
                                      color: CustomColors.lightBlue,
                                      fontSize: 15.0),
                                ),
                                Text(
                                  'Range',
                                  style: TextStyle(
                                      color: CustomColors.lightBlue,
                                      fontSize: 15.0),
                                ),
                              ]),
                        ),
                        ...Lists.cbcResultsList.map(
                          (cbc) => ListTile(
                            title: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: const GradientBoxBorder(
                                  gradient: LinearGradient(colors: [
                                    CustomColors.lightBlue,
                                    CustomColors.lightGreen,
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
                                      style: const TextStyle(
                                          color: CustomColors.lightBlue,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Text(
                                      cbc.result,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color: CustomColors.lightBlue,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Text(
                                      cbc.unit,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color: CustomColors.lightBlue,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Text(
                                      cbc.range,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color: CustomColors.lightBlue,
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
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
