import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/screens/auth/forgot_password/widget/forgot_password_header.dart';
import 'package:gpspro/presentation/screens/auth/priamry_button.dart';
import 'package:gpspro/presentation/screens/auth/sign_in/signin_screen.dart';
import 'package:gpspro/presentation/screens/auth/sign_up/cubit/signup_cubit.dart';
import 'package:gpspro/presentation/screens/auth/sign_up/widgets/custom_loading_dailog.dart';
import 'package:gpspro/presentation/screens/auth/sign_up/widgets/signup_email_step.dart';
import 'package:gpspro/presentation/screens/auth/sign_up/widgets/signup_otp_step.dart';
import 'package:gpspro/presentation/screens/auth/sign_up/widgets/signup_user_info_step.dart';
import 'package:gpspro/presentation/wrappers/header_footer_wrapper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final retypePasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    otpController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    retypePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<SignupCubit>(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          state.whenOrNull(
            otpSent: (message) => AppToast.showSuccess(message: message, context: context), // ✅
            resendOtp: (message) => AppToast.showSuccess(message: message, context: context), // ✅
            otpVerified: () => AppToast.showSuccess(message: context.locale.otpVerified, context: context), // ✅
            success: (_) => AppToast.showSuccess(message: context.locale.accountCreated, context: context), // ✅
            error: (message) => AppToast.showError(message: message, context: context), // ✅
          );
        },
        builder: (context, state) {
          state.maybeWhen(
              orElse: () {},
              loading: () => const CustomLoadingDialog(
                    message: '',
                  ));

          final signupCubit = context.watch<SignupCubit>();
          final step = signupCubit.step;
          final isLoading = state == const SignupState.loading(); // ✅ Simplified loading

          return AbsorbPointer(
            absorbing: isLoading,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: HeaderFooterWrapper(
                      header: const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(padding: EdgeInsets.symmetric(vertical: 15), child: TrackonNewLogo()),
                      ),
                      child: Column(
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 25),
                                ForgotPasswordHeader(
                                  title: step == 1
                                      ? context.locale.createAccount
                                      : step == 2
                                          ? context.locale.verifyOtp
                                          : context.locale.yourInformation,
                                  subtitle: step == 1
                                      ? context.locale.createAccountSubtitle
                                      : step == 2
                                          ? '${context.locale.verifyOtpSubtitle} ${emailController.text}'
                                          : context.locale.yourInformationSubtitle,
                                ),
                                if (step == 1) SignupEmailStep(controller: emailController),
                                if (step == 2)
                                  SignupOtpStep(
                                    otpController: otpController,
                                    email: emailController.text,
                                    formKey: formKey,
                                  ),
                                if (step == 3)
                                  SignupUserInfoStep(
                                    fullNameController: fullNameController,
                                    passwordController: passwordController,
                                    retypePasswordController: retypePasswordController,
                                    isPasswordVisible: isPasswordVisible,
                                    isConfirmPasswordVisible: isConfirmPasswordVisible,
                                    togglePasswordVisibility: () {
                                      setState(() => isPasswordVisible = !isPasswordVisible);
                                    },
                                    toggleConfirmPasswordVisibility: () {
                                      setState(() => isConfirmPasswordVisible = !isConfirmPasswordVisible);
                                    },
                                  ),
                                const SizedBox(height: 35),
                              ],
                            ),
                          ),

                          if (!isLoading)
                            PrimaryButton(
                              label: step == 1
                                  ? 'Continue'
                                  : step == 2
                                      ? 'Continue'
                                      : context.locale.createAccount,
                              onPressed: () => _handleStep(context),
                            ),

                          if (!isLoading && step == 2)
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    context.locale.didNotReceiveIt,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(100, 100, 100, 1)),
                                  ),
                                  TextButton(
                                    onPressed: () => context.read<SignupCubit>().resendOtp(),
                                    child: Text(
                                      context.locale.resendOtp,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          if (isLoading) const Center(child: CircularProgressIndicator()), // ✅ Spinner
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleStep(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      final signupCubit = context.read<SignupCubit>();
      final step = signupCubit.step;

      if (step == 1) {
        signupCubit.signup(emailOrPhone: emailController.text.trim()); // ✅ Trimmed input
      } else if (step == 2) {
        signupCubit.verifyOtp(otp: otpController.text.trim()); // ✅ Verify OTP step
      } else if (step == 3) {
        signupCubit.completeSignup(
          fullname: fullNameController.text.trim(),
          password: passwordController.text,
        );
      }
    }
  }
}
