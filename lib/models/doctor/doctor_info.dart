import 'package:get/get_navigation/src/root/internacionalization.dart';

class DoctorInfo implements Translations{
  String? genderEn = "";
  String? genderAr = "";
  String? nationalityEn = "";
  String? nationalityAr = "";
  String? descriptionEn = "";
  String? descriptionAr = "";

  DoctorInfo(
    this.genderEn,
    this.genderAr,
    this.nationalityEn,
    this.nationalityAr,
    this.descriptionEn,
    this.descriptionAr,
  );

  factory DoctorInfo.fromJson(dynamic json) {
    return DoctorInfo(
      json['genderEn'].toString() == "null" ? "" : json['genderEn'].toString(),
      json['genderAr'].toString() == "null" ? "" : json['genderAr'].toString(),
      json['nationalityEn'].toString() == "null"
          ? ""
          : json['nationalityEn'].toString(),
      json['nationalityAr'].toString() == "null"
          ? ""
          : json['nationalityAr'].toString(),
      json['descriptionEn'].toString() == "null"
          ? ""
          : json['descriptionEn'].toString(),
      json['descriptionEn'].toString() == "null"
          ? ""
          : json['descriptionAr'].toString(),
    );
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'gender': genderEn ?? '',
          'nationality': nationalityEn ?? '',
          'description': descriptionEn ?? '',
        },
        'ar': {
          'gender': genderAr ?? '',
          'nationality': nationalityAr ?? '',
          'description': descriptionAr ?? '',
        },
      };
}
