import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/router/router.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.bottomSheet,
    this.floatingActionButton,
  });

  final String title;
  final Widget body;
  final Widget? bottomSheet;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(
          color: context.colorScheme.primary,
        ),
        leadingWidth: 30,
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            locator.get<AppRouter>().pop();
          },
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: context.colorScheme.primary,
          ),
        ),
        shadowColor: Colors.transparent,
      ),
      body: body,
      bottomSheet: bottomSheet,
      floatingActionButton: floatingActionButton,
    );
  }
}

class AppStackScafold extends StatelessWidget {
  const AppStackScafold({
    super.key,
    required this.body,
    this.title,
    this.bottomSheet,
    this.includeTopMargin = false,
    this.onBack,
    this.resizeToAvoidBottomInset = false,
    this.showBackButton = true, // NEW PARAMETER
  });

  final String? title;
  final Widget body;
  final Widget? bottomSheet;
  final bool includeTopMargin;
  final VoidCallback? onBack;
  final bool resizeToAvoidBottomInset;
  final bool showBackButton; // NEW FIELD

  @override
  Widget build(BuildContext context) {
    final backButton = BackButton(
      onPressed: onBack,
      color: context.colorScheme.onPrimary,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(
          context.colorScheme.primary,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: includeTopMargin ? 54 : 0,
              ),
              child: body,
            ),
            if (showBackButton) // ✅ Conditional BackButton
              PositionedDirectional(
                top: 10,
                start: 10,
                child: backButton,
              ),
            if (title != null)
              PositionedDirectional(
                top: 15,
                start: 70,
                child: Text(
                  title!,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomSheet: bottomSheet,
    );
  }
}
