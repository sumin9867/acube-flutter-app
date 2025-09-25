import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_history_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/subscription_color.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/subscription_detail_widget/info_tile.dart';

class SubscriptionActiveCard extends StatelessWidget {
  final Device device;
  final int daysLeft;
  final String expireDate;
  final List<PaymentHistoryModel>? paymentHistory;

  const SubscriptionActiveCard({
    super.key,
    required this.device,
    required this.daysLeft,
    required this.expireDate,
    this.paymentHistory,
  });

  @override
  Widget build(BuildContext context) {
    // Example: Extract price & duration from paymentHistory if available, else fallback static text
    final price = paymentHistory?.isNotEmpty == true ? 'Rs. ${paymentHistory!.first.amount}' : 'Rs. 2500';
    final duration =
        paymentHistory?.isNotEmpty == true ? '${paymentHistory!.first.durationInfo.duration} Year' : '1 Year';
    log('I am duration $duration');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SubscriptionAppColors.white,
        border: Border.all(color: SubscriptionAppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              AppHelper.getVehicleImage(device).image(
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(device.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 2),
                    Text('#ID${device.id}', style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    daysLeft.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: daysLeft <= 0 ? SubscriptionAppColors.textError : SubscriptionAppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text('Days Left', style: TextStyle(color: Colors.grey)),
                ],
              )
            ],
          ),
          const Divider(color: SubscriptionAppColors.border),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoTile(
                title: 'Price',
                value: price,
                daysLeft: daysLeft,
              ),
              InfoTile(
                title: 'Duration',
                value: duration,
                daysLeft: daysLeft,
              ),
              InfoTile(
                title: 'Expires',
                value: expireDate,
                daysLeft: daysLeft,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
