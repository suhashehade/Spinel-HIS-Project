import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/screens/doctor_screen/doctor_screen_controller.dart';
import 'package:his_project/utils/colors_res.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:table_calendar/table_calendar.dart';

class AvailableAppointment extends StatelessWidget {
  const AvailableAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorScreenController doctorScreenController =
        Get.put(DoctorScreenController());

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Obx(
              () => SizedBox(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width * 0.75,
                child: TableCalendar(
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, day, events) {
                      final hasEvent = doctorScreenController.events
                          .any((element) => element.isAvailable == true);
                      return hasEvent
                          ? Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              height: 5.0,
                              width: 5.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(CustomColors.green),
                              ),
                            )
                          : const SizedBox();
                    },
                  ),
                  firstDay: DateTime.now(),
                  lastDay: DateTime.parse(ConstRes.lastDay).toUtc(),
                  focusedDay: doctorScreenController.today.value,
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  availableGestures: AvailableGestures.none,
                  selectedDayPredicate: (day) =>
                      isSameDay(day, doctorScreenController.today.value),
                  onDaySelected: doctorScreenController.onSelectedDay,
                  eventLoader: doctorScreenController.checkMarker,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Obx(() => Text(
                  doctorScreenController.formatDate(
                      doctorScreenController.today.value.toString()),
                  style: TextStyle(
                    color: Color(CustomColors.black),
                    fontSize: 16.0,
                  ),
                )),
            Obx(() => doctorScreenController.availableAppointments.isEmpty
                ? Center(
                    child: Text(
                    ConstRes.noAvailableAppointmentsError.tr,
                    style: TextStyle(
                      color: Color(CustomColors.lightBlue),
                      fontSize: 16.0,
                    ),
                  ))
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      children: doctorScreenController.availableAppointments
                          .map(
                            (aa) => InkWell(
                              onTap: () {
                                doctorScreenController.reserve(aa);
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
                                        "${doctorScreenController.formatTime(aa.fromTime)}",
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                          )
                          .toList(),
                    ),
                  )),
            doctorScreenController.availableAppointments.isNotEmpty
                ? MaterialButton(
                    onPressed: () {
                      doctorScreenController.goToReserveConfirmation();
                    },
                    color: Color(CustomColors.lightGreen),
                    child: Text(ConstRes.reserveAppointment.tr),
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }
}
