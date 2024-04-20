import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/models/patient/patient.dart';
import 'package:his_project/models/user/login.dart';
import 'package:his_project/screens/login_options_screen/login_options_screen_controller.dart';
import 'package:his_project/screens/reservation_confirmation_screen/reservation_confirmation_screen_controller.dart';
import 'package:his_project/services/api_service.dart';
import 'package:his_project/services/shared_prefs_service.dart';
import 'package:his_project/utils/consts_res.dart';
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
      await PrefsService.to.setString(ConstRes.phoneKey, phone);
    } else {
      if (PrefsService.to.getString(ConstRes.phoneKey) != null) {
        PrefsService.to.remove(ConstRes.phoneKey);
      }
    }
    toggleChecked(value);
  }

  logout() {
    if (PrefsService.to.getString(ConstRes.phoneKey) != null ||
        PrefsService.to.getString(ConstRes.idNumberKey) != null) {
      PrefsService.to.remove(ConstRes.phoneKey);
      PrefsService.to.remove(ConstRes.idNumberKey);
    }
    PrefsService.to.remove(ConstRes.tokenKey);
    PrefsService.to.remove(ConstRes.idKey);
    PrefsService.to.remove(ConstRes.afterLoginKey);

    isLogin.value = false;
    Get.offNamed(PagesNames.root);
  }

  login(UserCredintals userCredintals) async {
    var res = await Api.login(userCredintals);

    if (res.token == null) {
      error.value = jsonDecode(res.body)[ConstRes.lstErrorKey][0];

      return;
    }

    if (res.token != null) {
      isLogin.value = true;
      PrefsService.to.setString(ConstRes.tokenKey, res.token!);
      PrefsService.to.setString(ConstRes.phoneKey, userCredintals.phone!);
      PrefsService.to
          .setString(ConstRes.idNumberKey, userCredintals.nationalId!);

      await getPatientId();

      error.value = '';
      nationalIdController.text = '';
      mrnController.text = '';
      phoneController.text = '';
      passwordController.text = '';
      isChecked.value = false;

      if (PrefsService.to.getInt(ConstRes.afterLoginKey) == 0) {
        Get.offNamed(PagesNames.patientAppiontments);
      } else {
        Get.offNamed(PagesNames.reserveAssurence);
      }
    } else {
      if (res.lstError![ConstRes.nationalIdkey] != null) {
        listError[ConstRes.nationalIdkey] =
            res.lstError![ConstRes.nationalIdkey];
      }

      if (res.lstError![ConstRes.passwordKey] != null) {
        listError[ConstRes.passwordKey] = res.lstError![ConstRes.passwordKey];
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
      return ConstRes.emptyFieldsError;
    } else {
      if (value == nationalIdController.text && value.length < 3) {
        return ConstRes.userNameLengthError;
      }
      if (value == passwordController.text && value.length < 3) {
        return ConstRes.passwordLengthError;
      }
    }
    listError.clear();
    return null;
  }

  registrationRedirect() {
    Get.offNamed(PagesNames.registration);
  }

  getPatientId() async {
    patient.value =
        await Api.getPatients(PrefsService.to.getString(ConstRes.phoneKey)!);
    PrefsService.to.setInt(ConstRes.idKey, patient.value.id);
  }

  returnPatient(List list) {
    Iterable iterable = list
        .where((element) =>
            element[ConstRes.phone1Key] ==
                PrefsService.to.getString(ConstRes.phoneKey) &&
            element[ConstRes.idNumberKey] ==
                PrefsService.to.getString(ConstRes.idNumberKey))
        .toList();
    return iterable;
  }
}
