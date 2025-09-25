extension StringExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach => split(' ').map(capitalize).join(' ');
  String get camelCaseToSentence => replaceAllMapped(
          RegExp(r'[A-Z]'), (Match match) => ' ${match.group(0)}'.toLowerCase())
      .capitalizeFirstofEach;
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
