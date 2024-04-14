import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_search_bar.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/doctors_list_screen/doctors_list_screen_controller.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';

// ignore: must_be_immutable
class DocotrsListScreen extends GetView<DoctorsListScreenController> {
  const DocotrsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorsListScreenController()); // هاد هيك صح ؟
    ReserveAppointmentScreenController reserveAppointmentScreenController =
        Get.find();
    DoctorScreenController doctorScreenController =
        Get.put(DoctorScreenController());
    MainScreenController mainScreenController = Get.put(MainScreenController());

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Container(
            width: 500.0,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    mainScreenController.currentPage.value =
                        PagesNames.reserveAppointment1;
                  },
                  alignment: Alignment.topRight,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "reserveAppointment".tr,
                  style: const TextStyle(
                    color: Colors.white,
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
                Obx(
                  () => Column(
                    children: controller.doctors
                        .map((d) => InkWell(
                              onTap: () async {
                                reserveAppointmentScreenController
                                    .doctorsListArguments.value.doctorId = d.id;
                                reserveAppointmentScreenController
                                        .doctorsListArguments.value.doctorName =
                                    d.keys[ConstRes.languageCode]!['label']!;

                                await doctorScreenController.getDoctorInfo();
                                await doctorScreenController
                                    .getDoctorAvailableAppointements();
                                await doctorScreenController
                                    .getDoctorAvailableAppointementsDays();
                                mainScreenController.currentPage.value =
                                    PagesNames.doctorInfo;
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
                                height: 100.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
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
                                          padding: const EdgeInsets.all(10.0),
                                          height: 80.0,
                                          width: 80.0,
                                          child: Image.asset(
                                              "assets/images/help_doctor_icon.png"),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(d.keys[ConstRes.languageCode]![
                                                'label']!),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
