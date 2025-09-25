import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/utils/validators/form_validator.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/generic_textfield_newfield.dart';
import 'package:gpspro/presentation/global_widgets/loading_widgets.dart';
import 'package:gpspro/presentation/screens/change_password/cubit/change_password_cubit.dart';
import 'package:gpspro/theme/app_colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final formKey = GlobalKey<FormState>();
  final _currentPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _retypePassword = TextEditingController();

  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _currentPassword.dispose();
    _newPassword.dispose();
    _retypePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ChangePasswordCubit>(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) async {
          log('I am the state $state');
          state.maybeWhen(
            orElse: () {
              dismissLoadingDialog(context);
              AppToast.showError(message: context.locale.unexpectedError, context: context);
            },
            loading: (message) => showLoadingDialog(context, message!, false),
            success: (_) async {
              dismissLoadingDialog(context);
              AppToast.showSuccess(context: context, message: _);
              _currentPassword.clear();
              _newPassword.clear();
              _retypePassword.clear();
              context.pop();
            },
            failed: (error) {
              dismissLoadingDialog(context);
              AppToast.showError(message: error, context: context);
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<ChangePasswordCubit>();

          return Scaffold(
            appBar: AppBar(title: Text(context.locale.changePassword)),
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  top: 24,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.locale.changePassword,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF181818),
                          height: 1.33,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        context.locale.enterPasswordToConfirm,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF646464),
                          height: 1.43,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 24),
                      GenericTextfieldNew(
                        controller: _currentPassword,
                        obscureText: !_isCurrentPasswordVisible,
                        label: context.locale.current_password,
                        hintText: context.locale.current_password,
                        validator: FormValidator.passwordValidator,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isCurrentPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () => setState(() {
                            _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                          }),
                        ),
                      ),
                      const SizedBox(height: 14),
                      GenericTextfieldNew(
                        controller: _newPassword,
                        obscureText: !_isNewPasswordVisible,
                        label: context.locale.newPassword,
                        hintText: context.locale.newPassword,
                        validator: FormValidator.passwordValidator,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () => setState(() {
                            _isNewPasswordVisible = !_isNewPasswordVisible;
                          }),
                        ),
                      ),
                      const SizedBox(height: 14),
                      GenericTextfieldNew(
                        controller: _retypePassword,
                        obscureText: !_isConfirmPasswordVisible,
                        label: context.locale.retypePassword,
                        hintText: context.locale.retypePassword,
                        validator: (value) {
                          if (value != _newPassword.text) {
                            return context.locale.passwordMismatch;
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () => setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          }),
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!formKey.currentState!.validate()) return;
                            cubit.updatePasswordWithConfirmation(
                              _currentPassword.text,
                              _newPassword.text,
                              context.read<AuthCubit>(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            backgroundColor: const Color(0xFF0880EA),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(
                            context.locale.changePassword,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
