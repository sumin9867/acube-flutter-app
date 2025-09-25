// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/screens/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:gpspro/presentation/screens/auth/forgot_password/widget/forgot_password_email_step.dart';
import 'package:gpspro/presentation/screens/auth/forgot_password/widget/forgot_password_new_password.dart';
import 'package:gpspro/presentation/screens/auth/forgot_password/widget/forgot_password_otp_step.dart';
import 'package:gpspro/presentation/wrappers/header_footer_wrapper.dart';
import 'package:gpspro/router/route_constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final PageController _pageController = PageController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpControllers = TextEditingController();
  final List<FocusNode> otpFocusNodes = List.generate(6, (index) => FocusNode());
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  void _nextStep() {
    setState(() {
      _currentStep++;
    });
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    emailController.dispose();
    otpControllers.dispose();
    otpFocusNodes.map((focusNode) => focusNode.dispose());
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
      body: BlocProvider(
        create: (context) => locator<ForgotPasswordCubit>(),
        child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            state.maybeWhen(
              resendInProgress: () {
                AppToast.showSuccess(message: context.locale.codeSent, context: context);
              },
              success: (message) {
                AppToast.showSuccess(message: message, context: context);
                if (_currentStep < 2) {
                  _nextStep();
                } else {
                  context.push(RouteConstant.passwordResetConfirmation);
                }
              },
              error: (e) {
                AppToast.showError(message: e.toString(), context: context);
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            final bool isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            return Stack(
              children: [
                Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: HeaderFooterWrapper(
                      child: Form(
                        key: _formKey,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: PageView(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              EmailStep(
                                isLoading: isLoading,
                                emailController: emailController,
                                formKey: _formKey,
                              ),
                              OtpStepWidget(
                                isLoading: isLoading,
                                emailController: emailController.text,
                                otpController: otpControllers,
                                formKey: _formKey,
                              ),
                              NewPasswordStepWidget(
                                formKey: _formKey,
                                isLoading: isLoading,
                                newPasswordController: newPasswordController,
                                confirmPasswordController: confirmPasswordController,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // if (isLoading)
                //   Container(
                //     color: Colors.black.withOpacity(0.3),
                //     child: const Center(
                //       child: CircularProgressIndicator(),
                //     ),
                //   ),
              ],
            );
          },
        ),
      ),
    );
  }
}
