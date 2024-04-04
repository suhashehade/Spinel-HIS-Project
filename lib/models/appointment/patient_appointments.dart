class PatientAppointment {
  int id;
  String branchName;
  String doctorName;
  String patientName;
  String departmentName;
  String fromDate;
  String toDate;
  int? reasonId;
  String? statusName;
  int patientId;
  int doctorId;
  int departmentId;

  PatientAppointment(
    this.id,
    this.branchName,
    this.departmentName,
    this.doctorName,
    this.fromDate,
    this.toDate,
    this.patientName,
    this.departmentId,
    this.doctorId,
    this.patientId,
    this.statusName,
  );

  factory PatientAppointment.fromJson(dynamic json) {
    return PatientAppointment(
      json['id'] as int,
      json['branchName'].toString(),
      json['departmentName'].toString(),
      json['doctorName'].toString(),
      json['fromDate'].toString(),
      json['toDate'].toString(),
      json['patientName'].toString(),
      json['departmentId'] as int,
      json['doctorId'] as int,
      json['patientId'] as int,
      json['statusName'].toString(),
    );
  }
}
