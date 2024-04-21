import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;

class DoctoAPI {
  static Map<String, String> headers = {
    "Content-Type": "application/json; charset=utf-8",
  };
  static Map<String, String> getHeaders(Map<String, String> content) {
    if (PrefsService.to.getString(ConstRes.tokenKey) != null) {
      String? token = PrefsService.to.getString(ConstRes.tokenKey);
      headers['Authorization'] = 'Bearer $token';
    }
    if (content.isNotEmpty) {
      headers.addAll(content);
    }
    return headers;
  }

  static Future getDoctorsAPI(branchId, depId) async {
    http.Response response = await http.get(
      Uri.parse(
          "${Urls.getDoctors}BranchId=$branchId&DepartmentId=$depId&UserTypeId=2"),
      headers: headers,
    );
    return response;
  }

  static Future getDoctorInfoAPI(doctorId) async {
    http.Response response = await http.get(
      Uri.parse("${Urls.getDoctorInfo}Id=$doctorId"),
      headers: headers,
    );
    return response;
  }
}
