import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/doctor/doctor.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen.dart';

// ignore: must_be_immutable
class DocotrsListScreen extends StatelessWidget {
  DocotrsListScreen({super.key});
  List<Doctor> doctors = Get.arguments['doctors'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: doctors
              .map((d) => InkWell(
                    onTap: () {
                      Get.to(() => const DoctorInfoScreen(),
                          arguments: {"doctor": d});
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Image(image: NetworkImage(d.image)),
                          Center(
                            child: Text(d.name),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
