import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/utils/validators/form_validator.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_button.dart';
import 'package:gpspro/presentation/global_widgets/app_dialog.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/generic_textfield.dart';
import 'package:gpspro/presentation/screens/change_password/cubit/change_password_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/app_scaffold.dart';
import 'package:gpspro/theme/app_colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool obscurePassword = true;
  bool _isConfirmPasswordVisible = false;

  bool _isPasswordVisible = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _retypePassword = TextEditingController();

  void updatePassword(ChangePasswordCubit cubit) {
    if (formKey.currentState!.validate()) {
      User? user = locator.get<AuthCubit>().user;
      if (user != null) {
        user = user.copyWith(
          password: _newPassword.text,
        );
        // cubit.updatePassword(user);
      }
    }
  }

  @override
  void dispose() {
    _newPassword.dispose();
    _retypePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Change Password',
      body: BlocProvider(
        create: (_) => locator.get<ChangePasswordCubit>(),
        child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            state.maybeWhen(
                success: (success) {
                  _newPassword.clear();
                  _retypePassword.clear();
                  AppDialogs.showAlertDialog(
                    context.locale.passwordUpdatedSuccessfully,
                    context.locale.changePassword,
                    context.locale.ok,
                  );
                },
                failed: (c) {
                  AppToast.showError(message: '', context: context);
                },
                orElse: () {});
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 24),
                            GenericTextfield(
                              obscureText: !_isPasswordVisible,
                              controller: _newPassword,
                              label: context.locale.newPassword,
                              hintText: context.locale.newPassword,
                              validator: FormValidator.passwordValidator,
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
                            ),
                            const SizedBox(height: 14),
                            GenericTextfield(
                              controller: _retypePassword,
                              obscureText: !_isConfirmPasswordVisible,
                              label: context.locale.retypePassword,
                              hintText: context.locale.retypePassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: AppColors.primaryColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                  });
                                },
                              ),
                              validator: (value) {
                                if (value != _newPassword.text) {
                                  return 'Password does not match';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 40),
                            state.maybeWhen(
                              loading: (mess) => const CircularProgressIndicator(),
                              orElse: () => AppButton(
                                label: 'OK',
                                onPressed: () {
                                  updatePassword(context.read<ChangePasswordCubit>());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
