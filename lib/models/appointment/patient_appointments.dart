import 'package:get/get.dart';

class PatientAppointment implements Translations {
  int id;
  String branchNameEn;
  String clinicNameEn;
  String doctorNameEn;
  String patientNameEn;
  String departmentNameEn;
  String fromDate;
  String toDate;
  int? reasonId;
  String statusNameEn;
  String statusNameAr;
  int patientId;
  int doctorId;
  int departmentId;
  String branchNameAr;
  String clinicNameAr;
  String doctorNameAr;
  String patientNameAr;
  String departmentNameAr;

  PatientAppointment(
    this.id,
    this.branchNameEn,
    this.clinicNameEn,
    this.doctorNameEn,
    this.patientNameEn,
    this.departmentNameEn,
    this.fromDate,
    this.toDate,
    this.reasonId,
    this.statusNameEn,
    this.patientId,
    this.doctorId,
    this.departmentId,
    this.branchNameAr,
    this.clinicNameAr,
    this.doctorNameAr,
    this.patientNameAr,
    this.departmentNameAr,
    this.statusNameAr,
  );

  factory PatientAppointment.fromJson(dynamic json) {
    return PatientAppointment(
      json['id'] as int,
      json['branchNameEn'].toString(),
      json['clinicNameEn'].toString(),
      json['doctorNameEn'].toString(),
      json['patientNameEn'].toString(),
      json['departmentNameEn'].toString(),
      json['fromDate'].toString(),
      json['toDate'].toString(),
      json['reasonId'] == null ? 0 : json['reasonId'] as int,
      json['statusNameEn'].toString(),
      json['patientId'] as int,
      json['doctorId'] as int,
      json['departmentId'] as int,
      json['branchNameAr'].toString(),
      json['clinicNameAr'].toString(),
      json['doctorNameAr'].toString(),
      json['patientNameAr'].toString(),
      json['departmentNameAr'].toString(),
      json['statusNameAr'].toString(),
    );
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'branchName': branchNameEn,
          'clinicName': clinicNameEn,
          "departmentName": departmentNameEn,
          "doctorName": doctorNameEn,
          "patientName": patientNameEn,
          "statusName": statusNameEn,
        },
        'ar': {
          'branchName': branchNameAr,
          'clinicName': clinicNameAr,
          "departmentName": departmentNameAr,
          "doctorName": doctorNameAr,
          "patientName": patientNameAr,
          "statusName": statusNameAr
        },
      };
}
