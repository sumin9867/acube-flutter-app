import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum DoubleBackMode {
  pop,
  doublePop;
}

class CustomDoubleBackToExit extends StatefulWidget {
  const CustomDoubleBackToExit({
    super.key,
    required this.snackBarMessage,
    required this.child,
    this.onWillPop,
    this.onDoubleBack,
    this.doubleBackDuration = const Duration(milliseconds: 1350),
    this.snackbarTextAlign = TextAlign.center,
    this.snackbarTextStyle,
    this.snackbarBackgroundColor = Colors.black54,
    this.snackbarBehavior,
    this.snackbarMargin,
    this.snackbarPadding,
    this.snackbarWidth,
    this.mode = DoubleBackMode.doublePop,
    this.canPop = false,
    this.allowExitOnIOS = false,
  });

  final Widget child;
  final String snackBarMessage;
  final VoidCallback? onWillPop;
  final VoidCallback? onDoubleBack;
  final Duration doubleBackDuration;
  final TextStyle? snackbarTextStyle;
  final TextAlign snackbarTextAlign;
  final Color snackbarBackgroundColor;
  final SnackBarBehavior? snackbarBehavior;
  final EdgeInsets? snackbarMargin;
  final EdgeInsetsGeometry? snackbarPadding;
  final double? snackbarWidth;
  final DoubleBackMode mode;
  final bool canPop;

  final bool allowExitOnIOS;

  @override
  State<CustomDoubleBackToExit> createState() => _CustomDoubleBackToExitState();
}

class _CustomDoubleBackToExitState extends State<CustomDoubleBackToExit> {
  DateTime? currentBackPressTime;

  void handlerPop() {
    if (widget.onWillPop != null) widget.onWillPop!();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) return widget.child;

    void handlerDoublePop() {
      final canPop = Navigator.canPop(context);

      if (io.Platform.isIOS && !canPop && !widget.allowExitOnIOS) return;

      final DateTime now = DateTime.now();

      if (currentBackPressTime == null || now.difference(currentBackPressTime!) > widget.doubleBackDuration) {
        currentBackPressTime = now;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.snackBarMessage,
                textAlign: widget.snackbarTextAlign,
                style: widget.snackbarTextStyle ??
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            duration: widget.doubleBackDuration,
            behavior: widget.snackbarBehavior ?? SnackBarBehavior.floating,
            margin: widget.snackbarMargin ??
                EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .05,
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1,
                ),
            padding: EdgeInsets.zero,
            width: widget.snackbarWidth,
          ),
        );

        return;
      }

      if (widget.onDoubleBack != null) return widget.onDoubleBack!();

      if (canPop) return Navigator.pop(context);

      if (io.Platform.isAndroid) {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      } else {
        io.exit(0);
      }
    }

    return PopScope(
      canPop: widget.canPop,
      onPopInvokedWithResult: (didPop, result) => switch (widget.mode) {
        DoubleBackMode.doublePop => handlerDoublePop(),
        DoubleBackMode.pop => handlerPop(),
      },
      child: widget.child,
    );
  }
}
