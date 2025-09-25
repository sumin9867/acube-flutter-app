import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/cubit/subscription_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_history_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/subscription_detail_widget/payment_shimmer.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/subscription_detail_widget/payment_tile.dart';
import 'package:gpspro/presentation/screens/home_screen/error_screen.dart';

class PaymentHistoryList extends StatelessWidget {
  final SubscriptionState state;
  final void Function(List<PaymentHistoryModel>)? onLoaded;

  const PaymentHistoryList({
    super.key,
    required this.state,
    this.onLoaded,
  });

  @override
  Widget build(BuildContext context) {
    return state.maybeWhen(
      loading: () => const PaymentHistoryShimmer(),
      paymentHistoryDevice: (paymentHistory) {
        onLoaded?.call(paymentHistory);

        if (paymentHistory.isEmpty) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Center(child: Text('No payment history found')),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = paymentHistory[index];
              log('Rendering payment item: $item');

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: PaymentTile(
                  iconAsset:
                      item.method == 'esewa' ? 'assets/icons/payment/esewa.png' : 'assets/icons/payment/khalti.png',
                  amount: 'Rs. ${item.amount}',
                  date: item.$createdAt, // format as needed
                  status: item.status,
                ),
              );
            },
            childCount: paymentHistory.length,
          ),
        );
      },
      error: (message) => SliverToBoxAdapter(
        child: ErrorScreen(
          title: 'Error',
          message: message,
          onRetry: () {
            log('Retrying to load payment history');
            // Implement retry logic if needed
          },
        ),
      ),
      orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
    );
  }
}
