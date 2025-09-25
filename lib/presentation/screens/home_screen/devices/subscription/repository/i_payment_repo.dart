import 'package:dartz/dartz.dart';
import 'package:gpspro/domain/models/subscription.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/coupon_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/esewa_init_payment_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/khalti_init_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_history_details.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_history_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_response.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/transaction_summary.dart';

abstract class IPaymentRepo {
  Future<List<SubscriptionModel>> getPricing();

  Future<Either<String, CouponModel>> getCouponResponse(String coupon);
  Future<Either<String, PaymentResponse>> paymentVerification(String pidx);
  Future<Either<String, PaymentResponse>> esewapaymentVerification(String token);
  Future<Either<String, List<PaymentHistoryModel>>> getPaymentHistory(String page, String limit);
  Future<Either<String, List<PaymentHistoryModel>>> getPaymentHistoryDevice(String deviceId);
  Future<Either<String, PaymentHistoryDetails>> getPaymentHistoryDetails(String paymentId);
  Future<Either<String, TransactionSummary>> getTransactionNumber();

  Future<Either<String, String>> redirectEsewa({
    required String amount,
    required String failureUrl,
    required String productDeliveryCharge,
    required String productServiceCharge,
    required String productCode,
    required String signature,
    required String signedFieldNames,
    required String successUrl,
    required String taxAmount,
    required String totalAmount,
    required String transactionUuid,
  });

  Future<Either<String, KhaltiInitModel>> getKhaltiInitResponse({
    required String finalUrl,
    required String client,
    required String deviceId,
    required String duration,
    required String? coupon,
    required String durationType,
  });

  Future<Either<String, EsewaInitPaymentModel>> esewaInit(
      String finalUrl, String client, String deviceId, String duration, String? coupon, String durationType);
}
