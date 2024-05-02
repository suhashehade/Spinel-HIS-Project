import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:intl/intl.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      color: CustomColors.pacificBlue,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ConstRes.weatherDash,
                style: const TextStyle(
                  color: CustomColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                ConstRes.weatherMesurments.tr,
                style: const TextStyle(
                  color: CustomColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                ConstRes.weatherSentence.tr,
                style: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80.0,
            width: 80.0,
            child: ConstAssets.weatherIcon,
          )
        ],
      ),
    );
  }
}
