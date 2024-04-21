import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/sidebar.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/pathology_test_screen/pathology_test_screen_controller.dart';
import 'package:his_project/screens/pathology_test_screen/widgets/pathology_test_list.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class PathologyTestScreen extends StatelessWidget {
  const PathologyTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PathologyTestScreenController pathologyTestScreenController =
        Get.put(PathologyTestScreenController());
    return Scaffold(
      drawer: const CustomSidebar(),
      appBar: const CustomAppBar(
        backWidget: Text(""),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SubAppBar(
                handleReturn: () {
                  pathologyTestScreenController.handleReturn();
                },
                title: ConstRes.pathology),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                          Color(CustomColors.lightGreen),
                          Color(CustomColors.lightBlue),
                        ]),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(ConstRes.newOrder.tr),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                          Color(CustomColors.lightGreen),
                          Color(CustomColors.lightBlue),
                        ]),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(ConstRes.prevOrder.tr),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: const PathologyTestList(),
            )
          ],
        ),
      ),
    );
  }
}
