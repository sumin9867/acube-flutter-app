import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String value;
  final int daysLeft;

  const InfoTile({
    required this.title,
    required this.value,
    required this.daysLeft,
  });

  @override
  Widget build(BuildContext context) {
    final bool isExpiryDate = title.toLowerCase() == 'expires';
    final Color textColor = (isExpiryDate && daysLeft <= 0)
        ? const Color.fromRGBO(217, 61, 66, 1) // red for expired
        : const Color.fromRGBO(24, 24, 24, 1); // default dark color

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ],
    );
  }
}