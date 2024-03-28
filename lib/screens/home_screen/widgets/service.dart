import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  const Service({super.key, required this.serviceName});
  final String serviceName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 60.0,
      width: 130.0,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 43, 43, 43),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 108, 108, 108),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(120.0),
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Text(serviceName),
      ),
    );
  }
}
