import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:his_project/common/custom_app_bar.dart';
import 'package:his_project/common/custom_bottombar/custom_bottombar.dart';
import 'package:his_project/common/sidebar.dart';
import 'package:his_project/common/sub_app_bar.dart';
import 'package:his_project/screens/emergency_screen/emergency_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EmergencyScreenController emergencyScreenController =
        Get.put(EmergencyScreenController());

    return Scaffold(
      drawer: const CustomSidebar(),
      appBar: const CustomAppBar(backWidget: Text("")),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              SubAppBar(
                title: ConstRes.emergencyServices,
                handleReturn: emergencyScreenController.returnToHome,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(CustomColors.white),
                          border: GradientBoxBorder(
                              gradient: LinearGradient(colors: [
                            Color(CustomColors.lightBlue),
                            Color(CustomColors.lightGreen),
                          ]))),
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ConstRes.askAmbulance.tr,
                            style: TextStyle(
                                color: Color(CustomColors.lightBlue),
                                fontSize: 16.0),
                          ),
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Image.asset(ConstRes.ambulanceIcon),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(CustomColors.white),
                          border: GradientBoxBorder(
                              gradient: LinearGradient(colors: [
                            Color(CustomColors.lightBlue),
                            Color(CustomColors.lightGreen),
                          ]))),
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ConstRes.closestEmergencyLocation.tr,
                            style: TextStyle(
                                color: Color(CustomColors.lightBlue),
                                fontSize: 16.0),
                          ),
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: Image.asset(ConstRes.amplifireicon),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(CustomColors.white),
                          border: GradientBoxBorder(
                              gradient: LinearGradient(colors: [
                            Color(CustomColors.lightBlue),
                            Color(CustomColors.lightGreen),
                          ]))),
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ConstRes.fastResponseTeam.tr,
                            style: TextStyle(
                                color: Color(CustomColors.lightBlue),
                                fontSize: 16.0),
                          ),
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: Image.asset(ConstRes.fastResponseTeamIcon),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(CustomColors.white),
                          border: GradientBoxBorder(
                              gradient: LinearGradient(colors: [
                            Color(CustomColors.lightBlue),
                            Color(CustomColors.lightGreen),
                          ]))),
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ConstRes.ourLocation.tr,
                            style: TextStyle(
                                color: Color(CustomColors.lightBlue),
                                fontSize: 16.0),
                          ),
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: Image.asset(ConstRes.locationIcon),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(CustomColors.white),
                          border: GradientBoxBorder(
                              gradient: LinearGradient(colors: [
                            Color(CustomColors.lightBlue),
                            Color(CustomColors.lightGreen),
                          ]))),
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ConstRes.yourOpinion.tr,
                            style: TextStyle(
                                color: Color(CustomColors.lightBlue),
                                fontSize: 16.0),
                          ),
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: Image.asset(ConstRes.opinionIcon),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(CustomColors.white),
                          border: GradientBoxBorder(
                              gradient: LinearGradient(colors: [
                            Color(CustomColors.lightBlue),
                            Color(CustomColors.lightGreen),
                          ]))),
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ConstRes.chat.tr,
                            style: TextStyle(
                                color: Color(CustomColors.lightBlue),
                                fontSize: 16.0),
                          ),
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: Image.asset(ConstRes.chatIcon),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
