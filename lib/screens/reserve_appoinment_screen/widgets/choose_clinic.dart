import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/screens/doctors_list_screen/doctors_list_screen.dart';
import 'package:his_project/utils/const_test.dart';

class ChooseClinic extends GetView<ReserveAppointmentScreenController> {
  const ChooseClinic({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReserveAppointmentScreenController());
    controller.clinics.value = TestConst.clinicList;

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30.0, 0, 0),
      child: Obx(() => SingleChildScrollView(
            child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  controller.toogleExpanded(index, isExpanded);
                },
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(
                        title: Text(
                          "اسم العيادة",
                          textAlign: TextAlign.end,
                        ),
                      );
                    },
                    body: Container(
                      height: 120.0,
                      padding: const EdgeInsets.all(10),
                      child: GridView.count(
                        crossAxisCount: 4,
                        children: controller.clinics
                            .map((c) => InkWell(
                                  onTap: () {
                                    controller.setSelectedClinic(true);
                                    controller.toogleExpanded(1, true);
                                    controller.branches.value = c.barnches;
                                  },
                                  child: Card(
                                    child: Center(
                                      child: Text(c.name),
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
                      headerBuilder: (BuildContext context, bool isExpanded) {
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
                          children: controller.branches
                              .map((b) => InkWell(
                                    onTap: () {
                                      controller.setSelectedClinic(false);
                                      Get.to(() => DocotrsListScreen(),
                                          arguments: {"doctors": b.doctors});
                                    },
                                    child: Card(
                                      child: Center(
                                        child: Text(b.location),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      isExpanded: controller.isDoctorExpanded.value,
                    )
                ]),
          )),
    );
  }
}
