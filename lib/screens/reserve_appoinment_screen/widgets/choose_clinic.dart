import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/doctors_list_screen/doctors_list_screen_controller.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/pages_names.dart';

class ChooseClinic extends GetView<ReserveAppointmentScreenController> {
  const ChooseClinic({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReserveAppointmentScreenController());
    MainScreenController mainScreenController = Get.put(MainScreenController());
    DoctorsListScreenController doctorsListScreenController =
        Get.put(DoctorsListScreenController());

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30.0, 0, 0),
      child: Column(
        children: [
          Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.home,
                  size: 30.0,
                  color: Colors.white,
                ),
                Row(
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
                            PagesNames.home;
                        mainScreenController.isHome.value = true;
                      },
                      alignment: Alignment.topRight,
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(CustomColors.grey),
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Obx(
              () => SingleChildScrollView(
                child: ExpansionPanelList(
                    elevation: 0,
                    expansionCallback: (int index, bool isExpanded) {
                      controller.toggleExpanded(index, isExpanded);
                    },
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return InkWell(
                            onTap: () {
                              controller.toggleExpanded(0, true);
                            },
                            child: ListTile(
                              title: TextFieldTapRegion(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(controller.clinicName.value),
                                    const Text(
                                      "اسم العيادة",
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        body: Container(
                          height: 120.0,
                          padding: const EdgeInsets.all(10),
                          child: GridView.count(
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 4,
                            crossAxisSpacing: 5.0,
                            children: controller.clinics
                                .map((c) => InkWell(
                                      onTap: () async {
                                        controller.setSelectedClinic(true);
                                        controller.toggleExpanded(1, true);
                                        controller.toggleExpanded(0, false);
                                        await controller.getBranches(c.id);
                                        controller.clinicName.value = c.nameEn;
                                        controller.doctorsListArguments.value
                                            .depId = c.id;
                                        controller.doctorsListArguments.value
                                            .depName = c.nameEn;
                                      },
                                      child: Container(
                                        height: 120.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          color: Color(CustomColors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Container(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  height: 60.0,
                                                  width: 50.0,
                                                  child: SvgPicture.asset(
                                                    "assets/images/Vector.svg",
                                                    height: 50.0,
                                                    width: 50.0,
                                                    color: Color(
                                                      CustomColors.lightBlue,
                                                    ),
                                                  )),
                                              Text(
                                                c.nameEn,
                                                style: TextStyle(
                                                    color: Color(
                                                  CustomColors.lightBlue,
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        isExpanded: controller.isClinicExpanded.value,
                      ),
                      if (controller.isClinicSelected.value)
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return const ListTile(
                              title: Text(
                                "الفرع",
                                textAlign: TextAlign.end,
                              ),
                            );
                          },
                          body: Container(
                            height: 120.0,
                            padding: const EdgeInsets.all(10),
                            child: GridView.count(
                              crossAxisCount: 4,
                              crossAxisSpacing: 5.0,
                              children: controller.branches
                                  .map((b) => InkWell(
                                        onTap: () async {
                                          controller.setSelectedClinic(false);
                                          controller.branchId.value = b.id;
                                          controller.doctorsListArguments.value
                                              .branchId = b.id;
                                          controller.doctorsListArguments.value
                                              .branchName = b.label;
                                          mainScreenController.currentPage
                                              .value = PagesNames.doctorsList;
                                          await doctorsListScreenController
                                              .getDoctors();

                                          controller.clinicName.value = '';
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(CustomColors.grey),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.home,
                                                  size: 40.0,
                                                  color: Color(
                                                      CustomColors.lightBlue),
                                                ),
                                                Text(
                                                  b.label,
                                                  style: TextStyle(
                                                      color: Color(
                                                    CustomColors.lightBlue,
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          isExpanded: controller.isDoctorExpanded.value,
                        )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
