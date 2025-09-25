part of 'payment_history_detail_cubit.dart';

@freezed
class PaymentHistoryDetailState with _$PaymentHistoryDetailState {
  const factory PaymentHistoryDetailState.initial() = _Initial;
  const factory PaymentHistoryDetailState.loading() = _Loading;

  const factory PaymentHistoryDetailState.paymentHistoryDetails(
      PaymentHistoryDetails response) = _PaymentHistoryDetails;
      


  const factory PaymentHistoryDetailState.error(String message) = _Error;
}
