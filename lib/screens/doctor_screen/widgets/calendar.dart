import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends GetView<DoctorScreenController> {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(DoctorScreenController(Doctor(id: 0, label: label, depId: depId, branchId: branchId)));
    return Obx(() => TableCalendar(
          firstDay: controller.currentDate.value == ''
              ? DateTime.now()
              : DateTime.parse(controller.currentDate.value),
          lastDay: DateTime.utc(2030, 6, 14),
          focusedDay: controller.today.value,
          headerStyle: const HeaderStyle(
              formatButtonVisible: false, titleCentered: true),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, controller.today.value),
          onDaySelected: controller.onSelectedDay,
          calendarStyle: const CalendarStyle(
              holidayTextStyle: TextStyle(color: Colors.red)),
        ));
  }
}
