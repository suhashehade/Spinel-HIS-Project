import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar.dart';
import 'package:his_project/common/custom_search_bar.dart';
import 'package:his_project/common/sidebar.dart';
import 'package:his_project/screens/doctors_list_screen/doctors_list_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
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
      appBar: const CustomAppBar(backWidget: Text("")),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              width: 500.0,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(CustomColors.lightGreen),
                    Color(CustomColors.lightBlue),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    alignment: Alignment.topRight,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(CustomColors.white),
                    ),
                  ),
                  Text(
                    ConstRes.reserveAppointment.tr,
                    style: TextStyle(
                      color: Color(CustomColors.white),
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
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
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Color(CustomColors.lightGreen),
                          ),
                        )
                      : Column(
                          children: [
                            Obx(
                              () => Text(
                                  doctorsListScreenController.error.value.tr,
                                  style: TextStyle(
                                    color: Color(CustomColors.lightBlue),
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
                                            color: Color(CustomColors.grey),
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
                                                            GradientBoxBorder(
                                                                width: 3.0,
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(CustomColors
                                                                        .lightBlue),
                                                                    Color(CustomColors
                                                                        .lightGreen),
                                                                  ],
                                                                ))),
                                                    child: Image.asset(
                                                        ConstRes.doctorIcon),
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
