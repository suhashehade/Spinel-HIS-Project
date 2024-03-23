import 'package:flutter/material.dart';
import 'package:his_project/screens/home_screen/widgets/call_to_action.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
      color: const Color.fromARGB(255, 234, 234, 234),
      margin: const EdgeInsets.all(0),
      child: const Column(
        children: <Widget>[
          CallToAction(),
        ],
      ),
    );
  }
}
