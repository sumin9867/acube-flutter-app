import 'package:flutter/material.dart';
import 'package:gpspro/gen/l10n/locale.dart';

class ForgotPasswordHeader extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const ForgotPasswordHeader({
    super.key,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.locale;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? l10n.forgotPasswordTitle,
          style: const TextStyle(
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w600,
            fontSize: 28,
            height: 1.2857,
            letterSpacing: 0,
            color: Color.fromRGBO(24, 24, 24, 1),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 30),
          child: Text(
            subtitle ?? l10n.forgotPasswordSubtitle,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.5,
              letterSpacing: -0.3,
              color: Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
        ),
      ],
    );
  }
}
