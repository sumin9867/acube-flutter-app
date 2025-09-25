part of 'subscription_cubit.dart';

@freezed
class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState.initial() = _Initial;

  const factory SubscriptionState.loading() = _Loading;

  const factory SubscriptionState.pricesLoaded(List<SubscriptionModel> subscriptions) = _PricesLoaded;
  const factory SubscriptionState.esewaRedirect(String redirectUrl) = _EsewaRedirect;

  const factory SubscriptionState.couponDetailsLoaded(CouponModel coupon) = _CouponDetailsLoaded;

  const factory SubscriptionState.khaltiInitResponse(KhaltiInitModel response) = _KhaltiInitResponse;
  const factory SubscriptionState.esewaInitResponse(EsewaInitPaymentModel response) = _EsewaInitResponse;

  const factory SubscriptionState.paymentResponce(PaymentResponse response) = _PaymentResponce;

  const factory SubscriptionState.paymentHistory(
    List<PaymentHistoryModel> response,
    bool hasMore,
  ) = _PaymentHistory;

  const factory SubscriptionState.paymentHistoryDevice(
    List<PaymentHistoryModel> response,
  ) = _PaymentHistoryDevice;

  const factory SubscriptionState.transactionCountLoaded(int length) = _TransactionCountLoaded;

  const factory SubscriptionState.error(String message) = _Error;
  const factory SubscriptionState.couponnError(String message) = _CoupomError;
}
