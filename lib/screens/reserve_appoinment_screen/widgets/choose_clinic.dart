import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/doctors_list_screen/doctors_list_screen_controller.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
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
          SubAppBar(
            title: "reserveAppointment",
            handleReturn: controller.returnToHomePage,
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
                                    Text(
                                      "clinic".tr,
                                      textAlign: TextAlign.end,
                                    ),
                                    Text(controller.clinicName.value),
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

                                        controller.clinicName.value = c.keys[
                                            ConstRes.languageCode]!['name']!;
                                        controller.doctorsListArguments.value
                                            .depId = c.id;
                                        controller.doctorsListArguments.value
                                                .depName =
                                            c.keys[ConstRes.languageCode]![
                                                'name']!;
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
                                                c.keys[ConstRes.languageCode]![
                                                    'name']!,
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
                            return ListTile(
                              title: Text(
                                "branch".tr,
                                textAlign: TextAlign.start,
                              ),
                            );
                          },
                          body: Container(
                            height: 120.0,
                            padding: const EdgeInsets.all(10),
                            child: GridView.count(
                              crossAxisCount: 4,
                              crossAxisSpacing: 5.0,
                              children: controller.branches.map((b) {
                                return InkWell(
                                  onTap: () async {
                                    controller.setSelectedClinic(false);
                                    controller.branchId.value = b.id;
                                    controller.doctorsListArguments.value
                                        .branchId = b.id;
                                    controller.doctorsListArguments.value
                                            .branchName =
                                        b.keys[ConstRes.languageCode]![
                                            'label']!;

                                    mainScreenController.currentPage.value =
                                        PagesNames.doctorsList;

                                    await doctorsListScreenController
                                        .getDoctors();

                                    controller.clinicName.value = '';
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(CustomColors.grey),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.home,
                                            size: 40.0,
                                            color:
                                                Color(CustomColors.lightBlue),
                                          ),
                                          Text(
                                            b.keys[ConstRes.languageCode]![
                                                'label']!,
                                            style: TextStyle(
                                                color: Color(
                                              CustomColors.lightBlue,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
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
