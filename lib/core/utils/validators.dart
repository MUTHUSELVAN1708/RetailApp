import 'package:flutter/services.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email cannot be empty";
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  static FilteringTextInputFormatter decimalNumber() {
    return FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'));
  }

  static TextInputFormatter numberOnly() {
    return FilteringTextInputFormatter.digitsOnly;
  }

  static String getUomAbbreviation(String fullText) {
    if (fullText.isEmpty) return '';
    RegExp regExp = RegExp(r'\(([^)]+)\)');
    var match = regExp.firstMatch(fullText);
    return match?.group(1) ?? fullText;
  }
}
