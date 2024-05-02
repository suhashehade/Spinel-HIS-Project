import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/sidebar/sidebar_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/lists.dart';
import 'package:his_project/utils/pages_names.dart';

class CustomSidebar extends StatelessWidget {
  const CustomSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    SidebarController sidebarController = Get.put(SidebarController());

    return Drawer(
        width: 300.0,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                  child: PrefsService.to.getString(ConstRes.phoneKey) != null
                      ? ListView(
                          children: [
                            Obx(
                              () => SizedBox(
                                height: 40.0,
                                width: 40.0,
                                child: sidebarController.loginScreenController
                                                .patient.value.profilePic ==
                                            "null" ||
                                        sidebarController.loginScreenController
                                                .patient.value.profilePic ==
                                            ''
                                    ? ConstAssets.userIcon
                                    : Image.asset(sidebarController
                                        .loginScreenController
                                        .patient
                                        .value
                                        .profilePic!),
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(
                                  () => Text(
                                    sidebarController
                                        .patient.value.keys[PrefsService.to
                                            .getString(ConstRes.langkey) ??
                                        Get.locale
                                            ?.languageCode]![ConstRes.nameKey]!,
                                    style: const TextStyle(
                                      color: CustomColors.lightBlue,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    "${ConstRes.mrn.tr}: ${sidebarController.patient.value.manualUserId}",
                                    style: const TextStyle(
                                      color: CustomColors.lightBlue,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 30.0,
                              width: 30.0,
                              child: ConstAssets.doctorIcon,
                            ),
                            const SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              ConstRes.callToAction.tr,
                              style: const TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                ),
              ),
              ListTile(
                title: InkWell(
                  onTap: () {},
                  child: Container(
                    color: sidebarController.isActive.value
                        ? CustomColors.grey
                        : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ConstAssets.familyFilesIconDark,
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              ConstRes.myFamily.tr,
                              style: const TextStyle(
                                color: CustomColors.lightBlue,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        Get.locale?.languageCode == 'en'
                            ? SizedBox(
                                height: 30.0,
                                width: 30.0,
                                child: ConstAssets.rightArrowIcon,
                              )
                            : SizedBox(
                                height: 30.0,
                                width: 30.0,
                                child: ConstAssets.leftArrowIcon,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                title: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: ConstAssets.notificationIconDark,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        ConstRes.notifications.tr,
                        style: const TextStyle(
                          color: CustomColors.lightBlue,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: ConstAssets.settingsIcon,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        ConstRes.settings.tr,
                        style: const TextStyle(
                          color: CustomColors.lightBlue,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: ConstAssets.privacyPolicyIcon,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        ConstRes.privacyPolicy.tr,
                        style: const TextStyle(
                          color: CustomColors.lightBlue,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: ConstAssets.privacyPolicyIcon,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        ConstRes.contracts.tr,
                        style: const TextStyle(
                          color: CustomColors.lightBlue,
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
                    Get.toNamed(PagesNames.languagesScreen);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.language,
                        color: CustomColors.black,
                        size: 30.0,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        ConstRes.language.tr,
                        style: const TextStyle(
                          color: CustomColors.lightBlue,
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
                    sidebarController.logout();
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        color: CustomColors.black,
                        size: 30.0,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        ConstRes.logout.tr,
                        style: const TextStyle(
                          color: CustomColors.lightBlue,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "evaluation".tr,
                    style: const TextStyle(
                      color: CustomColors.lightBlue,
                      fontSize: 20.0,
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 150.0,
                      child: Row(children: [...Lists.starsList]),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 80.0,
                    width: 200.0,
                    child: ConstAssets.companyLogo,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
