import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/generic_textfield_newfield.dart';
import 'package:gpspro/presentation/screens/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:gpspro/presentation/screens/auth/priamry_button.dart';

class EmailStep extends StatelessWidget {
  final bool isLoading;
  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;

  const EmailStep({
    super.key,
    required this.isLoading,
    required this.emailController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.locale;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.forgotPasswordTitle,
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
            l10n.forgotPasswordSubtitle,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.5,
              letterSpacing: -0.3,
              color: Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
        ),
        GenericTextfieldNew(
          label: l10n.mobileOrEmail,
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return l10n.enterEmailOrPhoneEmpty;
            }
            final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
            final phoneRegex = RegExp(r'^9\d{9}$');

            if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
              return l10n.invalidEmailOrPhone;
            }
            return null;
          },
          hintText: l10n.enterEmailOrPhoneHint,
        ),
        const SizedBox(height: 20),
        PrimaryButton(
          isLoading: isLoading,
          label: l10n.sendOtp,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<ForgotPasswordCubit>().requestToken(emailController.text);
            }
          },
        ),
      ],
    );
  }
}
