import 'package:get/get.dart';

class AppointmentDetails implements Translations{
  int id;
  String clinicNameEn;
  String clinicNameAr;
  String branchNameEn;
  String branchNameAr;
  String doctorNameEn;
  String doctorNameAr;
  String fromDate;
  String toDate;
  String reasonNameEn;
  String reasonNameAr;
  String statusNameEn;
  String statusNameAr;
  String createDate;
  String patientNameEn;
  String patientNameAr;
  String departmentNameEn;
  String departmentNameAr;
  String note;

  AppointmentDetails(
    this.id,
    this.branchNameEn,
    this.branchNameAr,
    this.clinicNameEn,
    this.clinicNameAr,
    this.departmentNameEn,
    this.departmentNameAr,
    this.doctorNameEn,
    this.doctorNameAr,
    this.patientNameEn,
    this.patientNameAr,
    this.reasonNameEn,
    this.reasonNameAr,
    this.statusNameEn,
    this.statusNameAr,
    this.createDate,
    this.fromDate,
    this.toDate,
    this.note,
  );

  factory AppointmentDetails.fromJson(dynamic json) {
    return AppointmentDetails(
      json['id'] as int,
      json['branchNameEn'].toString() == "null"
          ? ""
          : json['branchNameEn'].toString(),
      json['branchNameAr'].toString() == "null"
          ? ""
          : json['branchNameAr'].toString(),
      json['clinicNameEn'].toString() == "null"
          ? ""
          : json['clinicNameEn'].toString(),
      json['clinicNameAr'].toString() == "null"
          ? ""
          : json['clinicNameAr'].toString(),
      json['departmentNameEn'].toString() == "null"
          ? ""
          : json['departmentNameEn'].toString(),
      json['departmentNameAr'].toString() == "null"
          ? ""
          : json['departmentNameAr'].toString(),
      json['doctorNameEn'].toString() == "null"
          ? ""
          : json['doctorNameEn'].toString(),
      json['doctorNameAr'].toString() == "null"
          ? ""
          : json['doctorNameAr'].toString(),
      json['patientNameEn'].toString() == "null"
          ? ""
          : json['patientNameEn'].toString(),
      json['patientNameAr'].toString() == "null"
          ? ""
          : json['patientNameAr'].toString(),
      json['reasonNameEn'].toString() == "null"
          ? ""
          : json['reasonNameEn'].toString(),
      json['reasonNameAr'].toString() == "null"
          ? ""
          : json['reasonNameAr'].toString(),
      json['statusNameEn'].toString() == "null"
          ? ""
          : json['statusNameEn'].toString(),
      json['statusNameAr'].toString() == "null"
          ? ""
          : json['statusNameAr'].toString(),
      json['createDate'] == 'null' ? "" : json['createDate'].toString(),
      json['fromDate'].toString() == "null" ? "" : json['fromDate'].toString(),
      json['toDate'].toString() == "null" ? "" : json['toDate'].toString(),
      json['note'].toString() == "null" ? "" : json['note'].toString(),
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
          "reasonName": reasonNameEn,
        },
        'ar': {
          'branchName': branchNameAr,
          'clinicName': clinicNameAr,
          "departmentName": departmentNameAr,
          "doctorName": doctorNameAr,
          "patientName": patientNameAr,
          "statusName": statusNameAr,
          "reasonName": reasonNameAr,
        },
      };
}
