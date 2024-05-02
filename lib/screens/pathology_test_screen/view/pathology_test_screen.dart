import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/designed_btn.dart';
import 'package:his_project/common/sidebar/sidebar.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/pathology_test_screen/controller/pathology_test_screen_controller.dart';
import 'package:his_project/screens/pathology_test_screen/view/widgets/pathology_test_list.dart';
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
        backWidget: SizedBox(),
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DesignedButton(
                    title: ConstRes.newOrder,
                    handle: () {},
                    backGround: CustomColors.white,
                  ),
                  DesignedButton(
                    title: ConstRes.prevOrder,
                    handle: () {},
                    backGround: CustomColors.white,
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
