class AppointmentDetails {
  int id;
  String branchNameEn;
  String branchNameAr;
  String clinicNameEn;
  String clinicNameAr;
  String doctorNameEn;
  String doctorNameAr;
  String fromDate;
  String toDate;
  String reasonEn;
  String reasonAr;
  String statusEn;
  String statusAr;
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
    this.reasonEn,
    this.reasonAr,
    this.statusEn,
    this.statusAr,
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
      json['reasonEn'].toString() == "null" ? "" : json['reasonEn'].toString(),
      json['reasonAr'].toString() == "null" ? "" : json['reasonAr'].toString(),
      json['statusEn'].toString() == "null" ? "" : json['statusEn'].toString(),
      json['statusAr'].toString() == "null" ? "" : json['statusAr'].toString(),
      json['fromDate'].toString() == "null" ? "" : json['fromDate'].toString(),
      json['toDate'].toString() == "null" ? "" : json['toDate'].toString(),
      json['note'].toString() == "null" ? "" : json['note'].toString(),
    );
  }
}
