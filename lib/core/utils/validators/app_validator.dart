class AppValidator {
  static bool _isEmpty(dynamic value) {
    if (value is String) {
      return value.toString().trim().isEmpty;
    }
    if (value is Iterable || value is Map) {
      return value.isEmpty as bool;
    }
    return false;
  }

  static bool isNull(dynamic value) => value == null;
  static bool isNullOrBlank(dynamic value) {
    if (isNull(value)) {
      return true;
    }
    return _isEmpty(value);
  }

  static bool isBlank(dynamic value) {
    return _isEmpty(value);
  }

  /// Checks if string is int or double.
  static bool isNum(String value) {
    if (isNull(value)) {
      return false;
    }

    return num.tryParse(value) is num;
  }

  static bool isNumericOnly(String s) => hasMatch(s, r'^\d+$');

static bool isFullName(String? s) {
  if (isNull(s)) return false;
  return hasMatch(s, r'^[a-zA-Z]+( [a-zA-Z]+)+$');
}


  static bool isUserName(String s) {
    if (s.length <= 5) return false;
    return hasMatch(s, r'^[a-zA-Z0-9]+$');
  }

  static bool isEmail(String? s) => hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static bool isPassword(String s) {
    return s.length >= 5;
  }

  static bool isURL(String s) => hasMatch(s,
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$");

  /// Checks if string is phone number.
  static bool isPhoneNumber(String s) {
    if (s.length != 10) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  static bool isIMEISN(String s) {
    if (s.length <= 6) return false;
    return isNumericOnly(s);
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static String? capitalize(String? value) {
    if (isNull(value)) return null;
    if (isBlank(value)) return value;
    return value!.split(' ').map(capitalizeFirst).join(' ');
  }

  static String? capitalizeFirst(String s) {
    if (isNull(s)) return null;
    if (isBlank(s)) return s;
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }
}
