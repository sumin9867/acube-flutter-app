import 'package:flutter/material.dart';
import 'package:gpspro/core/extensions/extensions.dart';

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          title,
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
      ),
      body: child,
    );
  }
}
