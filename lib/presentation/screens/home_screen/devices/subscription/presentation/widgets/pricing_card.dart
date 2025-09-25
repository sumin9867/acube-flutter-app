import 'package:flutter/material.dart';
import 'package:gpspro/domain/models/subscription.dart';
import 'package:gpspro/gen/l10n/locale.dart';

class PricingCard extends StatefulWidget {
  final int discount;
  final SubscriptionModel? selectedSubscription;
  final bool isPromoApplied;
  final Function(int) onFinalPriceCalculated;

  const PricingCard({
    super.key,
    required this.discount,
    required this.selectedSubscription,
    required this.isPromoApplied,
    required this.onFinalPriceCalculated,
  });

  @override
  State<PricingCard> createState() => _PricingCardState();
}

class _PricingCardState extends State<PricingCard> {
  @override
  void initState() {
    super.initState();
    _notifyParent();
  }

  @override
  void didUpdateWidget(covariant PricingCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedSubscription != widget.selectedSubscription ||
        oldWidget.discount != widget.discount ||
        oldWidget.isPromoApplied != widget.isPromoApplied) {
      _notifyParent();
    }
  }

  void _notifyParent() {
    final int finalPrice = _calculateFinalPrice(widget.selectedSubscription, widget.discount);
    widget.onFinalPriceCalculated(finalPrice);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.locale;

    return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(spacing: 8, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(l10n.summary, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.basePrice,
                style: const TextStyle(color: Color.fromRGBO(100, 100, 100, 1)),
              ),
              Text(
                '${l10n.nrs}. ${widget.selectedSubscription?.durationPrice}',
                style: const TextStyle(color: Color.fromRGBO(100, 100, 100, 1), fontWeight: FontWeight.w600),
              ),
            ],
          ),
          if (widget.isPromoApplied)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.promoApplied),
                Text(
                  '- ${l10n.rs}. ${widget.discount}',
                  style: const TextStyle(color: Color.fromRGBO(100, 100, 100, 1), fontWeight: FontWeight.w600),
                ),
              ],
            ),
          if (widget.selectedSubscription?.discount != 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.discountPrice,
                  style: const TextStyle(color: Color.fromRGBO(100, 100, 100, 1), fontWeight: FontWeight.w500),
                ),
                Text(
                  '${widget.selectedSubscription?.discount}${widget.selectedSubscription?.discountType == "percentage" ? "%" : widget.selectedSubscription?.discountType}',
                ),
              ],
            ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.totalPrice,
                style: const TextStyle(color: Color.fromRGBO(24, 24, 24, 1), fontWeight: FontWeight.w700, fontSize: 15),
              ),
              Text(
                '${l10n.nrs}. ${_calculateFinalPrice(widget.selectedSubscription, widget.discount)}',
                style: const TextStyle(color: Color.fromRGBO(24, 24, 24, 1), fontWeight: FontWeight.w700, fontSize: 15),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.daysAdded,
                style: const TextStyle(color: Color.fromRGBO(100, 100, 100, 1), fontWeight: FontWeight.w500),
              ),
              Text(
                '${(widget.selectedSubscription?.duration ?? 1) * 365} Days',
                style: const TextStyle(fontWeight: FontWeight.w600, color: Color.fromRGBO(100, 100, 100, 1)),
              ),
            ],
          ),
          if (widget.selectedSubscription?.bonusDays != null && widget.selectedSubscription!.bonusDays > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.bonusDays,
                  style: const TextStyle(color: Color.fromRGBO(100, 100, 100, 1), fontWeight: FontWeight.w500),
                ),
                Text(
                  '+${widget.selectedSubscription!.bonusDays} Days',
                  style: const TextStyle(color: Color.fromRGBO(41, 151, 100, 1), fontWeight: FontWeight.w600),
                ),
              ],
            ),
        ]));
  }

  int _calculateFinalPrice(SubscriptionModel? subscription, int couponDiscount) {
    if (subscription == null) return 0;

    final int durationPrice = subscription.durationPrice;
    final int subscriptionDiscount = subscription.discount;
    final String? discountType = subscription.discountType;

    int finalDiscount = 0;

    if (discountType == 'percentage') {
      finalDiscount = ((durationPrice * subscriptionDiscount) / 100).round();
    } else {
      finalDiscount = subscriptionDiscount;
    }

    final int discountedPrice = durationPrice - finalDiscount - couponDiscount;

    return discountedPrice > 0 ? discountedPrice : 0;
  }
}
