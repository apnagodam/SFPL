import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension AadharNumberValidator on String {
  bool isValidAadharNumber() {
    return RegExp(r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$').hasMatch(this);
  }
}

extension PanCardValidator on String {
  bool isValidPanCardNo() {
    return RegExp(r'^[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}$').hasMatch(this);
  }
}

extension BankAccountValidator on String {
  bool isValidBankAccount() {
    return RegExp(r'^\d{10,16}$').hasMatch(this);
  }
}

extension DrivingLicenseValidator on String {
  bool isValidLicenseNo() {
    return RegExp(
            r'^(([a-zA-Z]{2}[0-9]{2})( )|([a-zA-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$')
        .hasMatch(this);
  }
}

extension EmailValidtor on String {
  bool isValidEmail() {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(this);
  }
}

extension FullHeight on BuildContext {
  double get fullHeight =>
      MediaQuery.of(this).size.height -
      MediaQuery.of(this).padding.top -
      kToolbarHeight;
}

extension FullWidth on BuildContext {
  double get fullWidth =>
      MediaQuery.of(this).size.width -
      MediaQuery.of(this).padding.left -
      kToolbarHeight;
}

extension ValidateForm on GlobalKey<FormState> {
  bool checkFormValidtion() => currentState!.validate();
}

extension SumFieldExtension on List<Map<String, dynamic>> {
  /// Sums all numeric values of the given key (as double).
  double sumField(String key) {
    return fold(0.0, (sum, item) {
      final value = item[key];
      final doubleValue = double.tryParse(value?.toString() ?? '0') ?? 0.0;
      return sum + doubleValue;
    });
  }
}extension FileExtention on FileSystemEntity {
  String? get name {
    return path.split(Platform.pathSeparator).last;
  }
}
