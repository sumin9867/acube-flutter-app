import 'package:flutter/material.dart';


class NoDataWidget extends StatelessWidget {
  final String subtitle;
  const NoDataWidget({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // color: context.colorScheme.primaryContainer.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_playback.png',
            height: MediaQuery.of(context).size.height * .25,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
           subtitle,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
