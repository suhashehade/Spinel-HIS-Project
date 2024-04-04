import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/doctor_screen/widgets/available_appointments.dart';
import 'package:his_project/screens/doctor_screen/widgets/doctor_info.dart';
import 'package:his_project/screens/main_screen/main_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/pages_names.dart';

class DoctorInfoScreen extends GetView<DoctorScreenController> {
  const DoctorInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorScreenController());
    ReserveAppointmentScreenController reserveAppointmentScreenController =
        Get.put(ReserveAppointmentScreenController());
    MainScreenController mainScreenController = Get.put(MainScreenController());
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
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
                InkWell(
                  onTap: () {
                    mainScreenController.currentPage.value = PagesNames.home;
                  },
                  child: const Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.white,
                  ),
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
                            PagesNames.doctorsList;
                      },
                      alignment: AlignmentDirectional.topStart,
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Color(
                          CustomColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            reserveAppointmentScreenController
                .doctorsListArguments.value.doctorName,
            style: const TextStyle(
              fontSize: 25.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TabBar(
            dividerColor: Color(CustomColors.lightBlue),
            indicatorColor: Color(CustomColors.lightGreen),
            indicatorWeight: 5.0,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: 'المواعيد المتاحة'),
              Tab(text: 'معلومات الطبيب'),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
                AvailableAppointment(),
                DoctorInfo(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
