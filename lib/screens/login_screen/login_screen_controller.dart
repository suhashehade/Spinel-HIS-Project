import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/patient/patient.dart';
import 'package:his_project/models/user/login.dart';
import 'package:his_project/screens/login_options_screen/login_options_screen_controller.dart';
import 'package:his_project/screens/reservation_confirmation_screen/reservation_confirmation_screen_controller.dart';
import 'package:his_project/services/api_service.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/messages.dart';
import 'package:his_project/utils/pages_names.dart';

class LoginScreenController extends GetxController {
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController mrnController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ReservationConfirmationScreenController reservationAssurenceScreenController =
      Get.put(ReservationConfirmationScreenController());
  RxBool isLogin = false.obs;
  RxMap<String, dynamic> listError = <String, dynamic>{}.obs;
  RxString error = ''.obs;
  RxBool isChecked = false.obs;
  LoginOptionsScreenController loginOptionsScreenController =
      Get.put(LoginOptionsScreenController());
  int? option;
  Rx<Patient> patient = Patient(0, "").obs;

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
    var res = await Api.login(userCredintals);

    if (res.token == null) {
      error.value = jsonDecode(res.body)['lstError'][0];

      return;
    }

    if (res.token != null) {
      isLogin.value = true;
      PrefsService.to.setString("token", res.token!);
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
      if (res.lstError!['nationalId'] != null) {
        listError['nationalId'] = res.lstError!['nationalId'];
      }

      if (res.lstError!['Password'] != null) {
        listError['Password'] = res.lstError!['Password'];
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
    patient.value = await Api.getPatients(PrefsService.to.getString("phone")!);
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
}
