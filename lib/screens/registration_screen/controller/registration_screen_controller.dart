import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/utils/messages.dart';
import 'package:intl/intl.dart';

class RegistrationScreenController extends GetxController {
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController countryNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  validate(String value) {
    if (value.isEmpty) {
      return Messages.emptyFieldsError;
    } else {
      if (value == nationalIdController.text && value.length < 3) {
        return Messages.userNameLengthError;
      }
      if (value == phoneController.text && value.length < 3) {
        return Messages.passwordLengthError;
      }
    }
    return null;
  }

  pickDate(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: DateTime(1950), lastDate: DateTime(2100));
    if (pickedDate != null) {
      String formattedDate = DateFormat.yMMMd().format(pickedDate);
      dobController.text = formattedDate;
    }
  }

  handleRegister() {}
}
