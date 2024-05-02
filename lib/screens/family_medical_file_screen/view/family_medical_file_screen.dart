import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/designed_btn.dart';
import 'package:his_project/screens/family_medical_file_screen/view/widgets/allowed_people_list.dart';
import 'package:his_project/screens/family_medical_file_screen/view/widgets/sent_requests_list.dart';
import 'package:his_project/screens/family_medical_file_screen/view/widgets/allowed_people_pending_list.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class FamilyMedicalFileScreen extends StatelessWidget {
  const FamilyMedicalFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  CustomColors.lightGreen,
                  CustomColors.lightBlue,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      ConstRes.familyFiles.tr,
                      style: const TextStyle(
                        color: CustomColors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.home,
                  size: 30.0,
                  color: CustomColors.white,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DesignedButton(
                          title: ConstRes.myFamily,
                          handle: () {},
                          backGround: CustomColors.white),
                      DesignedButton(
                          title: ConstRes.addRequests,
                          handle: () {},
                          backGround: CustomColors.grey),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: AllowedPeoplePendingList(),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: SentRequestsList(),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: AllowedPeopleList(),
          ),
          DesignedButton(
            title: ConstRes.addNewMember,
            handle: () {},
            backGround: CustomColors.white,
          )
        ],
        // child: ,
      ),
    );
  }
}
