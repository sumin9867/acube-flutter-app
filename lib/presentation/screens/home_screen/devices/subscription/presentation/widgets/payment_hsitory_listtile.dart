import 'package:flutter/material.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_history_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/payment_success_screen.dart';
import 'package:intl/intl.dart';

class PaymentHistoryListTile extends StatelessWidget {
  const PaymentHistoryListTile({super.key, required this.paymentHistory});

  final PaymentHistoryModel paymentHistory;

  String _formatDate(String dateString) {
    final DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('MMM dd, yyyy hh:mm a').format(dateTime);
  }

  Widget _buildStatusContainer(String status) {
    Color bgColor;
    Color textColor;

    switch (status.toLowerCase()) {
      case 'completed':
        bgColor = const Color.fromARGB(255, 226, 255, 227);
        textColor = Colors.green;

        break;
      case 'pending':
        bgColor = const Color.fromARGB(255, 255, 243, 225);
        textColor = Colors.orange;

        break;
      default:
        bgColor = Colors.grey;
        textColor = Colors.black;
    }

    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: textColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PaymentSuccessScreen(paymentId: paymentHistory.$id),
      )),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(width: 0.5, color: Color.fromARGB(255, 212, 212, 212))),
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      title: Row(
        children: [
          Text(
            _formatDate(paymentHistory.$createdAt),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          _buildStatusContainer(paymentHistory.status),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Row(
          children: [
            Text(
              'Rs. ${paymentHistory.amount}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 6),
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              paymentHistory.method.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
