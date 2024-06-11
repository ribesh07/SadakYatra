//import 'dart:js_interop';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class settingProvider extends ChangeNotifier {
  static final RegExp passValid = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$');
  // general validator
  validator(String value, String message) {
    if (value.isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  passwordValidator(String value) {
    if (value.isEmpty) {
      return "Enter password";
    } else if (!passValid.hasMatch(value)) {
      return "Password is not Strong enough";
    } else {
      return null;
    }
  }

  cpasswordValidator(String value1, String value2) {
    if (value2.isEmpty) {
      return "Re-Enter password";
    } else if (value1 != value2) {
      return "Passwords don't match";
    } else {
      return null;
    }
  }

  phoneValidator(String value) {
    if (value.isEmpty) {
      return "phone number is required";
    } else if (value.length < 10) {
      return "at least 10 digits are required";
    } else {
      return null;
    }
  }

  emailValidator(String value) {
    final bool isEmailValid = EmailValidator.validate(value);
    if (value.isEmpty) {
      return "Provide Email";
    } else if (isEmailValid) {
      return null;
    } else {
      return "invalid mail";
    }
  }
}
