import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/doctor/doctor_list_arguments.dart';
import 'package:his_project/screens/doctors_list_screen/doctors_list_screen.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';

class ChooseClinic extends GetView<ReserveAppointmentScreenController> {
  const ChooseClinic({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReserveAppointmentScreenController());
    controller.getClinics();
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
                                  onTap: () async {
                                    controller.setSelectedClinic(true);
                                    controller.toogleExpanded(1, true);
                                    controller.toogleExpanded(0, false);
                                    await controller.getBranches(c.id);
                                    controller.clinicName = c.name;
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
                                    onTap: () async {
                                      controller.setSelectedClinic(false);
                                      // await controller.getDoctors(
                                      //     b.depId, b.id);

                                      Get.to(() => DocotrsListScreen(),
                                          arguments: {
                                            "arguments": DoctorsListArguments(
                                              depId: b.depId,
                                              branchId: b.id,
                                              branchName: b.label,
                                              depName: controller.clinicName,
                                            )
                                          });
                                    },
                                    child: Card(
                                      child: Center(
                                        child: Text(b.label),
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
