import 'package:flutter/material.dart';
import 'package:his_project/screens/doctor_screen/widgets/calendar.dart';

class DoctorAppointments extends StatelessWidget {
  const DoctorAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("Available Appointments"),
          Calendar(),
        ],
      ),
    );
  }
}
