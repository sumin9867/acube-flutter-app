import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppToast {
  static void showSuccess({String? message, required BuildContext context}) {
    _showToast(
      message: message ?? 'Operation completed successfully!',
      type: ToastType.success,
      context: context,
    );
  }

  static void showError({String? message, required BuildContext context}) {
    _showToast(
      message: message ?? 'Something went wrong!',
      type: ToastType.error,
      context: context,
    );
  }

  static void showWarning({String? message, required BuildContext context}) {
    _showToast(
      message: message ?? 'Something went wrong!',
      type: ToastType.warning,
      context: context,
    );
  }

  static void _showToast({required String message, required ToastType type, required BuildContext context}) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;
    final animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 400),
    );

    final animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ));

    void closeToast() async {
      await animationController.reverse();
      entry.remove();
      animationController.dispose();
    }

    entry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: SlideTransition(
            position: animation,
            child: _buildToastCard(
              message: message,
              type: type,
              onClose: closeToast,
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    animationController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (animationController.isCompleted) closeToast();
    });
  }

  static Widget _buildToastCard({
    required String message,
    required ToastType type,
    required VoidCallback onClose,
  }) {
    final isSuccess = type == ToastType.success;
    final isError = type == ToastType.error;

    final assetName = isSuccess
        ? 'sucess.svg'
        : isError
            ? 'error.svg'
            : 'warning_toast.svg';
    final title = isSuccess ? 'Success' : 'Error';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(24, 24, 24, 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 10,
            spreadRadius: 0,
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
          BoxShadow(
            offset: Offset(0, 6),
            blurRadius: 30,
            spreadRadius: 0,
            color: Color.fromRGBO(0, 0, 0, 0.12),
          ),
          BoxShadow(
            offset: Offset(0, 16),
            blurRadius: 24,
            spreadRadius: 0,
            color: Color.fromRGBO(0, 0, 0, 0.14),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: Main,
        children: [
          SvgPicture.asset('assets/icons/$assetName'),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                      color: Color.fromRGBO(230, 224, 233, 1),
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w600, // Closest to 590, since Flutter uses 100–900
                      fontSize: 14,
                      height: 20 / 14, // line-height ÷ font-size
                      letterSpacing: -0.3,
                    )),
                const SizedBox(height: 2),
                Text(message,
                    style: const TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400, // Equivalent to 400
                        fontStyle: FontStyle.normal, // 'Regular' maps to normal
                        fontSize: 14,
                        height: 20 / 14, // line-height divided by font-size
                        letterSpacing: -0.3,
                        color: Color.fromRGBO(230, 224, 233, 1))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum ToastType { success, error, warning }
