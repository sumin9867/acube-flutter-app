import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentTile extends StatelessWidget {
  final String iconAsset;
  final String amount;
  final String date;
  final String status;

  const PaymentTile({
    super.key,
    required this.iconAsset,
    required this.amount,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFECECEC)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            iconAsset,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              amount,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color.fromRGBO(24, 24, 24, 1)),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(2, 186, 60, 0.09),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/icons/payment/paid.svg'),
                  const SizedBox(width: 4),
                  const Text(
                    'Paid',
                    style: TextStyle(
                      color: Color.fromRGBO(41, 151, 100, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        subtitle: Text(
          date,
          style: const TextStyle(color: Color.fromRGBO(100, 100, 100, 1), fontSize: 14),
        ),
      ),
    );
  }
}
