import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custome_circular_progress_indicator.dart';
import 'package:his_project/screens/reserve_appoinment_screen/controller/reserve_appoinment_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class ChooseClinic extends StatelessWidget {
  const ChooseClinic({super.key});

  @override
  Widget build(BuildContext context) {
    ReserveAppointmentScreenController reserveAppointmentScreenController =
        Get.find();

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.fromLTRB(0, 30.0, 0, 0),
        child: Column(
          children: [
            Obx(
              () => Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        reserveAppointmentScreenController
                            .toggleClinicExpanded();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: CustomColors.lightBlue,
                              ),
                              Text(
                                ConstRes.clinic.tr,
                                style: const TextStyle(
                                    color: CustomColors.lightBlue,
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                          Text(reserveAppointmentScreenController
                              .clinicName.value),
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.05,
                            child: reserveAppointmentScreenController
                                    .isClinicExpanded.value
                                ? ConstAssets.arrowUpward
                                : ConstAssets.arrowDownward,
                          ),
                        ],
                      ),
                    ),
                  ),
                  reserveAppointmentScreenController.isClinicExpanded.value
                      ? SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.50,
                            padding: const EdgeInsets.all(10.0),
                            child: reserveAppointmentScreenController
                                    .isClinicsLoading.value
                                ? const CustomCircularProgressIndicator()
                                : GridView.count(
                                    scrollDirection: Axis.vertical,
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 5.0,
                                    children: [
                                        ...reserveAppointmentScreenController
                                            .clinics
                                            .map(
                                          (c) => InkWell(
                                            onTap: () async {
                                              reserveAppointmentScreenController
                                                  .handleBranches(c);
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0.0, 0.0, 0.0, 10.0),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.75,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.50,
                                              decoration: BoxDecoration(
                                                color: CustomColors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 60.0,
                                                      width: 50.0,
                                                      child: ConstAssets
                                                          .clinicIcon,
                                                    ),
                                                    Text(
                                                      c.keys[PrefsService.to
                                                              .getString(ConstRes
                                                                  .langkey) ??
                                                          Get.locale
                                                              ?.languageCode]![ConstRes
                                                          .nameKey]!,
                                                      style: const TextStyle(
                                                        color: CustomColors
                                                            .lightBlue,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Obx(
              () => reserveAppointmentScreenController.isClinicSelected.value &&
                      !reserveAppointmentScreenController.isClinicExpanded.value
                  ? Column(children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CustomColors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            reserveAppointmentScreenController
                                .toggleBranchExpanded();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ConstRes.branch.tr,
                                style: const TextStyle(
                                    color: CustomColors.lightBlue,
                                    fontSize: 15.0),
                              ),
                              Container(
                                padding: const EdgeInsets.all(0.0),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.05,
                                child: reserveAppointmentScreenController
                                        .isBranchExpanded.value
                                    ? ConstAssets.arrowUpward
                                    : ConstAssets.arrowDownward,
                              ),
                            ],
                          ),
                        ),
                      ),
                      reserveAppointmentScreenController.isBranchExpanded.value
                          ? SingleChildScrollView(
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.50,
                                  padding: const EdgeInsets.all(10.0),
                                  child: reserveAppointmentScreenController
                                          .isBranchesLoading.value
                                      ? const CustomCircularProgressIndicator()
                                      : GridView.count(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 5.0,
                                          children: [
                                            ...reserveAppointmentScreenController
                                                .branches
                                                .map((b) {
                                              return InkWell(
                                                onTap: () {
                                                  reserveAppointmentScreenController
                                                      .goToDoctorsList(b);
                                                },
                                                child: Container(
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: CustomColors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 60.0,
                                                        width: 50.0,
                                                        child: ConstAssets
                                                            .branchIcon,
                                                      ),
                                                      Text(
                                                        b.keys[PrefsService.to
                                                                .getString(ConstRes
                                                                    .langkey) ??
                                                            Get.locale
                                                                ?.languageCode]![ConstRes
                                                            .labelKey]!,
                                                        style: const TextStyle(
                                                          color: CustomColors
                                                              .lightBlue,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })
                                          ],
                                        )),
                            )
                          : const SizedBox()
                    ])
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
