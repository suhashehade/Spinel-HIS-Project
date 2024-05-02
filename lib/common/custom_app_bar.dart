import 'package:flutter/material.dart';
import 'package:his_project/utils/assets.dart';
import 'package:his_project/utils/colors_res.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.backWidget});
  final Widget backWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: CustomColors.lightGreen,
      centerTitle: true,
      backgroundColor: CustomColors.white,
      title: Container(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        height: 80.0,
        width: 150.0,
        child: ConstAssets.companyLogo,
      ),
      actions: [
        Container(
          padding: const EdgeInsets.all(0.0),
          height: 30.0,
          width: 30.0,
          margin: const EdgeInsets.all(15.0),
          child: ConstAssets.notificationIcon,
        ),
        backWidget,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
