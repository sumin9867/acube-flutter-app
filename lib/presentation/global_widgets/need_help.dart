// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/router/route_helper.dart';

class NeedHelp extends StatelessWidget {
  const NeedHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        tileColor: context.colorScheme.primaryContainer.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        dense: true,
        visualDensity: VisualDensity.comfortable,
        leading: const SizedBox(
          height: 34,
          width: 34,
          child: Icon(Icons.support_agent_rounded),
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Need help? ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * .017), // Make 'Need help?' bold
              ),
              TextSpan(
                text: 'We are here for you',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: MediaQuery.of(context).size.height * .017), // Regular text style
              ),
            ],
          ),
        ),
        onTap: () {
          // RouteHelper.pushCustomerCarePage(
          //   CustomerCareParams(isLoggedIn: true),
          // );
          RouteHelper.pushCustomerCareLandingPage();
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    );
  }
}
