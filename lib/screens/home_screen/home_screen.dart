import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/home_screen/home_screen_controller.dart';
import 'package:his_project/screens/home_screen/widgets/all_services.dart';
import 'package:his_project/screens/home_screen/widgets/call_to_action.dart';
import 'package:his_project/common/custom_search_bar.dart';
import 'package:his_project/screens/home_screen/widgets/main_services.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      color: Color(CustomColors.white),
      margin: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10.0,
            ),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ConstRes.eServices.tr,
                    textAlign: TextAlign.end,
                  ),
                  InkWell(
                    onTap: () {
                      homeScreenController.goToAllServices();
                    },
                    child: Text(
                      ConstRes.showAllServices.tr,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Services(),
          ],
        ),
      ),
    );
  }
}
