import 'package:flutter/material.dart';

class TrackonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const TrackonAppbar({super.key, required this.text});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Standard AppBar height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      elevation: 0,
      title: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color.fromRGBO(24, 24, 24, 1),
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w600,
          fontSize: 20,
          height: 24 / 18,
          letterSpacing: -0.3,
        ),
      ),
      centerTitle: true,
    );
  }
}
