import 'package:flutter/material.dart';
import 'package:gpspro/core/utils/validators/validators.dart';
import 'package:gpspro/presentation/global_widgets/generic_textfield_newfield.dart';
import 'package:gpspro/theme/app_colors.dart';

class SignupUserInfoStep extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController passwordController;
  final TextEditingController retypePasswordController;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final VoidCallback togglePasswordVisibility;
  final VoidCallback toggleConfirmPasswordVisibility;

  const SignupUserInfoStep({
    super.key,
    required this.fullNameController,
    required this.passwordController,
    required this.retypePasswordController,
    required this.isPasswordVisible,
    required this.isConfirmPasswordVisible,
    required this.togglePasswordVisibility,
    required this.toggleConfirmPasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenericTextfieldNew(
          label: 'Your Full Name',
          hintText: 'Enter your Full Name',
          controller: fullNameController,
          validator: FormValidator.fullNameValidator,
        ),
        const SizedBox(height: 15),
        GenericTextfieldNew(
          label: 'Password',
          hintText: 'Password',
          controller: passwordController,
          validator: FormValidator.passwordValidator,
          obscureText: !isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.primaryColor,
            ),
            onPressed: togglePasswordVisibility,
          ),
        ),
        const SizedBox(height: 15),
        GenericTextfieldNew(
          label: 'Re-enter Password',
          hintText: 'Re-enter password',
          controller: retypePasswordController,
          validator: (value) {
            if (value != passwordController.text) return 'Passwords do not match';
            return null;
          },
          obscureText: !isConfirmPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.primaryColor,
            ),
            onPressed: toggleConfirmPasswordVisibility,
          ),
        ),
      ],
    );
  }
}
