// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToHome() {
      Navigator.pushReplacementNamed(context, '/');
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/noconnection.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 100,
            left: 30,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              onPressed: () async {
                try {
                  final result = await InternetAddress.lookup('google.com');
                  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                    navigateToHome();
                  }
                } on SocketException catch (_) {
                  // Fluttertoast.showToast(msg: 'No connection!!');
                  AppToast.showError(
                      message: 'No connection!!', context: context);
                }
              },
              child: Text('Retry'.toUpperCase()),
            ),
          )
        ],
      ),
    );
  }
}
