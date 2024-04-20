import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/screens/doctors_list_screen/doctors_list_screen_controller.dart';
import 'package:his_project/screens/login_screen/login_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/pages_names.dart';

class CustomSidebar extends StatelessWidget {
  const CustomSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    LoginScreenController loginScreenController =
        Get.put(LoginScreenController());

    return Drawer(
        width: 300.0,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: Image.asset(ConstRes.logoIcon),
                        ),
                        Text(
                          ConstRes.appName,
                          style: TextStyle(
                            color: Color(CustomColors.lightBlue),
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    )),
              ),
              ListTile(
                title: InkWell(
                  onTap: () {
                    Get.back();
                    Get.delete<DoctorsListScreenController>();
                    Get.delete<DoctorScreenController>();
                    Get.toNamed(PagesNames.languagesScreen);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: Color(
                          CustomColors.lightBlue,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        ConstRes.language.tr,
                        style: TextStyle(
                          color: Color(
                            CustomColors.lightBlue,
                          ),
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: InkWell(
                  onTap: () {
                    Get.back();
                    loginScreenController.logout();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Color(
                          CustomColors.lightBlue,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        ConstRes.logout.tr,
                        style: TextStyle(
                          color: Color(
                            CustomColors.lightBlue,
                          ),
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
