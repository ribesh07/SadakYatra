//import 'dart:js_interop';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class settingProvider extends ChangeNotifier {
  // general validator
  validator(String value, String Message) {
    if (value.isEmpty) {
      return Message;
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
