class DoctorInfo {
  String? gender = "";
  String? nationality = "";
  String? description = "";

  DoctorInfo(
    this.gender,
    this.nationality,
    this.description,
  );

  factory DoctorInfo.fromJson(dynamic json) {
    return DoctorInfo(
      json['genderEn'].toString() == "null" ? "" : json['genderEn'].toString(),
      json['nationalityEn'].toString() == "null"
          ? ""
          : json['nationalityEn'].toString(),
      json['descriptionEn'].toString() == "null"
          ? ""
          : json['descriptionEn'].toString(),
    );
  }
}
