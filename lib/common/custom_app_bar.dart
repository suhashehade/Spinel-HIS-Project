import 'package:flutter/material.dart';
import 'package:his_project/utils/colors_res.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.backWidget});
  final Widget backWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(CustomColors.white),
      title: Container(
        padding: const EdgeInsets.all(0.0),
        height: 70.0,
        width: 200.0,
        child: Image.asset("assets/images/spinel_logo.png"),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.all(0.0),
          height: 30.0,
          width: 30.0,
          child: Image.asset("assets/images/notification_icon.png"),
        ),
        backWidget,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
