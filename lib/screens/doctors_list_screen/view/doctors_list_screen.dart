import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar.dart';
import 'package:his_project/common/custom_search_bar.dart';
import 'package:his_project/common/custome_circular_progress_indicator.dart';
import 'package:his_project/common/sidebar/sidebar.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/doctors_list_screen/controller/doctors_list_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

// ignore: must_be_immutable
class DocotrsListScreen extends StatelessWidget {
  const DocotrsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorsListScreenController doctorsListScreenController =
        Get.put(DoctorsListScreenController());

    return Scaffold(
      drawer: const CustomSidebar(),
      appBar: const CustomAppBar(backWidget: SizedBox()),
      body: SafeArea(
        child: Column(
          children: [
            SubAppBar(
                handleReturn: doctorsListScreenController.handleReturn,
                title: ConstRes.reserveAppointment),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomSearchBar(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Obx(() => doctorsListScreenController.isLoading.value
                      ? const CustomCircularProgressIndicator()
                      : Column(
                          children: [
                            Obx(
                              () => Text(
                                  doctorsListScreenController.error.value.tr,
                                  style: const TextStyle(
                                    color: CustomColors.lightBlue,
                                    fontSize: 16.0,
                                  )),
                            ),
                            Column(
                              children: doctorsListScreenController.doctors
                                  .map((d) => InkWell(
                                        onTap: () {
                                          doctorsListScreenController
                                              .toDoctorScreen(d);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(10.0),
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: CustomColors.grey,
                                          ),
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    height: 80.0,
                                                    width: 80.0,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    360.0),
                                                        border:
                                                            const GradientBoxBorder(
                                                                width: 3.0,
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    CustomColors
                                                                        .lightBlue,
                                                                    CustomColors
                                                                        .lightGreen,
                                                                  ],
                                                                ))),
                                                    child:
                                                        ConstAssets.doctorIcon,
                                                  ),
                                                  const SizedBox(
                                                    width: 15.0,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(d.keys[PrefsService
                                                              .to
                                                              .getString(ConstRes
                                                                  .langkey) ??
                                                          Get.locale
                                                              ?.languageCode]![ConstRes
                                                          .labelKey]!),
                                                      Text("${d.id}"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const Icon(Icons.arrow_forward),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        ))
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
