import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/gen/l10n/locale.dart'; // for localization
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/cubit/subscription_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_history_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/subscription_color.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/vehicle_subscription_alert_widget.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/subscription_detail_widget/payment_history_list.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/subscription_detail_widget/subscription_active_card.dart';

class SubscriptionDetailsScreen extends StatefulWidget {
  final Device device;
  final int daysLeft;
  final String expireDate;

  const SubscriptionDetailsScreen({
    super.key,
    required this.device,
    required this.daysLeft,
    required this.expireDate,
  });

  @override
  State<SubscriptionDetailsScreen> createState() => _SubscriptionDetailsScreenState();
}

class _SubscriptionDetailsScreenState extends State<SubscriptionDetailsScreen> {
  List<PaymentHistoryModel>? _paymentHistory;

  @override
  void initState() {
    super.initState();
    context.read<SubscriptionCubit>().getPaymentHistorySpecific(widget.device.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.locale;

    return Scaffold(
      backgroundColor: SubscriptionAppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: SubscriptionAppColors.white,
            pinned: true,
            title: Text(
              l10n.subscriptionDetailsTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            leading: const BackButton(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                l10n.subscriptionActiveTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SubscriptionActiveCard(
                device: widget.device,
                daysLeft: widget.daysLeft,
                expireDate: widget.expireDate,
                paymentHistory: _paymentHistory,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                l10n.subscriptionPaymentHistoryTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          BlocBuilder<SubscriptionCubit, SubscriptionState>(
            builder: (context, state) {
              return PaymentHistoryList(
                state: state,
                onLoaded: (history) => _paymentHistory = history,
              );
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    widget.daysLeft <= 0 ? SubscriptionAppColors.buttonError : SubscriptionAppColors.buttonPrimary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VehicleSubscriptionAlertWidget(device: widget.device),
                ),
              ),
              child: Text(
                widget.daysLeft <= 0 ? l10n.subscriptionRenew : l10n.subscriptionExtend,
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 1.5,
                  letterSpacing: -0.3,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
