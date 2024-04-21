import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/emergency_screen/widgets/emergency_service.dart';
import 'package:his_project/utils/consts_res.dart';

class EmergencyServices extends StatelessWidget {
  const EmergencyServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height * 100,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 1,
          ),
          itemCount: ConstRes.emergencyServicesList.length,
          itemBuilder: (context, index) {
            return EmergencyService(
                serviceName:
                    ConstRes.emergencyServicesList[index].serviceName.tr,
                serviceIcon: ConstRes.emergencyServicesList[index].serviceIcon);
          },
        ));
  }
}
