import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/utils/colors_res.dart';

// ignore: must_be_immutable
class SubAppBar extends StatelessWidget {
  SubAppBar({super.key, required this.handleReturn, required this.title});
  Function handleReturn;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 10.0),
      padding: const EdgeInsets.all(5.0),
      height: 50.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(CustomColors.lightGreen),
            Color(CustomColors.lightBlue),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  handleReturn();
                },
                alignment: Alignment.topLeft,
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(CustomColors.white),
                ),
              ),
              Text(
                title.tr,
                style: TextStyle(
                  color: Color(CustomColors.white),
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          Icon(
            Icons.home,
            size: 30.0,
            color: Color(CustomColors.white),
          ),
        ],
      ),
    );
  }
}
