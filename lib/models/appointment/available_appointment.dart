import 'package:get/get.dart';

class AvailableAppointment {
  String dayDate;
  String fromTime;
  String toTime;
  int status;
  RxBool isSelected;

  AvailableAppointment(
      this.dayDate, this.fromTime, this.toTime, this.status, this.isSelected);

  factory AvailableAppointment.fromJson(dynamic json) {
    return AvailableAppointment(
      json['dayDate'].toString(),
      json['fromTime'].toString(),
      json['toTime'].toString(),
      json['status'] as int,
      false.obs,
    );
  }
}
