import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/generic_textfield_newfield.dart';
import 'package:gpspro/presentation/screens/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:gpspro/presentation/screens/auth/priamry_button.dart';
import 'package:gpspro/theme/app_colors.dart';

class NewPasswordStepWidget extends StatefulWidget {
  final bool isLoading;
  final GlobalKey<FormState> formKey;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  const NewPasswordStepWidget({
    super.key,
    required this.isLoading,
    required this.formKey,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });

  @override
  State<NewPasswordStepWidget> createState() => _NewPasswordStepWidgetState();
}

class _NewPasswordStepWidgetState extends State<NewPasswordStepWidget> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.locale;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.setNewPasswordTitle,
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
            l10n.setNewPasswordSubtitle,
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
        GenericTextfieldNew(
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
          hintText: l10n.newPasswordHint,
          label: l10n.newPasswordLabel,
          controller: widget.newPasswordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return l10n.passwordRequired;
            }
            if (value.length < 6) {
              return l10n.passwordTooShort;
            }

            return null;
          },
          obscureText: !_isPasswordVisible,
        ),
        const SizedBox(height: 20),
        GenericTextfieldNew(
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
          hintText: l10n.confirmPasswordHint,
          label: l10n.confirmPasswordLabel,
          controller: widget.confirmPasswordController,
          onFieldSubmitted: (_) {
            if (!widget.isLoading && widget.formKey.currentState!.validate()) {
              context.read<ForgotPasswordCubit>().resetPassword(widget.newPasswordController.text);
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return l10n.confirmPasswordRequired;
            } else if (value != widget.newPasswordController.text) {
              return l10n.passwordsDoNotMatch;
            }
            return null;
          },
          obscureText: !_isPasswordVisible,
        ),
        const SizedBox(height: 20),
        PrimaryButton(
          isLoading: widget.isLoading,
          label: l10n.resetPassword,
          onPressed: () {
            if (widget.formKey.currentState!.validate()) {
              log('I am triggered');
              context.read<ForgotPasswordCubit>().resetPassword(widget.newPasswordController.text);
            }
          },
        ),
      ],
    );
  }
}
