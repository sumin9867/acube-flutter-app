import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/router/route_constants.dart';

class PasswordResetConfirm extends StatelessWidget {
  const PasswordResetConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.locale;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/possword_reset.svg'),
          const SizedBox(height: 30),
          Text(
            l10n.passwordResetTitle,
            style: const TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              height: 1.5,
              letterSpacing: 0,
              color: Color.fromRGBO(24, 24, 24, 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            child: Text(
              l10n.passwordResetSubtitle,
              style: const TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1.5,
                letterSpacing: -0.3,
                color: Color.fromRGBO(100, 100, 100, 1),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                context.push(RouteConstant.signin);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(8, 128, 234, 1),
                ),
                elevation: WidgetStateProperty.all(1),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 18),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: Colors.white24,
                      width: 2,
                    ),
                  ),
                ),
                shadowColor: WidgetStateProperty.all(
                  const Color.fromRGBO(10, 13, 18, 0.05),
                ),
                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                  (states) => states.contains(WidgetState.pressed) ? Colors.white10 : null,
                ),
              ),
              child: Text(
                l10n.loginNow,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
