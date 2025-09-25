import 'package:flutter/material.dart';

class AppShadow {
  static const normal = BoxShadow(
    color: Colors.black12,
    blurRadius: 10,
    offset: Offset(0, 5),
  );

  static const dark = BoxShadow(
    color: Colors.black26,
    blurRadius: 10,
    offset: Offset(0, 5),
  );

  static const bottomSheet = BoxShadow(
    color: Colors.black45,
    blurRadius: 10,
    spreadRadius: 3,
    offset: Offset(0, 0),
  );
}
