import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/presentation/screens/auth/sign_up/cubit/signup_cubit.dart';
import 'package:pinput/pinput.dart';

class SignupOtpStep extends StatelessWidget {
  final TextEditingController otpController;
  final GlobalKey<FormState> formKey;
  final String email;

  const SignupOtpStep({
    super.key,
    required this.otpController,
    required this.formKey,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 241, 241, 1),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Column(
      children: [
        Pinput(
          length: 6,
          controller: otpController,
          defaultPinTheme: defaultPinTheme,
          validator: (value) {
            if (value == null || value.isEmpty) return 'Please enter the PIN';
            if (value.length != 6) return 'PIN must be 6 digits';
            return null;
          },
          onCompleted: (pin) {
            context.read<SignupCubit>().verifyOtp(otp: pin);
          },
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
