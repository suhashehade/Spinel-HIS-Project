import 'package:get/get.dart';

class Branch implements Translations {
  int id;
  String label;
  String labelAr;

  Branch(this.id, this.label, this.labelAr);

  factory Branch.fromJson(dynamic json) {
    return Branch(json['value'] as int, json['label'].toString(),
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
