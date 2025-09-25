import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:gpspro/presentation/screens/add_vehicle/add_vehicle_screen.dart';
import 'package:gpspro/presentation/wrappers/header_footer_wrapper.dart';
import 'package:gpspro/router/router.dart';
import 'package:gpspro/theme/app_colors.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const ContactSupportCard(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5,
          ),
          child: HeaderFooterWrapper(
            header: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Image.asset(
                      'assets/icons/logo_trackon.png',
                      height: 27,
                    )),
                TextButton(
                  onPressed: () {
                    locator<AuthCubit>().requestUnAuthentication();
                    locator<AppRouter>().go(RouteConstant.signin);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icons/logout.svg'),
                      const SizedBox(width: 6),
                      Text(
                        context.locale.logout,
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.newDangerColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  SvgPicture.asset(
                    'assets/icons/welcome.svg',
                    height: 150,
                    width: 150,
                  ),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      state.mapOrNull(
                        authenticated: (value) {
                          return AppText(context.locale.welcomeUser(value.user.name),
                              style: const TextStyle(
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 20,
                                height: 1.5,
                                letterSpacing: 0,
                              ));
                        },
                      );
                      return AppText(context.locale.welcomeTrackon,
                          style: const TextStyle(
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            height: 1.5,
                            letterSpacing: 0,
                          ));
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    context.locale.welcomeMessage,
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      height: 1.5,
                      letterSpacing: -0.3,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return const QrScreenInit(
                            isFirstTime: true,
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      fixedSize: WidgetStateProperty.all(const Size(260, 52)),
                      backgroundColor: WidgetStateProperty.all(const Color.fromRGBO(8, 128, 234, 1)),
                      elevation: WidgetStateProperty.all(0),
                      padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 18)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            width: 2,
                            color: Color.fromRGBO(255, 255, 255, 0.12),
                          ),
                        ),
                      ),
                      shadowColor: WidgetStateProperty.all(Colors.transparent),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/add.svg'),
                        const SizedBox(width: 8),
                        Text(
                          context.locale.addYourVehicle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ButtonStyle(
                  //     fixedSize: WidgetStateProperty.all(const Size(260, 52)),
                  //     backgroundColor: WidgetStateProperty.all(const Color.fromRGBO(255, 255, 255, 1)),
                  //     elevation: WidgetStateProperty.all(0),
                  //     padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 18)),
                  //     shape: WidgetStateProperty.all(
                  //       RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(12),
                  //         side: const BorderSide(
                  //           width: 1,
                  //           color: Color.fromRGBO(235, 235, 235, 1),
                  //         ),
                  //       ),
                  //     ),
                  //     shadowColor: WidgetStateProperty.all(Colors.transparent),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       SvgPicture.asset(
                  //         'assets/icons/local_mall.svg',
                  //         color: Colors.black,
                  //       ),
                  //       const SizedBox(width: 8),
                  //       Text(
                  //         context.locale.buyNewDevice,
                  //         style: const TextStyle(
                  //           color: Colors.black,
                  //           fontFamily: 'SF Pro',
                  //           fontWeight: FontWeight.w600,
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContactSupportCard extends StatelessWidget {
  const ContactSupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFF9F9F9)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 9,
            color: Color.fromRGBO(24, 24, 24, 0.1),
          )
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.locale.needHelp,
            style: const TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 1.5,
              letterSpacing: -0.3,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            context.locale.supportTeam,
            style: const TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.428,
              letterSpacing: -0.3,
              color: Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                RouteHelper.pushCustomerCareLandingPage();
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color.fromRGBO(235, 235, 235, 1), width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: const Color.fromARGB(255, 253, 253, 253),
              ),
              icon: const Icon(Icons.help_outline, color: Colors.black),
              label: Text(context.locale.contactSupport,
                  style: TextStyle(
                    color: AppColors.newTextColor,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 24 / 16,
                    letterSpacing: -0.3,
                  )),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class QrScreenInit extends StatefulWidget {
  final bool isFirstTime;
  const QrScreenInit({super.key, required this.isFirstTime});

  @override
  State<QrScreenInit> createState() => _QrScreenInitState();
}

class _QrScreenInitState extends State<QrScreenInit> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              context.locale.toAddTrackonGps,
              style: const TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                height: 24 / 18,
                letterSpacing: -0.3,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 36, right: 36, bottom: 20),
            child: Text(
              'Scan the QR code located on the back of your tracking device.',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                height: 24 / 16,
                letterSpacing: -0.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(241, 241, 241, 1),
            ),
            child: Image.asset(
              'assets/images/add_device_init.png',
            ),
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue ?? false;
                  });
                },
              ),
              Expanded(
                child: Text(
                  context.locale.locatedQrCodeConfirmation,
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: AppColors.newTextColor,
                    height: 24 / 16,
                    letterSpacing: -0.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 12,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(250, 250, 250, 1),
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(241, 241, 241, 1),
                ),
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(241, 241, 241, 1),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ElevatedButton(
              onPressed: isChecked
                  ? () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) => AddVehicleScreen(
                            isFirstTime: widget.isFirstTime,
                          ),
                        ),
                      );
                    }
                  : null,
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(Size(MediaQuery.of(context).size.width, 52)),
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(WidgetState.disabled)) {
                      return Colors.grey.shade400;
                    }
                    return const Color.fromRGBO(8, 128, 234, 1);
                  },
                ),
                elevation: WidgetStateProperty.all(0),
                padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 18)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(width: 1, color: Color.fromRGBO(235, 235, 235, 1)),
                  ),
                ),
                shadowColor: WidgetStateProperty.all(Colors.transparent),
              ),
              child: Text(
                context.locale.continueToScanQr,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
