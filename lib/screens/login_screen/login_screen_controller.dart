import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/user/login.dart';
import 'package:his_project/models/user/user.dart';
import 'package:his_project/screens/login_options_screen/login_options_screen_controller.dart';
import 'package:his_project/screens/reservation_assurence_screen/reservation_assurence_screen_controller.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/messages.dart';
import 'package:his_project/utils/pages_names.dart';
import 'package:his_project/utils/urls.dart';
import 'package:http/http.dart' as http;

class LoginScreenController extends GetxController {
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController mrnController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ReservationAssurenceScreenController reservationAssurenceScreenController =
      Get.put(ReservationAssurenceScreenController());
  RxBool isLogin = false.obs;
  RxMap<String, dynamic> listError = <String, dynamic>{}.obs;
  RxString error = ''.obs;
  RxBool isChecked = false.obs;
  LoginOptionsScreenController loginOptionsScreenController =
      Get.put(LoginOptionsScreenController());
  int? option;
  Rx<User> patient = User(id: 0, phone: "").obs;

  toggleChecked(value) {
    isChecked.value = value;
  }

  rememberMe(String phone, bool? value) async {
    if (value == true) {
      await PrefsService.to.setString("phone", phone);
    } else {
      if (PrefsService.to.getString("phone") != null) {
        PrefsService.to.remove("phone");
      }
    }
    toggleChecked(value);
  }

  logout() {
    if (PrefsService.to.getString('phone') != null ||
        PrefsService.to.getString('idNumber') != null) {
      PrefsService.to.remove('phone');
      PrefsService.to.remove('idNumber');
    }
    PrefsService.to.remove('token');
    PrefsService.to.remove('id');
    PrefsService.to.remove('afterLogin');

    isLogin.value = false;
    Get.offNamed(PagesNames.root);
    
  }

  login(UserCredintals userCredintals) async {
    http.Response response = await http.post(
      Uri.parse("${Urls.account}OtherLogin"),
      headers: {
        "accept": "*/*",
        "Content-Type": "application/json-patch+json",
        "charset": "utf-8"
      },
      body: jsonEncode(
        {
          "loginMethod": loginOptionsScreenController.option.value,
          "password": userCredintals.password,
          "phone": userCredintals.phone,
          "mrn": userCredintals.mrn ?? "",
          "nationalId": userCredintals.nationalId ?? ""
        },
      ),
    );
    if (jsonDecode(response.body)['token'] == null) {
      error.value = jsonDecode(response.body)['lstError'][0];

      return;
    }
    LoginResponse loginResponse = LoginResponse(
        token: jsonDecode(response.body)['token'],
        lstError: jsonDecode(response.body)['errors']);

    if (response.statusCode == 200) {
      isLogin.value = true;
      PrefsService.to.setString("token", loginResponse.token!);
      PrefsService.to.setString("phone", userCredintals.phone!);
      PrefsService.to.setString("idNumber", userCredintals.nationalId!);

      await getPatientId();

      error.value = '';
      nationalIdController.text = '';
      mrnController.text = '';
      phoneController.text = '';
      passwordController.text = '';
      isChecked.value = false;
      if (PrefsService.to.getInt("afterLogin") == 0) {
        Get.offNamed(PagesNames.patientAppiontments);
      } else {
        Get.offNamed(PagesNames.reserveAssurence);
      }
    } else {
      if (loginResponse.lstError!['nationalId'] != null) {
        listError['nationalId'] = loginResponse.lstError!['nationalId'];
      }

      if (loginResponse.lstError!['Password'] != null) {
        listError['Password'] = loginResponse.lstError!['Password'];
      }
    }
  }

  handleLogin() async {
    UserCredintals userCredintals;
    if (loginOptionsScreenController.option.value == 1) {
      userCredintals = UserCredintals(
          loginMethod: loginOptionsScreenController.option.value,
          nationalId: nationalIdController.text,
          password: passwordController.text,
          phone: phoneController.text);
    } else {
      userCredintals = UserCredintals(
          loginMethod: loginOptionsScreenController.option.value,
          password: passwordController.text,
          mrn: mrnController.text,
          phone: phoneController.text);
    }

    await login(userCredintals);
  }

  validate(String value) {
    if (value.isEmpty) {
      return Messages.emptyFieldsError;
    } else {
      if (value == nationalIdController.text && value.length < 3) {
        return Messages.userNameLengthError;
      }
      if (value == passwordController.text && value.length < 3) {
        return Messages.passwordLengthError;
      }
    }
    listError.clear();
    return null;
  }

  registrationRedirect() {
    Get.offNamed(PagesNames.registration);
  }

  getPatientId() async {
    Map<String, String> headers = {
      "content-type": "application/json; charset=utf-8",
    };
    if (PrefsService.to.getString("token") != null) {
      String? token = PrefsService.to.getString("token");
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
        Uri.parse("${Urls.account}UserList?page=1&pageSize=1000&UserType=3"),
        headers: headers);

    patient.value.id =
        returnPatient(json.decode(response.body)['lstData'])[0]['id'];
    PrefsService.to.setInt("id", patient.value.id);
  }

  returnPatient(List list) {
    Iterable iterable = list
        .where((element) =>
            element['phone1'] == PrefsService.to.getString("phone") &&
            element['idNumber'] == PrefsService.to.getString("idNumber"))
        .toList();
    return iterable;
  }

  @override
  void onInit() {
    // option = Get.arguments['option'];
    super.onInit();
  }
}
