import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gpspro/core/constants/durations.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/auth/sign_in/signin_screen.dart';
import 'package:gpspro/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  bool isFirstPage = true;
  bool isLastPage = false;

  void _onNext() => _pageController.nextPage(duration: AnimationDuration.onboardingPage, curve: Curves.easeIn);
  void _onSkip() => _onGetStarted();

  void _onGetStarted() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isFirstRun', false);

    locator<AppRouter>().go(RouteConstant.signin);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildCircleImageSection(double height, Widget image, bool isGeofence) {
    final double size = math.min(height - 100, 300);

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: size.toDouble() * 1.3,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(241, 241, 241, 1),
          ),
          child: Center(
            child: isGeofence
                ? ClipOval(
                    child: SizedBox(
                      height: size,
                      width: size,
                      child: image,
                    ),
                  )
                : SizedBox(
                    height: size * 1.1,
                    child: image,
                  ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: height * 0.06,
        ),
        child: Column(
          children: [
            _buildTopBar(context),
            SizedBox(height: height * 0.03),
            Expanded(child: _buildPageView(context)),
            SizedBox(height: height * 0.017),
            _buildPageIndicator(),
            const SizedBox(height: 40),
            _buildActionButton(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TrackonNewLogo(),
          TextButton(
            onPressed: _onSkip,
            child: Text(
              context.locale.skip,
              style: const TextStyle(
                fontFamily: 'SFPro',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 1.5,
                letterSpacing: -0.3,
                color: Color.fromRGBO(100, 100, 100, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageView(BuildContext context) {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          isFirstPage = index == 0;
          isLastPage = index == 2;
        });
      },
      children: [
        _buildIntroPage(context, context.locale.onboardTitle2, context.locale.onboardTitleShort2,
            context.locale.onboardSubtitle2, Assets.images.onboarding.onboardingLiveTracking.image(), false),
        _buildIntroPage(context, context.locale.onboardTitle3, context.locale.onboardTitleShort3,
            context.locale.onboardSubtitle3, Assets.images.onboarding.onboardingNotification.image(), false),
        _buildIntroPage(context, context.locale.onboardTitle4, context.locale.onboardTitleShort4,
            context.locale.onboardSubtitle4, Assets.images.onboarding.geofence.image(), true),
      ],
    );
  }

  Widget _buildIntroPage(
      BuildContext context, String title, String nextTitle, String subtitle, Widget image, bool isGeofence) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildCircleImageSection(height, image, isGeofence),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.08,
          ),
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: const TextStyle(
              fontFamily: 'SFPro',
              fontWeight: FontWeight.w600,
              fontSize: 30,
              height: 1.2857,
              color: Color.fromRGBO(24, 24, 24, 1),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.08,
          ),
          child: Text(
            textAlign: TextAlign.center,
            nextTitle,
            style: const TextStyle(
              fontFamily: 'SFPro',
              fontWeight: FontWeight.w600,
              fontSize: 30,
              height: 1.2857,
              color: Color.fromRGBO(24, 24, 24, 1),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.08,
            vertical: context.height * 0.015,
          ),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'SFPro',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.5,
              letterSpacing: -0.3,
              color: Color.fromRGBO(120, 120, 120, 1),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return SmoothPageIndicator(
      controller: _pageController,
      count: 3,
      effect: const ExpandingDotsEffect(
        dotColor: Color.fromRGBO(37, 0, 73, 0.05),
        dotWidth: 10,
        dotHeight: 9,
        spacing: 6,
        radius: 5,
        activeDotColor: Color.fromRGBO(8, 128, 234, 1),
      ),
    );
  }

  Widget _buildActionButton() {
    return AnimatedCrossFade(
      duration: CrossFadeDuration.fast,
      reverseDuration: CrossFadeDuration.fast,
      crossFadeState: isLastPage ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      secondChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ElevatedButton(
          onPressed: _onGetStarted,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(170, 48),
            backgroundColor: const Color.fromRGBO(8, 128, 234, 1),
            foregroundColor: Colors.white,
            elevation: 1,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                width: 2,
                color: Color.fromRGBO(255, 255, 255, 0.12),
              ),
            ),
          ),
          child: Text(
            context.locale.getStarted,
            style: const TextStyle(
              fontFamily: 'SFPro',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
      firstChild: ElevatedButton(
        onPressed: _onNext,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(170, 48),
          backgroundColor: const Color.fromRGBO(8, 128, 234, 1),
          foregroundColor: Colors.white,
          elevation: 1,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              width: 2,
              color: Color.fromRGBO(255, 255, 255, 0.12),
            ),
          ),
        ),
        child: Text(
          context.locale.next,
          style: const TextStyle(
            fontFamily: 'SFPro',
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
