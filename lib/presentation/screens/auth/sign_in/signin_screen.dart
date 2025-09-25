import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/app_config/app_config.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/core/utils/validators/validators.dart';
import 'package:gpspro/domain/arguments/web_arguments.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/generic_textfield_newfield.dart';
import 'package:gpspro/presentation/global_widgets/need_help.dart';
import 'package:gpspro/presentation/screens/auth/sign_in/cubit/signin_cubit.dart';
import 'package:gpspro/presentation/screens/notification/prefs/prefs_helper.dart';
import 'package:gpspro/presentation/wrappers/header_footer_wrapper.dart';
import 'package:gpspro/router/router.dart';
import 'package:gpspro/theme/app_colors.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final formKey = GlobalKey<FormState>();
  final PrefsHelper prefsHelper = PrefsHelper();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  bool isUsernameValid = false;
  bool isPasswordValid = false;

  bool _isPasswordVisible = false;

  bool _isChecked = true;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => locator<SigninCubit>(),
        child: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (user) {
                _handleNavigationOnLogin(context);
              },
              error: (e) {
                AppToast.showError(message: e.message, context: context);
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              ),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                      child: HeaderFooterWrapper(
                        header: const Align(
                          alignment: Alignment.topLeft,
                          child: TrackonNewLogo(),
                        ),
                        footer: const Column(
                          children: [
                            NeedHelp(),
                            AppVersion(),
                          ],
                        ),
                        child: Column(
                          children: [
                            Form(
                              key: formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 50),
                                  Text(
                                    context.locale.signInWelcomeBack,
                                    style: const TextStyle(
                                      fontFamily: 'SFPro',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 28,
                                      height: 1.2857,
                                      letterSpacing: 0,
                                      color: Color.fromRGBO(24, 24, 24, 1),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    context.locale.signInSubtitle,
                                    style: const TextStyle(
                                      fontFamily: 'SFPro',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.5,
                                      letterSpacing: -0.3,
                                      color: Color.fromRGBO(100, 100, 100, 1),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  GenericTextfieldNew(
                                    controller: usernameController,
                                    label: context.locale.mobileOrEmail,
                                    hintText: context.locale.mobileOrEmail,
                                    validator: FormValidator.loginUserNameEmailValidation,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                  ),
                                  const SizedBox(height: 15),
                                  GenericTextfieldNew(
                                    controller: passwordController,
                                    label: context.locale.password,
                                    hintText: context.locale.password,
                                    validator: FormValidator.passwordValidator,
                                    obscureText: !_isPasswordVisible,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    onFieldSubmitted: (value) {
                                      _isChecked ? loginUser(context) : null;
                                    },
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
                                  const SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        context.push(RouteConstant.forgotPassword);
                                      },
                                      child: Text(
                                        context.locale.forgotPassword,
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          height: 20 / 14,
                                          letterSpacing: -0.3,
                                          color: Color.fromRGBO(217, 61, 66, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  activeColor: const Color.fromRGBO(8, 128, 234, 1),
                                  value: _isChecked,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      _isChecked = newValue ?? false;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final screenWidth = MediaQuery.of(context).size.width;

                                      // ✅ Adjust font size based on screen width
                                      double fontSize;
                                      double lineHeight;

                                      if (screenWidth < 360) {
                                        // Small phones
                                        fontSize = 13;
                                        lineHeight = 20 / 13;
                                      } else if (screenWidth < 480) {
                                        // Medium phones
                                        fontSize = 14;
                                        lineHeight = 22 / 14;
                                      } else {
                                        // Tablets or large screens
                                        fontSize = 16;
                                        lineHeight = 24 / 16;
                                      }

                                      return Wrap(
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        children: [
                                          Text(
                                            'Yes, I agreed to the ',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.w400,
                                              fontSize: fontSize,
                                              color: AppColors.newTextColor,
                                              height: lineHeight,
                                              letterSpacing: -0.3,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              RouteHelper.pushWebViewPage(
                                                WebViewRouteParams(
                                                  'Terms and Conditions',
                                                  locator.get<AppConfig>().configModel.termsAndConditionUrl,
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Terms and Conditions',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w600,
                                                fontSize: fontSize,
                                                color: const Color.fromRGBO(8, 128, 234, 1),
                                                height: lineHeight,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                state.maybeWhen(
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  orElse: () => SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: _isChecked
                                          ? () {
                                              loginUser(context);
                                            }
                                          : null, // <-- disables button when unchecked
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                                          (states) {
                                            if (states.contains(WidgetState.disabled)) {
                                              return Colors.grey.shade400; // disabled color
                                            }
                                            return const Color.fromRGBO(8, 128, 234, 1); // enabled color
                                          },
                                        ),
                                        elevation: WidgetStateProperty.all(1),
                                        padding: WidgetStateProperty.all(
                                          const EdgeInsets.symmetric(horizontal: 18),
                                        ),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            side: const BorderSide(
                                              color: Colors.white24,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        shadowColor: WidgetStateProperty.all(
                                          const Color.fromRGBO(10, 13, 18, 0.05),
                                        ),
                                        overlayColor: WidgetStateProperty.resolveWith<Color?>(
                                          (states) => states.contains(WidgetState.pressed) ? Colors.white10 : null,
                                        ),
                                      ),
                                      child: Text(
                                        context.locale.login,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                RichText(
                                  text: TextSpan(
                                    text: context.locale.dontHaveAccount,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(100, 100, 100, 1),
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 24 / 16,
                                      letterSpacing: -0.3,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' ',
                                        style: context.textTheme.bodyMedium?.copyWith(
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          height: 1.5,
                                          letterSpacing: -0.3,
                                        ),
                                      ),
                                      TextSpan(
                                        text: context.locale.register,
                                        style: context.textTheme.bodyMedium?.copyWith(
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: AppColors.primaryColor,
                                          height: 1.5,
                                          letterSpacing: -0.3,
                                        ),
                                        mouseCursor: SystemMouseCursors.click,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            context.push(RouteConstant.signup);
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
      ),
    );
  }

  Future<void> _handleNavigationOnLogin(BuildContext context) async {
    try {
      final hasSeenNotificationScreen = await prefsHelper.hasSeenNotificationScreen();

      if (!hasSeenNotificationScreen) {
        context.go(RouteConstant.selectNotification);
      } else {
        context.go(RouteConstant.home);
      }
    } catch (e) {
      debugPrint('Error checking notification screen status: $e');
    }
  }

  void loginUser(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<SigninCubit>().signIn(
            usernameController.text,
            passwordController.text,
          );
    }
  }
}

class AppVersion extends StatelessWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            context.locale.version,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 5),
          FutureBuilder(
            initialData: PackageInfo(
              appName: 'Unknown',
              packageName: 'Unknown',
              version: 'N/A',
              buildNumber: 'N/A',
              buildSignature: 'Unknown',
            ),
            future: PackageInfo.fromPlatform(),
            builder: (context, ss) {
              final PackageInfo packageInfo = ss.data!;
              return Text(
                '${packageInfo.version}+${packageInfo.buildNumber}',
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.primary,
                ),
              );
            },
          ),
        ],
      ),
    ]);
  }
}

class TrackonNewLogo extends StatelessWidget {
  const TrackonNewLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/logo_trackon.png',
      height: MediaQuery.of(context).size.height * 0.028,
    );
  }
}
