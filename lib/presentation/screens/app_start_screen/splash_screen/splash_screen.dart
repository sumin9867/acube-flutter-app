// splash_screen.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/router/app_router.dart';
import 'package:gpspro/router/route_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthCubit _authCubit;
  late AppRouter _router;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authCubit = locator.get<AuthCubit>();
      _router = locator.get<AppRouter>();
      _initializeApp();
    });
  }

  Future<bool> _checkFirstRunAndInit() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isFirstRun = prefs.getBool('isFirstRun');
      return isFirstRun ?? true;
    } catch (e, s) {
      debugPrint('SharedPreferences error: $e\n$s');

      return true;
    }
  }

  Future<void> _initializeApp() async {
    try {
      final isFirstRun = await _checkFirstRunAndInit();
      await _authCubit.initialize();
      FlutterNativeSplash.remove();
      if (!mounted) return;

      if (isFirstRun) {
        _router.go(RouteConstant.onBoarding);
      } else if (_authCubit.isAuthenticated && _authCubit.user != null) {
        _router.replace(RouteConstant.home);
      } else {
        _router.replace(RouteConstant.signin);
      }
    } catch (error) {
      FlutterNativeSplash.remove();

      if (!mounted) return;
      AppToast.showError(
        context: context,
        message: 'Error during app initialization: $error',
      );
      _router.replace(RouteConstant.signin);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/logo/vithimap-nobackground.png',
              height: size.height * 0.13,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: size.width / 2,
              child: const LinearProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
