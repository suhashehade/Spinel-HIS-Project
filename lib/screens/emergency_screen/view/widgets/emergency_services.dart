import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/emergency_screen/view/widgets/emergency_service.dart';
import 'package:his_project/utils/lists.dart';

class EmergencyServices extends StatelessWidget {
  const EmergencyServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5.0),
        height: MediaQuery.of(context).size.height * 100,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 1,
          ),
          itemCount: Lists.emergencyServicesList.length,
          itemBuilder: (context, index) {
            return EmergencyService(
                serviceName: Lists.emergencyServicesList[index].serviceName.tr,
                serviceIcon: Lists.emergencyServicesList[index].serviceIcon);
          },
        ));
  }
}
