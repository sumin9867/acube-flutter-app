import 'package:flutter/material.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/subscription_color.dart';

class TimeButtonGroup extends StatelessWidget {
  final List<TimeOption> options;
  final String selectedLabel;
  final Function(String) onSelect;

  const TimeButtonGroup({
    super.key,
    required this.options,
    required this.selectedLabel,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: options.map((option) {
          final bool isSelected = option.label == selectedLabel;
          final textColor = isSelected ? Colors.white : Colors.black87;

          return GestureDetector(
            onTap: () => onSelect(option.label),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              height: 150,
              width: 120,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: isSelected
                    ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF0880EA), // #0880EA
                          Color(0xFF126CC0), // #126CC0
                        ],
                      )
                    : null,
                color: isSelected ? null : Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.label,
                    style: context.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.w700, color: textColor, fontSize: 15),
                  ),
                  const Spacer(),
                  Text(
                    '${context.locale.rs}. ${option.amount}',
                    style: context.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.w700, color: textColor, fontSize: 16),
                  ),
                  if (option.originalAmount > 0)
                    if (option.originalAmount > 0)
                      Text(
                        '${context.locale.rs}. ${option.originalAmount}',
                        style: context.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: isSelected ? SubscriptionAppColors.white : SubscriptionAppColors.textPrimary,
                          fontSize: 13,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: isSelected ? SubscriptionAppColors.white : SubscriptionAppColors.textPrimary,
                        ),
                      ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

enum DiscountType {
  percentage, // e.g. 20% off
  fixedAmount, // e.g. ₹100 off
  none,
}

class TimeOption {
  final String label;
  final int amount;
  final int originalAmount; // optional, e.g. crossed out price
  final int discount; // value depends on discountType
  final DiscountType discountType;

  TimeOption({
    required this.label,
    required this.amount,
    this.originalAmount = 0,
    this.discount = 0,
    this.discountType = DiscountType.none,
  });

  int get finalAmount {
    switch (discountType) {
      case DiscountType.percentage:
        return (amount * (100 - discount) / 100).round();
      case DiscountType.fixedAmount:
        return amount - discount;
      case DiscountType.none:
      default:
        return amount;
    }
  }
}
