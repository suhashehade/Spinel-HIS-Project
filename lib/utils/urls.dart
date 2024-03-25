import 'package:his_project/utils/consts_res.dart';

class Urls {
  static String loginUrl = '${ConstRes.baseUrl}/Account/Login';
  static String getClinicsUrl =
      '${ConstRes.baseUrl}/Management/DepartmentsList?Page=1&PageSize=1000';
  static String lkps = "${ConstRes.baseUrl}/AutoComplete/Lookups?";
  static String logicUrl = '${ConstRes.baseUrl}/HISLogic/';
}
