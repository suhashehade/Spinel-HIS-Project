import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;

class ClinicAPI {
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

  static Future getClinicsAPI() async {
    http.Response response = await http.get(
      Uri.parse(Urls.getClinics),
      headers: getHeaders(headers),
    );

    return response;
  }
}
