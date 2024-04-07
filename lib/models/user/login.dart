class UserCredintals {
  int? _loginMethod;
  String? _phone;
  String? _password;
  String? _nationalId;
  String? _mrn;

  UserCredintals(
      {int? loginMethod,
      String? nationalId,
      String? phone,
      String? password,
      String? mrn}) {
    _loginMethod = loginMethod;
    _nationalId = nationalId;
    _phone = phone;
    _mrn = mrn;
    _password = password;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> userMap = {};
    userMap['loginMethod'] = _loginMethod;
    userMap['nationalId'] = _nationalId;
    userMap['phone'] = _phone;
    userMap['mrn'] = _mrn;
    userMap['password'] = _password;
    return userMap;
  }

  UserCredintals fromJson(Map<String, dynamic> userMap) {
    return UserCredintals(
      loginMethod: userMap['loginMethod'],
      nationalId: userMap['nationalId'],
      phone: userMap['phone'],
      password: userMap['password'],
      mrn: userMap['mrn'],
    );
  }

  String? get nationalId => _nationalId;
  String? get mrn => _mrn;
  String? get phone => _phone;
  String? get password => _password;
}

class LoginResponse {
  String? _token;
  List? _lstError;

  LoginResponse(this._token, this._lstError);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonRes = {};
    jsonRes['token'] = _token;
    jsonRes['lstError'] = _lstError;

    return jsonRes;
  }

  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(
      json['token'].toString(),
      json['lstError'] as List,
    );
  }

  String? get token => _token;
  List? get lstError => _lstError;
}
