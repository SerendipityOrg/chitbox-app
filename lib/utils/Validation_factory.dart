import 'package:flutter/services.dart';

abstract class Validation {
  TextInputFormatter get inputFormatter;
  String get hintText;
  String? Function(String?) get validator;
}

class PanValidation implements Validation {
  @override
  TextInputFormatter get inputFormatter => FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]'));

  @override
  String get hintText => 'PAN Number';

  @override
  String? Function(String?) get validator => (value) {
    final panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
    if (value == null || !panRegex.hasMatch(value)) {
      return 'Invalid PAN';
    }
    return null;
  };
}

class AadhaarValidation implements Validation {
  @override
  TextInputFormatter get inputFormatter => FilteringTextInputFormatter.digitsOnly;

  @override
  String get hintText => 'Aadhaar Number';

  @override
  String? Function(String?) get validator => (value) {
    final aadhaarRegex = RegExp(r'^\d{12}$');
    if (value == null || !aadhaarRegex.hasMatch(value)) {
      return 'Invalid Aadhaar';
    }
    return null;
  };
}

class NameValidation implements Validation {
  @override
  TextInputFormatter get inputFormatter => FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'));

  @override
  String get hintText => 'Name';

  @override
  String? Function(String?) get validator => (value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  };
}

class EmailValidation implements Validation {
  @override
  TextInputFormatter get inputFormatter => FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]'));

  @override
  String get hintText => 'Email';

  @override
  String? Function(String?) get validator => (value) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (value == null || !emailRegex.hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  };
}

class AddressValidation implements Validation {
  @override
  TextInputFormatter get inputFormatter => FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9,.\- ]'));

  @override
  String get hintText => 'Address';

  @override
  String? Function(String?) get validator => (value) {
    if (value == null || value.isEmpty) {
      return 'Address cannot be empty';
    }
    return null;
  };
}

class ValidationFactory {
  static Validation getValidator(String type) {
    switch (type) {
      case 'PAN':
        return PanValidation();
      case 'Aadhaar':
        return AadhaarValidation();
      case 'Name':
        return NameValidation();
      case 'Email':
        return EmailValidation();
      case 'Address':
        return AddressValidation();
      default:
        throw Exception('Invalid validation type');
    }
  }
}
