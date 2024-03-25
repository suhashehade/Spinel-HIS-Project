import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class AvailableAppointment extends GetView<DoctorScreenController> {
  const AvailableAppointment({super.key});
  
  @override
  Widget build(BuildContext context) {
    Get.put(DoctorScreenController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => TableCalendar(
                  firstDay: DateTime.utc(2020, 6, 14),
                  lastDay: DateTime.utc(2030, 6, 14),
                  focusedDay: controller.today.value,
                  headerStyle: const HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) =>
                      isSameDay(day, controller.today.value),
                  onDaySelected: controller.onSelectedDay,
                  calendarStyle: const CalendarStyle(
                      holidayTextStyle: TextStyle(color: Colors.red)),
                )),
            Obx(() =>
                Text(controller.formatDate(controller.today.value.toString()))),
            Obx(() => controller.availableAppointments.isEmpty
                ? const Text('No available appointments')
                : Wrap(
                    children: controller.availableAppointments
                        .map(
                          (aa) => InkWell(
                            onTap: () {
                              controller.changeIsAppointmentSelected(aa);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: aa.isSelected.value
                                      ? Colors.green
                                      : Colors.white,
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.green)),
                              margin: const EdgeInsets.all(5.0),
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "${controller.formatTime(aa.fromTime, aa.dayDate)}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ))
          ],
        ),
      ),
    );
  }
}
