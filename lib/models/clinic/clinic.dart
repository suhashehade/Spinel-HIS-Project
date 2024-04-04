class Clinic {
  int id;
  String nameEn;
  String nameAr;
  String departmentTypeEn;
  String visitTypeEn;

  Clinic(
    this.id,
    this.nameEn,
    this.nameAr,
    this.departmentTypeEn,
    this.visitTypeEn,
  );

  factory Clinic.fromJson(dynamic json) {
    return Clinic(
      json['id'] as int,
      json['nameEn'].toString(),
      json['nameAr'].toString(),
      json['departmentTypeEn'].toString(),
      json['visitTypeEn'].toString(),
    );
  }
}
