import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/home_screen/home_screen_controller.dart';
import 'package:his_project/screens/home_screen/widgets/all_services.dart';
import 'package:his_project/screens/home_screen/widgets/call_to_action.dart';
import 'package:his_project/common/custom_search_bar.dart';
import 'package:his_project/screens/home_screen/widgets/main_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
      color: Colors.white,
      margin: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomSearchBar(),
            const SizedBox(
              height: 15.0,
            ),
            const CallToAction(),
            const SizedBox(
              height: 15.0,
            ),
            const MainServices(),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "eServices".tr,
                  textAlign: TextAlign.end,
                ),
                InkWell(
                  onTap: () {
                    homeScreenController.goToAllServices();
                  },
                  child: Text(
                    "showAllServices".tr,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Services(),
          ],
        ),
      ),
    );
  }
}
