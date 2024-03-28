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
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, day, events) {
                      final hasEvent = controller.events
                          .any((element) => element[day.toLocal()] != null);
                      return hasEvent
                          ? Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              height: 5.0,
                              width: 5.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            )
                          : const SizedBox();
                    },
                  ),
                  firstDay: DateTime.parse("2024-02-25T00:00:00").toUtc(),
                  lastDay: DateTime.parse("2030-04-06T00:00:00").toUtc(),
                  focusedDay: controller.today.value,
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) =>
                      isSameDay(day, controller.today.value),
                  onDaySelected: controller.onSelectedDay,
                  eventLoader: (day) {
                    return controller.events
                        .where((element) =>
                            element[day.toLocal()] == day.toLocal())
                        .toList();
                  },
                )),
            Obx(() =>
                Text(controller.formatDate(controller.today.value.toString()))),
            Obx(() => controller.availableAppointments.isEmpty
                ? const Center(child: Text('No available appointments'))
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      children: controller.availableAppointments
                          .map(
                            (aa) => InkWell(
                              onTap: () {
                                controller.changeIsAppointmentSelected(aa);
                                if (aa.isSelected.value) {
                                  controller.reserveArguments.value.fromDate =
                                      controller
                                          .makeDate(aa.fromTime)
                                          .toString();
                                  controller.reserveArguments.value.toDate =
                                      controller.makeDate(aa.toTime).toString();
                                } else {
                                  controller.reserveArguments.value.fromDate =
                                      '';
                                  controller.reserveArguments.value.toDate = '';
                                }
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
                                  "${controller.formatTime(aa.fromTime)}",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )),
            MaterialButton(
              onPressed: () {
                controller.goToReserveAssurence();
              },
              color: Colors.amber,
              child: const Text("Reserve an appointment"),
            ),
          ],
        ),
      ),
    );
  }
}
