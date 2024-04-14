import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:his_project/utils/colors_res.dart';

class Service extends StatelessWidget {
  const Service({
    super.key,
    required this.serviceName,
    required this.serviceIcon,
  });
  final String serviceName;
  final String serviceIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: GradientBoxBorder(
            gradient: LinearGradient(colors: [
          Color(CustomColors.lightBlue),
          Color(CustomColors.lightGreen),
        ])),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(0.0),
            height: 50.0,
            width: 50.0,
            child: Image.asset(serviceIcon),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Text(
              serviceName,
              style: const TextStyle(fontSize: 12.0),
            ),
          ),
        ],
      )),
    );
  }
}
