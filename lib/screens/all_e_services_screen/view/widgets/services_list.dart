import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/service.dart';
import 'package:his_project/screens/home_screen/controller/home_screen_controller.dart';
import 'package:his_project/utils/lists.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        scrollDirection: Axis.vertical,
        itemCount: Lists.servicesList.length,
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
      ),
    );
  }
}
