import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:intl/intl.dart';

class VehicleExpirationBanner extends StatelessWidget {
  const VehicleExpirationBanner({
    super.key,
    required this.daysLeft,
    required this.expirationDate,
    required this.width,
    required this.height,
    required this.padding,
    required this.containerRadius,
    required this.onTap,
  });

  final int daysLeft;
  final DateTime expirationDate;
  final double width;
  final double height;
  final double padding;
  final double containerRadius;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isExpired = daysLeft == 0;
    final double heightFactor = MediaQuery.of(context).size.height < 680 ? 0.06 : 0.05;

    // 🔥 Pick theme colors based on expiration
    final Color mainColor = isExpired ? const Color(0xFFE5484D) : const Color.fromARGB(255, 255, 102, 0);
    final Color backgroundColor =
        isExpired ? const Color.fromRGBO(229, 72, 77, 0.06) : const Color.fromARGB(19, 255, 152, 0);
    final Color badgeColor =
        isExpired ? const Color.fromRGBO(255, 195, 195, 0.4) : const Color.fromRGBO(255, 224, 178, 0.6);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * heightFactor,
        padding: EdgeInsets.symmetric(horizontal: padding),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * .013),
              child: SvgPicture.asset(
                'assets/icons/warning.svg',
                height: width * 0.045,
                color: mainColor,
              ),
            ),
            SizedBox(width: width * 0.01),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height * .013),
                child: Text(
                  isExpired
                      ? context.locale.vehicleExpired
                      : context.locale.vehicleWillExpireOn(
                          DateFormat('MMM dd, yyyy').format(expirationDate),
                        ),
                  style: TextStyle(
                    fontSize: width * 0.03,
                    color: mainColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: height * .008),
              padding: EdgeInsets.symmetric(
                vertical: height * 0.006,
                horizontal: padding / 1.5,
              ),
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(containerRadius),
              ),
              child: Text(
                isExpired ? context.locale.renew : context.locale.daysLeft(daysLeft.toString()),
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.028,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
