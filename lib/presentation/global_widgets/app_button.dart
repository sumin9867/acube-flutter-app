import 'package:flutter/material.dart';
import 'package:gpspro/core/extensions/build_context.dart';

enum AppButtonType { filled, outlined }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.type = AppButtonType.filled,
    this.isCircular = false,
    this.height,
  });

  const AppButton.filled({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.isCircular = false,
    this.height,
  }) : type = AppButtonType.filled;

  const AppButton.outlined({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.isCircular = false,
    this.height,
  }) : type = AppButtonType.outlined;

  final AppButtonType type;
  final String label;
  final Widget? icon;
  final VoidCallback? onPressed;
  final bool isCircular;
  final double? height; // <-- new optional height

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final double circularSize = screenWidth * 0.24;
    final double defaultHeight = screenWidth * 0.14;
    final double buttonWidth = screenWidth * 0.8;
    final double fontSize = screenWidth * 0.037;

    final buttonHeight = height ?? defaultHeight;

    final textStyle = context.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
    );

    if (type == AppButtonType.outlined) {
      final buttonStyle = ButtonStyle(
        minimumSize: WidgetStatePropertyAll(
          isCircular ? Size(circularSize, circularSize) : Size(buttonWidth, buttonHeight),
        ),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isCircular ? 50 : 8),
          ),
        ),
        side: WidgetStatePropertyAll(
          BorderSide(
            color: context.theme.primaryColor,
            width: isCircular ? 4 : 2,
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          context.theme.scaffoldBackgroundColor,
        ),
        foregroundColor: WidgetStatePropertyAll(
          context.theme.primaryColor,
        ),
        textStyle: WidgetStatePropertyAll(textStyle),
      );

      return OutlinedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: isCircular
            ? Center(child: icon!)
            : icon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon!,
                      const SizedBox(width: 8),
                      Text(label),
                    ],
                  )
                : Text(label),
      );
    } else {
      final buttonStyle = ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color.fromRGBO(8, 128, 234, 1)),
        minimumSize: WidgetStatePropertyAll(
          isCircular ? Size(circularSize, circularSize) : Size(buttonWidth, buttonHeight),
        ),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        textStyle: WidgetStatePropertyAll(textStyle),
      );
    
      return icon != null
          ? FilledButton.icon(
              onPressed: onPressed,
              style: buttonStyle,
              icon: icon!,
              label: Text(label),
            )
          : FilledButton(
              onPressed: onPressed,
              style: buttonStyle,
              child: Text(label),
            );
    }
  }
}
