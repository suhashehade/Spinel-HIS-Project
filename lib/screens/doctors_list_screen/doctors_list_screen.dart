import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_search_bar.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/doctors_list_screen/doctors_list_screen_controller.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/pages_names.dart';

// ignore: must_be_immutable
class DocotrsListScreen extends GetView<DoctorsListScreenController> {
  const DocotrsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorsListScreenController());
    ReserveAppointmentScreenController reserveAppointmentScreenController =
        Get.put(ReserveAppointmentScreenController());
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "حجز موعد",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    mainScreenController.currentPage.value =
                        PagesNames.reserveAppointment1;
                  },
                  alignment: Alignment.topRight,
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
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
                                // showDialog(
                                //     context: context,
                                //     builder: (context) {
                                //       return const Center(
                                //         child: CircularProgressIndicator(),
                                //       );
                                //     });

                                reserveAppointmentScreenController
                                    .doctorsListArguments.value.doctorId = d.id;
                                reserveAppointmentScreenController
                                    .doctorsListArguments
                                    .value
                                    .doctorName = d.label;

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
                                    const Icon(Icons.arrow_back),
                                    Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(d.label),
                                            Text("${d.id}"),
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(10.0),
                                          height: 80.0,
                                          width: 80.0,
                                          child: Image.asset(
                                              "assets/images/help_doctor_icon.png"),
                                        ),
                                      ],
                                    ),
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
