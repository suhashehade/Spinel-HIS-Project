import 'package:get/get.dart';

class BranchDetails implements Translations {
  int id;
  String nameEn;
  String nameAr;

  BranchDetails(
    this.id,
    this.nameEn,
    this.nameAr,
  );

  factory BranchDetails.fromJson(dynamic json) {
    return BranchDetails(
      json['id'] as int,
      json['nameEn'].toString(),
      json['nameAr'].toString(),
    );
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'name': nameEn,
        },
        'ar': {
          'name': nameAr,
        },
      };
}
