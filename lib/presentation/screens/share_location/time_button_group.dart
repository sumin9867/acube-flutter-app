import 'package:flutter/material.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';

class ShareTimeButtonGroup extends StatefulWidget {
  final dynamic updateExpirationTime;
  const ShareTimeButtonGroup({super.key, required this.updateExpirationTime});

  @override
  State<ShareTimeButtonGroup> createState() => _ShareTimeButtonGroupState();
}

class _ShareTimeButtonGroupState extends State<ShareTimeButtonGroup> {
  String selectedLabel = '24 hour';

  @override
  Widget build(BuildContext context) {
    final List<String> options = ['24 hour', '3 days', '7 days', '30 days'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: options.map((label) {
        final bool isSelected = label == selectedLabel;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  selectedLabel = label;
                });
                widget.updateExpirationTime(label);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    isSelected ? const Color.fromRGBO(18, 108, 192, 1) : const Color.fromRGBO(246, 242, 250, 1),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 6),
              ),
              child: AppText(label,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: selectedLabel == label
                        ? const Color.fromRGBO(255, 255, 255, 1)
                        : const Color.fromRGBO(25, 28, 32, 1),
                  )),
            ),
          ),
        );
      }).toList(),
    );
  }
}
