class PatientAppointment {
  String branchName;
  String doctorName;
  String patientName;
  String departmentName;
  String fromDate;
  String toDate;
  int reasonId;
  String statusName;
  int patientId;
  int doctorId;
  int departmentId;

  PatientAppointment({
    required this.branchName,
    required this.departmentName,
    required this.doctorName,
    required this.fromDate,
    required this.toDate,
    required this.patientName,
    required this.departmentId,
    required this.doctorId,
    required this.patientId,
    required this.reasonId,
    required this.statusName,
  });
}
