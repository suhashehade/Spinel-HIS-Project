import 'package:flutter/material.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.backWidget});
  final Widget backWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(CustomColors.white),
      title: Container(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        height: 80.0,
        width: 150.0,
        child: Image.asset(ConstRes.companyLogo),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.all(0.0),
          height: 30.0,
          width: 30.0,
          margin: const EdgeInsets.all(15.0),
          child: Image.asset(ConstRes.notificationIcon),
        ),
        backWidget,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
