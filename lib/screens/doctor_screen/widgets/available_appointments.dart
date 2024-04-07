import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:table_calendar/table_calendar.dart';

class AvailableAppointment extends GetView<DoctorScreenController> {
  const AvailableAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorScreenController());

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 600.0,
          child: Column(
            children: [
              Obx(() => TableCalendar(
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, day, events) {
                        final hasEvent = controller.events
                            .any((element) => element.isAvailable == true);
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
                    firstDay: DateTime.now(),
                    lastDay: DateTime.parse("2030-06-06T00:00:00").toUtc(),
                    focusedDay: controller.today.value,
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) =>
                        isSameDay(day, controller.today.value),
                    onDaySelected: controller.onSelectedDay,
                    eventLoader: controller.checkMarker,
                  )),
              const SizedBox(
                height: 10.0,
              ),
              Obx(() => Text(
                  controller.formatDate(controller.today.value.toString()))),
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
                                  // controller.onTimeSelected(aa);
                                  if (aa.isSelected.value) {
                                    controller.reserveArguments.value.fromDate =
                                        controller
                                            .makeDate(aa.fromTime)
                                            .toIso8601String();
                                    controller.reserveArguments.value.toDate =
                                        controller
                                            .makeDate(aa.toTime)
                                            .toIso8601String();
                                  } else {
                                    // controller.reserveArguments.value.fromDate =
                                    //     '';
                                    // controller.reserveArguments.value.toDate =
                                    //     '';
                                  }
                                },
                                child: aa.status == 0
                                    ? Container(
                                        decoration: BoxDecoration(
                                            color: aa.isSelected.value
                                                ? Color(CustomColors.lightGreen)
                                                : Color(CustomColors.white),
                                            border: Border.all(
                                                style: BorderStyle.solid,
                                                color: Color(
                                                    CustomColors.lightGreen))),
                                        margin: const EdgeInsets.all(5.0),
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "${controller.formatTime(aa.fromTime)}",
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : const SizedBox(),
                              ),
                            )
                            .toList(),
                      ),
                    )),
              controller.availableAppointments.isNotEmpty
                  ? MaterialButton(
                      onPressed: () {
                        controller.goToReserveAssurence();
                      },
                      color: Color(CustomColors.lightGreen),
                      child: const Text("Reserve an appointment"),
                    )
                  : const Text(""),
            ],
          ),
        ),
      ),
    );
  }
}
