import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/home_screen/home_screen_controller.dart';
import 'package:his_project/screens/login_screen/login_screen_controller.dart';

class CustomSidebar extends GetView<HomeScreenController> {
  const CustomSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    LoginScreenController loginScreenController =
        Get.put(LoginScreenController());
    return Drawer(
        width: 200.0,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const DrawerHeader(
                child: Center(
                  child: Text('Registration App'),
                ),
              ),
              ListTile(
                title: const Text('Users'),
                onTap: () {
                  // Get.back();
                  // controller.toggleCurrentPage('users');
                },
              ),
              ListTile(
                title: const Text('Orders'),
                onTap: () {
                  // Get.back();
                  // controller.toggleCurrentPage('orders');
                },
              ),
              ListTile(
                title: const Text('Currencies'),
                onTap: () {
                  // Get.back();
                  // controller.toggleCurrentPage('currencies');
                },
              ),
              ListTile(
                title: IconButton(
                  onPressed: () {
                    Get.back();
                    loginScreenController.logout();
                  },
                  icon: const Icon(Icons.logout),
                ),
              )
            ],
          ),
        ));
  }
}
