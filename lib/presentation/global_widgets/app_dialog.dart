import 'package:flutter/material.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_button.dart';
import 'package:gpspro/router/app_router.dart';

class AppDialogs {
  static Future<T?> showConfirmation<T>({
    String? title,
    String? content,
    required VoidCallback onYes,
  }) async {
    final context = locator.get<AppRouter>().navigationKey.currentContext;
    if (context != null) {
      return await showAdaptiveDialog<T>(
        context: context,
        builder: (context) => SimpleDialog(
          titlePadding: const EdgeInsets.all(24),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          title: title == null ? null : Text(title),
          children: <Widget>[
            if (content != null) Text(content),
            const SizedBox(height: 40),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Flexible(
                    child: AppButton.outlined(
                      onPressed: () => Navigator.of(context).pop(false),
                      label: context.locale.no,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: AppButton.filled(
                      onPressed: onYes,
                      label: (context.locale.yes),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      );
    }
    return null;
  }

  static void showAlertDialog(
    String message,
    String heading,
    String buttonAcceptTitle,
  ) {
    final Widget okButton = SizedBox(
      height: 40,
      child: AppButton.filled(
        label: buttonAcceptTitle,
        onPressed: () {
          locator.get<AppRouter>().pop();
        },
      ),
    );

    final AlertDialog alert = AlertDialog(
      title: Text(heading),
      content: Text(message),
      actions: [
        okButton,
      ],
    );
    final context = locator.get<AppRouter>().navigationKey.currentContext;

    // show the dialog
    if (context != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}
