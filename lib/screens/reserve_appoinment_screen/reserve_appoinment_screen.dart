import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/reserve_appoinment_screen/reserve_appoinment_screen_controller.dart';
import 'package:his_project/screens/reserve_appoinment_screen/widgets/choose_clinic.dart';
import 'package:his_project/screens/reserve_appoinment_screen/widgets/choose_doctor.dart';

class ReserveAppointmentScreen
    extends GetView<ReserveAppointmentScreenController> {
  const ReserveAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReserveAppointmentScreenController());
    return DefaultTabController(
      animationDuration: const Duration(microseconds: 5),
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'حجز موعد',
            textAlign: TextAlign.end,
          ),
          bottom: TabBar(
            tabs: const [
              Text("اسم الطبيب"),
              Text("اسم العيادة"),
            ],
            onTap: (value) => controller.changeChoice(value),
          ),
        ),
        body: const TabBarView(children: [
          ChooseDoctor(),
          ChooseClinic(),
        ]),
      ),
    );
  }
}
