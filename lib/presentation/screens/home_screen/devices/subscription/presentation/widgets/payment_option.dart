import 'package:flutter/material.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/theme/app_colors.dart';

class PaymentOptions extends StatelessWidget {
  final String? selectedPayment;
  final Function(String) onSelect;

  const PaymentOptions({
    super.key,
    required this.selectedPayment,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildPaymentOption(context, 'Esewa', Assets.icons.payment.esewa.path),
        const SizedBox(height: 16),
        _buildPaymentOption(context, 'Khalti', Assets.icons.payment.khalti.path),
      ],
    );
  }

  Widget _buildPaymentOption(BuildContext context, String method, String imagePath) {
    final bool isSelected = selectedPayment == method;

    return GestureDetector(
      onTap: () => onSelect(method),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color.fromRGBO(241, 241, 241, 1)),
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(255, 255, 255, 1)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<String>(
              value: method,
              groupValue: selectedPayment,
              onChanged: (value) => onSelect(value!),
              activeColor: AppColors.primaryColor,
            ),
            const SizedBox(width: 8),
            Image.asset(imagePath, width: 40),
            Text(
              method,
              style: const TextStyle(color: Color.fromRGBO(24, 24, 24, 1), fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
