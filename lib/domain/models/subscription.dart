// ignore_for_file: non_constant_identifier_names

class SubscriptionModel {
  final String feature;
  final bool isActive;
  final int VAT;
  final int bonusDays;
  final int duration;
  final String durationUnit;
  final int durationPrice;
  final String priceUnit;
  final String? discountType;
  final int discount;

  const SubscriptionModel({
    required this.feature,
    required this.isActive,
    required this.VAT,
    required this.bonusDays,
    required this.duration,
    required this.durationUnit,
    required this.durationPrice,
    required this.priceUnit,
    this.discountType,
    required this.discount,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      feature: json['feature'] ?? '',
      isActive: json['isActive'] ?? false,
      VAT: json['VAT'] ?? 0, // If null, default to 0
      bonusDays: json['bonus_days'] ?? 0,
      duration: json['duration'] ?? 0,
      durationUnit: json['duration_unit'] ?? '',
      durationPrice: json['duration_price'] ?? 0,
      priceUnit: json['price_unit'] ?? '',
      discountType: json['discount_type'], // Nullable, no default needed
      discount: json['discount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feature': feature,
      'isActive': isActive,
      'VAT': VAT,
      'bonus_days': bonusDays,
      'duration': duration,
      'duration_unit': durationUnit,
      'duration_price': durationPrice,
      'price_unit': priceUnit,
      'discount_type': discountType,
      'discount': discount,
    };
  }
}
