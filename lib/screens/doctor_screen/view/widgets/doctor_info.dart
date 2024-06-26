import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:his_project/common/custome_circular_progress_indicator.dart';
import 'package:his_project/screens/doctor_screen/controller/doctor_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorScreenController doctorScreenController = Get.find();

    return Scaffold(
      body: Obx(
        () => doctorScreenController.isLoading.value
            ? const CustomCircularProgressIndicator()
            : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360.0),
                              border: const GradientBoxBorder(
                                  width: 3.0,
                                  gradient: LinearGradient(
                                    colors: [
                                      CustomColors.lightBlue,
                                      CustomColors.lightGreen,
                                    ],
                                  ))),
                          child: ConstAssets.doctorIcon,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          width: 500.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [
                                  CustomColors.lightBlue,
                                  CustomColors.lightGreen,
                                ],
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ConstRes.doctorInfo.tr,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                  "${ConstRes.gender.tr}: ${doctorScreenController.doctorInfo.value.keys[PrefsService.to.getString(ConstRes.langkey) ?? Get.locale?.languageCode]![ConstRes.gender]!}"),
                              Text(
                                  "${ConstRes.nationality.tr}:  ${doctorScreenController.doctorInfo.value.keys[PrefsService.to.getString(ConstRes.langkey) ?? Get.locale?.languageCode]![ConstRes.nationality]!}")
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          width: 500.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [
                                  CustomColors.lightBlue,
                                  CustomColors.lightGreen,
                                ],
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ConstRes.details.tr,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                  "${ConstRes.description.tr}: ${doctorScreenController.doctorInfo.value.keys[PrefsService.to.getString('lang') ?? Get.locale?.languageCode]!['description']!}")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
