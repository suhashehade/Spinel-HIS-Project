import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:intl/intl.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      color: Color(CustomColors.pacificBlue),
      width: 500.0,
      height: 180.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "--",
                style: TextStyle(
                  color: Color(CustomColors.white),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style: TextStyle(
                  color: Color(CustomColors.white),
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "weatherMesurments".tr,
                style: TextStyle(
                  color: Color(CustomColors.white),
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "weatherSentence".tr,
                style: TextStyle(
                  color: Color(CustomColors.white),
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100.0,
            width: 100.0,
            child: Image.asset(
                "assets/images/fluent--weather-partly-cloudy-day-20-regular.png"),
          )
        ],
      ),
    );
  }
}
