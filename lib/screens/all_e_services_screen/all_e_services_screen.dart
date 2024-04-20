import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/all_e_services_screen/widgets/services_list.dart';
import 'package:his_project/screens/all_e_services_screen/widgets/weather.dart';
import 'package:his_project/utils/consts_res.dart';

class AllEServicesScreen extends StatelessWidget {
  const AllEServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ConstRes.eServices.tr),
      ),
      body: const SingleChildScrollView(
        child: Column(
         
          children: [
            Weather(),
            ServicesList(),
          ],
        ),
      ),
    );
  }
}
