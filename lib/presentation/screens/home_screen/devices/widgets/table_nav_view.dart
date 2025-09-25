import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TableNavItem extends StatelessWidget {
  final String icon;
  final String label;
  final double iconSize;
  final VoidCallback onTap;

  const TableNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final verticalPadding = width * 0.030;
    final spacing = width * 0.02;
    final fontSize = width * 0.032;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              height: iconSize,
            ),
            SizedBox(width: spacing),
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
