class UserCredintals {
  String? _userName;
  String? _password;

  UserCredintals({String? userName, String? password}) {
    _userName = userName;
    _password = password;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> userMap = {};
    userMap['userName'] = _userName;
    userMap['password'] = _password;
    return userMap;
  }

  UserCredintals fromJson(Map<String, dynamic> userMap) {
    return UserCredintals(
        userName: userMap['userName'], password: userMap['password']);
  }

  String? get userName => _userName;
  String? get password => _password;
}

class LoginResponse {
  String? _token;
  Map<String, dynamic>? _lstError;

  LoginResponse({String? token, Map<String, dynamic>? lstError}) {
    _token = token;
    _lstError = lstError;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonRes = {};
    jsonRes['token'] = _token;
    jsonRes['lstError'] = _lstError;
    return jsonRes;
  }

  LoginResponse fromJson(Map<String, dynamic> jsonRes) {
    return LoginResponse(
        token: jsonRes['token'], lstError: jsonRes['lstError']);
  }

  String? get token => _token;
  Map<String, dynamic>? get lstError => _lstError;
}
