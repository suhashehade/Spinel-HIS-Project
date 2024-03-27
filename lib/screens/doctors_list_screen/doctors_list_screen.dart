import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/doctors_list_screen/doctors_list_screen_controller.dart';

// ignore: must_be_immutable
class DocotrsListScreen extends GetView<DoctorsListScreenController> {
  const DocotrsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorsListScreenController());
    DoctorScreenController doctorScreenController =
        Get.put(DoctorScreenController());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text("Doctors"),
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
                            await doctorScreenController.getDoctorInfo(d.id);
                            await doctorScreenController
                                .getDoctorAvailableAppointementsDays(
                                    d.id, d.depId, d.branchId);
                            await doctorScreenController
                                .getDoctorAvailableAppointements(
                                    d.id, d.depId, d.branchId);

                            Get.to(() => const DoctorInfoScreen(),
                                arguments: {"doctor": d});
                          },
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(d.label),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Clinic: ${controller.depName}"),
                                          Text(
                                              "Branch: ${controller.branchName}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
