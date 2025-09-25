import 'package:flutter/material.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/presentation/screens/auth/sign_in/signin_screen.dart';
import 'package:gpspro/router/router.dart';
import 'package:gpspro/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ErrorScreen extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onRetry;

  const ErrorScreen({
    super.key,
    required this.title,
    required this.message,
    required this.onRetry,
  });

  bool get isSessionExpired =>
      message.toLowerCase().contains('session expired') ||
      message.toLowerCase().contains('unauthorized') ||
      message.toLowerCase().contains('401');

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox.expand(
      child: Stack(
        children: [
          // Centered main content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/error_widget.png',
                    height: 400,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: screenWidth * 0.08,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
                          fontSize: screenWidth * 0.035,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: AppColors.newUIprimaryColor,
                        ),
                        icon: const Icon(Icons.refresh, color: Colors.white),
                        label: const Text(
                          'Try Again',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                        onPressed: onRetry,
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                          side: const BorderSide(color: Colors.black87, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        icon: const Icon(Icons.login, color: Colors.black87),
                        label: const Text(
                          'Login',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
                        ),
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.remove('profilePicId');
                          locator<AuthCubit>().requestUnAuthentication();
                          locator<AppRouter>().go(RouteConstant.signin);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: AppVersion(),
            ),
          ),
        ],
      ),
    );
  }
}
