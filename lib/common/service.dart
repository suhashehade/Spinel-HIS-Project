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
  final Image serviceIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      height: MediaQuery.of(context).size.width * 0.20,
      width: MediaQuery.of(context).size.width * 0.20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: const GradientBoxBorder(
            gradient: LinearGradient(colors: [
          CustomColors.lightBlue,
          CustomColors.lightGreen,
        ])),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(0.0),
            height: MediaQuery.of(context).size.width * 0.15,
            width: MediaQuery.of(context).size.width * 0.20,
            child: serviceIcon,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Text(
              serviceName,
              style: const TextStyle(
                  fontSize: 12.0, color: CustomColors.lightBlue),
            ),
          ),
        ],
      )),
    );
  }
}
