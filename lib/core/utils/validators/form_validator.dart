import 'package:gpspro/core/utils/validators/app_validator.dart';

class FormValidator {
  static String? otpValidator(String? value, {bool isRequired = true}) {
    if (AppValidator.isNullOrBlank(value)) {
      return isRequired ? 'OTP Needed' : null;
    }
    return null;
  }

  static String? requiredField(String? value, {bool isRequired = true}) {
    if (AppValidator.isNullOrBlank(value)) {
      return isRequired ? 'Required field' : null;
    }
    return null;
  }

  static String? fullNameValidator(String? value, {bool isRequired = true}) {
    if (AppValidator.isNullOrBlank(value)) {
      return isRequired ? 'Full name is required' : null;
    }
    return AppValidator.isFullName(value) ? null : 'Invalid full name';
  }

static String? loginUserNameEmailValidation(String? value, {bool isRequired = true}) {
  if (AppValidator.isNullOrBlank(value)) {
    return isRequired ? 'Username/Email/Phone is required' : null;
  }

  final bool isNumeric = RegExp(r'^\d+$').hasMatch(value!); 
  final bool isEmailValid = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value);
  final bool isPhoneValid = isNumeric && value.length == 10; 
  final bool isUsernameValid = !isNumeric && RegExp(r'^[a-zA-Z0-9]{5,}$').hasMatch(value); 

  if (isEmailValid || isPhoneValid || isUsernameValid) {
    return null; 
  } else {
    if (value.contains('@') && !isEmailValid) {
      return 'Invalid email';
    } else if (isNumeric && !isPhoneValid) {
      return 'Invalid phone number (must be exactly 10 digits)';
    } else {
      return 'Invalid username (must be at least 5 characters)';
    }
  }
}



  static String? emailValidator(String? value, {bool isRequired = true}) {
    if (AppValidator.isNullOrBlank(value)) {
      return isRequired ? 'Email is required' : null;
    }
    return AppValidator.isEmail(value) ? null : 'Invalid email';
  }

  static String? phoneValidator(String? value, {bool isRequired = true}) {
    if (AppValidator.isNullOrBlank(value)) {
      return isRequired ? 'Phone number is required' : null;
    }
    return AppValidator.isPhoneNumber(value!) ? null : 'Invalid phone number';
  }

  static String? passwordValidator(String? value, {bool isRequired = true}) {
    if (AppValidator.isNullOrBlank(value)) {
      return isRequired ? 'Pawword is required' : null;
    } else {
      return AppValidator.isPassword(value!) ? null : 'Invalid password';
    }
  }

  static String? vehicleNameValidator(String? value, {bool isRequired = true}) {
    if (AppValidator.isNullOrBlank(value)) {
      return isRequired ? 'Name is required' : null;
    } else {
      return value!.length > 4 ? null : 'Name must be at least 5 characters.';
    }
  }

static String? vehicleSpeedLimitValidator(String? value, {bool isRequired = true}) {
  if (AppValidator.isNullOrBlank(value)) {
    return isRequired ? 'Speed limit is required' : null;
  } else {
    final speed = double.tryParse(value!);  
    if (speed == null) {
      return 'Please enter a valid number';  
    } else if (speed <= 20) {
      return 'Speed limit must be greater than 20';  
    } else {
      return null;  
    }
  }
}


  static String? vehicleIMEISNValidator(String? value,
      {bool isRequired = true}) {
    if (AppValidator.isNullOrBlank(value)) {
      return isRequired ? 'IMEI/SN is required' : null;
    } else {
      return AppValidator.isIMEISN(value!) ? null : 'Invalid IMEI/SN';
    }
  }
}
