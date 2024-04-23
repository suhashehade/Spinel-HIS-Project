import 'package:get/get.dart';

class User implements Translations {
  int id;
  String? manualUserId;
  String nameEn;
  String nameAr;
  String? profilePic;
  String? phone1;
  String? tel1;
  String? addressEn;
  String? addressAr;
  String? email;
  String? website;
  bool isActive;
  String idNumber;
  int userType;
  String birthDate;

  User(
    this.id,
    this.manualUserId,
    this.nameEn,
    this.nameAr,
    this.profilePic,
    this.phone1,
    this.tel1,
    this.addressEn,
    this.addressAr,
    this.email,
    this.website,
    this.isActive,
    this.idNumber,
    this.userType,
    this.birthDate,
  );

  factory User.fromJson(dynamic json) {
    return User(
      json['id'] as int,
      json['manualUserId'].toString(),
      json['nameEn'].toString(),
      json['nameAr'].toString(),
      json['profilePic'].toString(),
      json['phone1'].toString(),
      json['tel1'].toString(),
      json['addressEn'].toString(),
      json['addressAr'].toString(),
      json['email'].toString(),
      json['website'].toString(),
      json['isActive'] as bool,
      json['idNumber'].toString(),
      json['userType'] as int,
      json['birthDate'].toString(),
    );
  }
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'name': nameEn,
          'address': addressEn ?? '',
        },
        'ar': {
          'name': nameAr,
          'address': addressAr ?? '',
        },
      };
}
