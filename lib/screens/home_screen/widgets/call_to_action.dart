import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/home_screen/home_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(CustomColors.lightGreen),
            Color(CustomColors.lightBlue),
          ],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width * 0.20,
            height: MediaQuery.of(context).size.width * 0.20,
            child: Image.asset(ConstRes.homeCallToAcationIcon),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text(
                ConstRes.myMedicalFile.tr,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color(CustomColors.white),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 160.0,
                child: Text(
                  ConstRes.callToAction.tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(CustomColors.white),
                    height: 1.0,
                  ),
                ),
              ),
              MaterialButton(
                color: Color(CustomColors.white),
                height: 20,
                onPressed: () {
                  homeScreenController.login();
                },
                child: Text(
                  ConstRes.login.tr,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(CustomColors.pacificBlue),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
