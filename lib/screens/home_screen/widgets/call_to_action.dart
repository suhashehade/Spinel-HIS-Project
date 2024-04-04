import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/colors_res.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 150.0,
      width: 500.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(CustomColors.lightGreen),
            Color(CustomColors.lightBlue),
          ],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'ملفي الطبي',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "لتصفح ملفك الطبي", // textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  height: 1.0,
                ),
              ),
              const Text(
                "الرجاء تسجيل الدخول", // textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  height: 1.0,
                ),
              ),
              const Text(
                "أو انشاء حساب جديد", // textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.0,
                  color: Colors.white,
                ),
              ),
              MaterialButton(
                color: Colors.white,
                height: 20,
                onPressed: () {
                  PrefsService.to.setInt("afterLogin", 8);
                  Get.toNamed('/preLogin');
                },
                child: Text(
                  'دخول',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(CustomColors.pacificBlue),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(0),
            width: 200,
            height: 100,
            child: Image.asset("assets/images/call_to_action_icon.png"),
          )
        ],
      ),
    );
  }
}
