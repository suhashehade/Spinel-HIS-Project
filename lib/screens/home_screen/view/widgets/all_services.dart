import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/service.dart';
import 'package:his_project/screens/home_screen/controller/home_screen_controller.dart';
import 'package:his_project/utils/lists.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    return Container(
        padding: const EdgeInsets.all(0.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.24,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 5.0, crossAxisSpacing: 5.0),
          itemCount: Lists.servicesList.sublist(0, 6).length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                homeScreenController.redirect(
                    "home$index", Lists.servicesList[index].serviceName);
              },
              child: Service(
                serviceName: Lists.servicesList[index].serviceName.tr,
                serviceIcon: Lists.servicesList[index].serviceIcon,
              ),
            );
          },
        ));
  }
}
