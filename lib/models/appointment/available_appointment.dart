import 'package:get/get.dart';

class AvailableAppointment {
  String dayDate;
  String fromTime;
  String toTime;
  RxBool isSelected;

  AvailableAppointment({
    required this.dayDate,
    required this.fromTime,
    required this.toTime,
    required this.isSelected
  });
}
