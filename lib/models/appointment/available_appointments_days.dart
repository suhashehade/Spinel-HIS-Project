class AvailableAppointmentsDays {
  bool isAvailable;
  String dayDate;

  AvailableAppointmentsDays(
    this.dayDate,
    this.isAvailable,
  );

  factory AvailableAppointmentsDays.fromJson(dynamic json) {
    return AvailableAppointmentsDays(
      json['dayDate'].toString(),
      json['isAvailable'] as bool,
    );
  }
}
