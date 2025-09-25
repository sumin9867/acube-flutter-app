class PaymentHistoryDetails {
  final String? tidx;
  final TransactionInfo? transactionInfo;
  final DeviceInfo? deviceInfo;
  final String? deviceId;
  final String? pidx;
  final String? status;
  final String? method;
  final PricingInfoDetails? pricingInfoDetails;
  final num? amount;
  final DurationInfo? durationInfo;
  final String createdAt;

  PaymentHistoryDetails({
    this.tidx,
    this.transactionInfo,
    required this.createdAt,
    this.deviceInfo,
    this.deviceId,
    this.pidx,
    this.status,
    this.method,
    this.pricingInfoDetails,
    this.amount,
    this.durationInfo,
  });

  factory PaymentHistoryDetails.fromJson(Map<String, dynamic> json) {
    return PaymentHistoryDetails(
      tidx: json['tidx'],
      transactionInfo: json['transactionInfo'] != null
          ? TransactionInfo.fromJson(json['transactionInfo'])
          : null,
      deviceInfo: json['deviceInfo'] != null
          ? DeviceInfo.fromJson(json['deviceInfo'])
          : null,
      deviceId: json['deviceId'],
      pidx: json['pidx'],
      status: json['status'],
      method: json['method'],
      pricingInfoDetails: json['pricingInfo'] != null
          ? PricingInfoDetails.fromJson(json['pricingInfo'])
          : null,
      amount: json['amount'] != null
          ? (json['amount'] is String
              ? num.tryParse(json['amount']) ?? 0.0
              : json['amount'])
          : null,
      durationInfo: json['durationInfo'] != null
          ? DurationInfo.fromJson(json['durationInfo'])
          : null,
      createdAt: json['\$createdAt'],
    );
  }
}

class TransactionInfo {
  final String? pidx;
  final String? productCode;
  final int? totalAmount;
  final String? status;
  final String? transactionId;
  final int? fee;
  final bool? refunded;
  final KhaltiUser? khaltiUser;
  final TransactionInfoDetail? info;

  TransactionInfo({
    this.pidx,
    this.productCode,
    this.totalAmount,
    this.status,
    this.transactionId,
    this.fee,
    this.refunded,
    this.khaltiUser,
    this.info,
  });

  factory TransactionInfo.fromJson(Map<String, dynamic> json) {
    return TransactionInfo(
      pidx: json['pidx'],
      totalAmount: json['total_amount'],
      productCode: json['product_code'],
      status: json['status'],
      transactionId: json['transaction_id'],
      fee: json['fee'],
      refunded: json['refunded'],
      khaltiUser: json['khaltiUser'] != null
          ? KhaltiUser.fromJson(json['khaltiUser'])
          : null,
      info: json['info'] != null
          ? TransactionInfoDetail.fromJson(json['info'])
          : null,
    );
  }
}

class KhaltiUser {
  final String? idx;
  final String? name;

  KhaltiUser({this.idx, this.name});

  factory KhaltiUser.fromJson(Map<String, dynamic> json) {
    return KhaltiUser(
      idx: json['idx'],
      name: json['name'],
    );
  }
}

class TransactionInfoDetail {
  final String? productIdentity;
  final String? productName;
  final String? productUrl;

  TransactionInfoDetail({
    this.productIdentity,
    this.productName,
    this.productUrl,
  });

  factory TransactionInfoDetail.fromJson(Map<String, dynamic> json) {
    return TransactionInfoDetail(
      productIdentity: json['product_identity'],
      productName: json['product_name'],
      productUrl: json['product_url'],
    );
  }
}

class DeviceInfo {
  final int? id;
  final String? name;
  final String? category;
  final String? uniqueId;

  DeviceInfo({
    this.id,
    this.name,
    this.category,
    this.uniqueId,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    return DeviceInfo(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      uniqueId: json['uniqueId'],
    );
  }
}

class PricingInfoDetails {
  final num? originalPrice;
  final num? finalPrice;
  final num? vatAmount;
  final num? discountAmount;
  final PromoDetails? promoDetails;
  final DiscountDetails? discountDetails;
  final VatDetails? vatDetails;

  PricingInfoDetails({
    this.originalPrice,
    this.finalPrice,
    this.vatAmount,
    this.discountAmount,
    this.promoDetails,
    this.discountDetails,
    this.vatDetails,
  });

  factory PricingInfoDetails.fromJson(Map<String, dynamic> json) {
    return PricingInfoDetails(
      originalPrice: json['original_price'] != null
          ? (json['original_price'] is String
              ? num.tryParse(json['original_price']) ?? 0.0
              : json['original_price'])
          : null,
      finalPrice: json['final_price'] != null
          ? (json['final_price'] is String
              ? num.tryParse(json['final_price']) ?? 0.0
              : json['final_price'])
          : null,
      vatAmount: json['vat_amount'] != null
          ? (json['vat_amount'] is String
              ? num.tryParse(json['vat_amount']) ?? 0.0
              : json['vat_amount'])
          : null,
      discountAmount: json['discount_amount'] != null
          ? (json['discount_amount'] is String
              ? num.tryParse(json['discount_amount']) ?? 0.0
              : json['discount_amount'])
          : null,
      promoDetails: json['promo_details'] != null
          ? PromoDetails.fromJson(json['promo_details'])
          : null,
      discountDetails: json['discount_details'] != null
          ? DiscountDetails.fromJson(json['discount_details'])
          : null,
      vatDetails: json['vat_details'] != null
          ? VatDetails.fromJson(json['vat_details'])
          : null,
    );
  }
}

class PromoDetails {
  final String? code;
  final String? discountType;
  final int? discount;
  final DateTime? expiry;
  final int? usageCount;
  final int? usageLimit;

  PromoDetails({
    this.code,
    this.discountType,
    this.discount,
    this.expiry,
    this.usageCount,
    this.usageLimit,
  });

  factory PromoDetails.fromJson(Map<String, dynamic> json) {
    return PromoDetails(
      code: json['code'],
      discountType: json['discount_type'],
      discount: json['discount'],
      expiry: json['expiry'] != null ? DateTime.parse(json['expiry']) : null,
      usageCount: json['usage_count'],
      usageLimit: json['usage_limit'],
    );
  }
}

class DiscountDetails {
  final String? type;
  final num? amount;

  DiscountDetails({
    this.type,
    this.amount,
  });

  factory DiscountDetails.fromJson(Map<String, dynamic> json) {
    return DiscountDetails(
      type: json['type'],
      amount: json['amount'] != null
          ? (json['amount'] is String
              ? num.tryParse(json['amount']) ?? 0.0
              : json['amount'])
          : null,
    );
  }
}

class VatDetails {
  final num? rate;
  final num? amount;

  VatDetails({
    this.rate,
    this.amount,
  });

  factory VatDetails.fromJson(Map<String, dynamic> json) {
    return VatDetails(
      rate: json['rate'] != null
          ? (json['rate'] is String
              ? num.tryParse(json['rate']) ?? 0.0
              : json['rate'])
          : null,
      amount: json['amount'] != null
          ? (json['amount'] is String
              ? num.tryParse(json['amount']) ?? 0.0
              : json['amount'])
          : null,
    );
  }
}

class DurationInfo {
  final int? duration;
  final String? durationUnit;
  final int? bonusDays;

  DurationInfo(
    this.duration,
    this.durationUnit,
    this.bonusDays,
  );

  factory DurationInfo.fromJson(Map<String, dynamic> json) {
    return DurationInfo(
      json['duration'],
      json['duration_unit'],
      json['bonus_days'],
    );
  }
}
