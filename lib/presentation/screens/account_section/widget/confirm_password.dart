import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/generic_textfield_newfield.dart';
import 'package:gpspro/presentation/global_widgets/loading_widgets.dart';
import 'package:gpspro/presentation/screens/auth/sign_in/signin_screen.dart';
import 'package:gpspro/router/app_router.dart';

class ConfirmPassword extends StatefulWidget {
  final int userId;
  const ConfirmPassword({super.key, required this.userId});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  bool isChecked = false;
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: (errorMessage) {
              showLoadingDialog(context, errorMessage, false);
            },
            orElse: () {},
            error: (errorMessage) {
              dismissLoadingDialog(context);

              AppToast.showError(context: context, message: errorMessage);
            },
            success: (errorMessage) {
              dismissLoadingDialog(context);
              AppToast.showSuccess(context: context, message: errorMessage);
              setState(() {
                isChecked = true;
              });
              if (errorMessage == 'Account Deletion Success') {
                locator<AuthCubit>().requestUnAuthentication();
                locator<AppRouter>().pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SigninScreen(),
                ));
              }
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                context.locale.confirm_account_deletion,
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w600, // Closest to 590: Semibold
                  fontSize: 18,
                  height: 1.33, // 24 / 18 = 1.33
                  letterSpacing: -0.3,
                  color: Color.fromRGBO(24, 24, 24, 1), // rgba(24,24,24,1)
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                context.locale.enter_password_to_confirm,
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400, // Regular
                  fontSize: 14,
                  height: 1.43, // 20 / 14 = ~1.43
                  letterSpacing: -0.3,
                  color: Color.fromRGBO(100, 100, 100, 1), // rgba(100,100,100,1)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: GenericTextfieldNew(
                controller: confirmPassword,
                label: context.locale.current_password,
                hintText: context.locale.enter_password_hint,
                obscureText: true,
                onFieldSubmitted: (value) {
                  context.read<AuthCubit>().confirmPassword(confirmPassword.text);
                },
              ),
            ),
            const Spacer(),

            const SizedBox(height: 24),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFFFFF), // #FFFFFF
                    Color(0xFFF9F9F9), // #F9F9F9
                  ],
                ),
                border: Border(
                  top: BorderSide(
                    color: Color.fromRGBO(241, 241, 241, 1), // border-top color
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isChecked
                            ? () {
                                locator.get<AuthCubit>().deleteUser(widget.userId);

                                // Next action here
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          backgroundColor:
                              isChecked ? const Color.fromRGBO(229, 72, 77, 1) : const Color.fromRGBO(37, 0, 73, 0.05),
                          foregroundColor: isChecked ? Colors.white : const Color.fromRGBO(37, 0, 73, 0.05),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          elevation: 0,
                        ),
                        child: Text(context.locale.delete_account,
                            style: const TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w600, // Closest to 590
                              fontSize: 16,
                              height: 1.5, // line-height / font-size => 24 / 16
                              letterSpacing: -0.3,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    // Cancel Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          context.pop();
                          // Cancel action here
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color.fromRGBO(228, 1, 1, 0.22)),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        child: Text(
                          context.locale.cancel,
                          style: const TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w600, // Closest to 590
                              fontSize: 16,
                              height: 1.5, // line-height (24) / font-size (16)
                              letterSpacing: -0.3,
                              color: Color.fromRGBO(229, 72, 77, 1)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //  SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
