import 'package:get/get.dart';

class Doctor implements Translations {
  int id;
  String label;
  String labelAr;

  Doctor(this.id, this.label, this.labelAr);

  factory Doctor.fromJson(dynamic json) {
    return Doctor(json['value'] as int, json['label'].toString(),
        json['labelAr'].toString());
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'label': label,
        },
        'ar': {
          'label': labelAr,
        },
      };
}
