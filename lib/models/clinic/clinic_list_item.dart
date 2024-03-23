import 'package:get/get.dart';

class ClinicItem {
  ClinicItem({
    required this.expandedValue,
    required this.headerValue,
    required this.isExpanded,
  });

  String expandedValue;
  String headerValue;
  RxBool isExpanded = false.obs;
}
