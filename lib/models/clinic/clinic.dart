import 'package:get/get_navigation/src/root/internacionalization.dart';

class Clinic implements Translations {
  int id;
  String nameEn;
  String nameAr;
  String departmentTypeEn;
  String departmentTypeAr;
  String visitTypeEn;
  String visitTypeAr;

  Clinic(
    this.id,
    this.nameEn,
    this.nameAr,
    this.departmentTypeEn,
    this.departmentTypeAr,
    this.visitTypeEn,
    this.visitTypeAr,
  );

  factory Clinic.fromJson(dynamic json) {
    return Clinic(
      json['id'] as int,
      json['nameEn'].toString(),
      json['nameAr'].toString(),
      json['departmentTypeEn'].toString(),
      json['departmentTypeAr'].toString(),
      json['visitTypeEn'].toString(),
      json['visitTypeAr'].toString(),
    );
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'name': nameEn,
          'departmentType': departmentTypeEn,
          'visitType': visitTypeEn,
        },
        'ar': {
          'name': nameAr,
          'departmentType': departmentTypeAr,
          'visitType': visitTypeAr,
        },
      };
}
