import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void showLoadingDialog(BuildContext context, String text, bool image) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image
              ? SvgPicture.asset(
                  'assets/icons/trackon_loading.svg',
                  height: 240,
                )
              : Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 80,
                  width: 80,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
          Text(
            text,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              height: 1.5,
              letterSpacing: 0,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          )
        ],
      ),
    ),
  );
}

void dismissLoadingDialog(BuildContext context) {
  if (Navigator.of(context, rootNavigator: true).canPop()) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
