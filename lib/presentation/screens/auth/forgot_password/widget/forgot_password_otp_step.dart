import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:gpspro/presentation/screens/auth/priamry_button.dart';
import 'package:pinput/pinput.dart';

class OtpStepWidget extends StatelessWidget {
  final bool isLoading;
  final String emailController;
  final GlobalKey<FormState> formKey;
  final TextEditingController otpController;

  const OtpStepWidget({
    super.key,
    required this.isLoading,
    required this.emailController,
    required this.formKey,
    required this.otpController,
  });

  bool _isPhone(String value) {
    final phoneRegex = RegExp(r'^\d{7,15}$');
    return phoneRegex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.locale;
    final focusedBorderColor = Colors.blueAccent;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 241, 241, 1),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final sentTo = _isPhone(emailController) ? l10n.sentToPhone(emailController) : l10n.sentToEmail(emailController);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.verifyAccount,
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
            sentTo,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              height: 1.5,
              letterSpacing: -0.3,
              color: Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Pinput(
            length: 6,
            controller: otpController,
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => const SizedBox(width: 8),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.otpEmptyError;
              } else if (value.length != 6) {
                return l10n.otpLengthError;
              }
              return null;
            },
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: (pin) {
              context.read<ForgotPasswordCubit>().verifyToken(otpController.text);
            },
            onChanged: (value) {},
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  width: 22,
                  height: 1,
                  color: focusedBorderColor,
                ),
              ],
            ),
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(2, 128, 255, 0.07),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color.fromRGBO(0, 145, 255, 1), width: 1),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(2, 128, 255, 0.07),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color.fromRGBO(0, 145, 255, 1), width: 1),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
        ),
        const SizedBox(height: 30),
        PrimaryButton(
          isLoading: isLoading,
          label: l10n.continueButton,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<ForgotPasswordCubit>().verifyToken(otpController.text);
            }
          },
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.didntReceiveCode,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(100, 100, 100, 1),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<ForgotPasswordCubit>().resendToken();
              },
              child: Text(
                l10n.resendCode,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(24, 24, 24, 1),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
