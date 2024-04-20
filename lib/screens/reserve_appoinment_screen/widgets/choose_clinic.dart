import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class ChooseClinic extends StatelessWidget {
  const ChooseClinic({super.key});

  @override
  Widget build(BuildContext context) {
    ReserveAppointmentScreenController reserveAppointmentScreenController =
        Get.put(ReserveAppointmentScreenController());

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
                        color: Color(CustomColors.grey),
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
                              Icon(
                                Icons.search,
                                color: Color(CustomColors.lightBlue),
                              ),
                              Text(
                                ConstRes.clinic.tr,
                                style: TextStyle(
                                    color: Color(CustomColors.lightBlue),
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
                                ? Image.asset(ConstRes.arrowDownward)
                                : Image.asset(ConstRes.arrowUpward),
                          ),
                        ],
                      ),
                    ),
                  ),
                  reserveAppointmentScreenController.isClinicExpanded.value
                      ? SingleChildScrollView(
                          child: Container(
                            height: 300.0,
                            padding: const EdgeInsets.all(10.0),
                            child: GridView.count(
                                scrollDirection: Axis.vertical,
                                crossAxisCount: 3,
                                crossAxisSpacing: 5.0,
                                children: [
                                  ...reserveAppointmentScreenController.clinics
                                      .map((c) => InkWell(
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
                                                color: Color(CustomColors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        height: 60.0,
                                                        width: 50.0,
                                                        child: SvgPicture.asset(
                                                          ConstRes
                                                              .clinicImageIcon,
                                                          height: 50.0,
                                                          width: 50.0,
                                                          color: Color(
                                                            CustomColors
                                                                .lightBlue,
                                                          ),
                                                        )),
                                                    Text(
                                                      c.keys[PrefsService.to
                                                              .getString(ConstRes
                                                                  .langkey) ??
                                                          Get.locale
                                                              ?.languageCode]![ConstRes
                                                          .nameKey]!,
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

            // Obx(
            //   () => SingleChildScrollView(
            //     child: ExpansionPanelList(
            //         elevation: 0,
            //         expansionCallback: (int index, bool isExpanded) {
            //           reserveAppointmentScreenController.toggleExpanded(
            //               index, isExpanded);
            //         },
            //         children: [
            //           ExpansionPanel(
            //             headerBuilder:
            //                 (BuildContext context, bool isExpanded) {
            //               return InkWell(
            //                 onTap: () {
            //                   reserveAppointmentScreenController
            //                       .toggleExpanded(0, true);
            //                 },
            //                 child: ListTile(
            //                   title: TextFieldTapRegion(
            //                     child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         Row(
            //                           children: [
            //                             Icon(
            //                               Icons.search,
            //                               color:
            //                                   Color(CustomColors.lightBlue),
            //                             ),
            //                             Text(
            //                               ConstRes.clinic.tr,
            //                               style: TextStyle(
            //                                   color: Color(
            //                                       CustomColors.lightBlue)),
            //                               textAlign: TextAlign.end,
            //                             ),
            //                           ],
            //                         ),
            //                         Text(reserveAppointmentScreenController
            //                             .clinicName.value),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               );
            //             },
            //             body: Container(
            //               height: MediaQuery.of(context).size.height * 0.25,
            //               padding: const EdgeInsets.all(10),
            //               child: GridView.count(
            //                 scrollDirection: Axis.vertical,
            //                 crossAxisCount: 3,
            //                 crossAxisSpacing: 5.0,
            //                 children: reserveAppointmentScreenController
            //                     .clinics
            //                     .map((c) => InkWell(
            //                           onTap: () async {
            //                             reserveAppointmentScreenController
            //                                 .handleBranches(c);
            //                           },
            //                           child: Container(
            //                             height: MediaQuery.of(context)
            //                                     .size
            //                                     .height *
            //                                 0.75,
            //                             width: MediaQuery.of(context)
            //                                     .size
            //                                     .width *
            //                                 0.50,
            //                             decoration: BoxDecoration(
            //                               color: Color(CustomColors.grey),
            //                               borderRadius:
            //                                   BorderRadius.circular(5.0),
            //                             ),
            //                             child: Center(
            //                               child: Column(
            //                                 children: [
            //                                   Container(
            //                                       padding:
            //                                           const EdgeInsets.all(
            //                                               10.0),
            //                                       height: 60.0,
            //                                       width: 50.0,
            //                                       child: SvgPicture.asset(
            //                                         ConstRes.clinicImageIcon,
            //                                         height: 50.0,
            //                                         width: 50.0,
            //                                         color: Color(
            //                                           CustomColors.lightBlue,
            //                                         ),
            //                                       )),
            //                                   Text(
            //                                     c.keys[PrefsService.to
            //                                                 .getString(ConstRes
            //                                                     .langkey) ??
            //                                             Get.locale
            //                                                 ?.languageCode]![
            //                                         ConstRes.nameKey]!,
            //                                     style: TextStyle(
            //                                         color: Color(
            //                                       CustomColors.lightBlue,
            //                                     )),
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //                           ),
            //                         ))
            //                     .toList(),
            //               ),
            //             ),
            //             isExpanded: reserveAppointmentScreenController
            //                 .isClinicExpanded.value,
            //           ),
            //           if (reserveAppointmentScreenController
            //               .isClinicSelected.value)
            //             ExpansionPanel(
            //               headerBuilder:
            //                   (BuildContext context, bool isExpanded) {
            //                 return ListTile(
            //                   title: Row(
            //                     children: [
            //                       Icon(
            //                         Icons.search,
            //                         color: Color(CustomColors.lightBlue),
            //                       ),
            //                       Text(
            //                         ConstRes.branch.tr,
            //                         style: TextStyle(
            //                             color: Color(CustomColors.lightBlue)),
            //                         textAlign: TextAlign.start,
            //                       ),
            //                     ],
            //                   ),
            //                 );
            //               },
            //               body: Container(
            //                 height: 120.0,
            //                 padding: const EdgeInsets.all(10),
            //                 child: GridView.count(
            //                   crossAxisCount: 4,
            //                   crossAxisSpacing: 5.0,
            //                   children: reserveAppointmentScreenController
            //                       .branches
            //                       .map((b) {
            //                     return InkWell(
            //                       onTap: () {
            //                         reserveAppointmentScreenController
            //                             .goToDoctorsList(b);
            //                       },
            //                       child: Container(
            //                         decoration: BoxDecoration(
            //                           color: Color(CustomColors.grey),
            //                           borderRadius:
            //                               BorderRadius.circular(5.0),
            //                         ),
            //                         child: Container(
            //                           padding: const EdgeInsets.all(10.0),
            //                           child: Column(
            //                             children: [
            //                               Icon(
            //                                 Icons.home,
            //                                 size: 40.0,
            //                                 color:
            //                                     Color(CustomColors.lightBlue),
            //                               ),
            //                               Text(
            //                                 b.keys[PrefsService.to.getString(
            //                                             ConstRes.langkey) ??
            //                                         Get.locale
            //                                             ?.languageCode]![
            //                                     ConstRes.labelKey]!,
            //                                 style: TextStyle(
            //                                     color: Color(
            //                                   CustomColors.lightBlue,
            //                                 )),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                     );
            //                   }).toList(),
            //                 ),
            //               ),
            //               isExpanded: reserveAppointmentScreenController
            //                   .isDoctorExpanded.value,
            //             )
            //         ]),
            //   ),
            // ),

            Obx(
              () => reserveAppointmentScreenController.isClinicSelected.value
                  ? Column(children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(CustomColors.grey),
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
                                style: TextStyle(
                                    color: Color(CustomColors.lightBlue),
                                    fontSize: 15.0),
                              ),
                              Container(
                                padding: const EdgeInsets.all(0.0),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.05,
                                child: reserveAppointmentScreenController
                                        .isBranchExpanded.value
                                    ? Image.asset(ConstRes.arrowDownward)
                                    : Image.asset(ConstRes.arrowUpward),
                              ),
                            ],
                          ),
                        ),
                      ),
                      reserveAppointmentScreenController.isBranchExpanded.value
                          ? SingleChildScrollView(
                              child: Container(
                                  height: 300.0,
                                  padding: const EdgeInsets.all(10.0),
                                  child: GridView.count(
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
                                              color: Color(CustomColors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            padding: const EdgeInsets.all(10.0),
                                            margin: const EdgeInsets.fromLTRB(
                                                0.0, 0.0, 0.0, 10.0),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.home,
                                                  size: 40.0,
                                                  color: Color(
                                                      CustomColors.lightBlue),
                                                ),
                                                Text(
                                                  b.keys[PrefsService.to
                                                              .getString(ConstRes
                                                                  .langkey) ??
                                                          Get.locale
                                                              ?.languageCode]![
                                                      ConstRes.labelKey]!,
                                                  style: TextStyle(
                                                      color: Color(
                                                    CustomColors.lightBlue,
                                                  )),
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
