import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/subscription.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/coupon_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/esewa_init_payment_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/khalti_init_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_history_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_response.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/repository/i_payment_repo.dart';
import 'package:injectable/injectable.dart';

part 'subscription_cubit.freezed.dart';
part 'subscription_state.dart';

@injectable
class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit(this.paymentRepo) : super(const SubscriptionState.initial());

  final IPaymentRepo paymentRepo;

  Future<void> fetchCoupon(String couponCode) async {
    emit(const SubscriptionState.loading());

    final result = await paymentRepo.getCouponResponse(couponCode);

    result.fold(
      (failure) => emit(SubscriptionState.couponnError(failure)),
      (coupon) => emit(SubscriptionState.couponDetailsLoaded(coupon)),
    );
  }

  Future<void> kaltiPaymentVerification(String pidx) async {
    emit(const SubscriptionState.loading());

    final result = await paymentRepo.paymentVerification(pidx);

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (success) => emit(SubscriptionState.paymentResponce(success)),
    );
  }

  final List<PaymentHistoryModel> _allPayments = [];
  bool _hasMoreItems = true;

  Future<void> getPaymentHistory(String page, String limit) async {
    if (page == '1') {
      emit(const SubscriptionState.loading());
      _allPayments.clear(); // Clear existing data when loading first page
    }

    final result = await paymentRepo.getPaymentHistory(page, limit);

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (success) {
        _allPayments.addAll(success);

        // Determine if we have more items based on received data size
        _hasMoreItems = success.length >= int.parse(limit);

        emit(SubscriptionState.paymentHistory(_allPayments, _hasMoreItems));
      },
    );
  }

  Future<void> getPaymentHistorySpecific(String vehicleId) async {
    emit(const SubscriptionState.loading());

    final result = await paymentRepo.getPaymentHistoryDevice(vehicleId);
    log('I am resposne from $result');

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (success) {
        emit(SubscriptionState.paymentHistoryDevice(success));
      },
    );
  }

  Future<void> esewaPaymentVerification(String token) async {
    emit(const SubscriptionState.loading());

    final result = await paymentRepo.esewapaymentVerification(token);

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (success) => emit(SubscriptionState.paymentResponce(success)),
    );
  }

  Future<void> redirectEsewa({
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
  }) async {
    emit(const SubscriptionState.loading());

    final result = await paymentRepo.redirectEsewa(
        amount: amount,
        failureUrl: failureUrl,
        productDeliveryCharge: productDeliveryCharge,
        productServiceCharge: productServiceCharge,
        productCode: productCode,
        signature: signature,
        signedFieldNames: signedFieldNames,
        successUrl: successUrl,
        taxAmount: taxAmount,
        totalAmount: totalAmount,
        transactionUuid: transactionUuid);

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (success) => emit(SubscriptionState.esewaRedirect(success)),
    );
  }

  Future<void> khaltiInit({
    required String finalUrl,
    required String client,
    required String deviceId,
    required String duration,
    required String? coupon,
    required String durationType,
  }) async {
    emit(const SubscriptionState.loading());

    final result = await paymentRepo.getKhaltiInitResponse(
        finalUrl: finalUrl,
        client: client,
        deviceId: deviceId,
        duration: duration,
        coupon: coupon,
        durationType: durationType);

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (success) => emit(SubscriptionState.khaltiInitResponse(success)),
    );
  }

  Future<void> esewaInit({
    required String finalUrl,
    required String client,
    required String deviceId,
    required String duration,
    required String? coupon,
    required String durationType,
  }) async {
    emit(const SubscriptionState.loading());

    final result = await paymentRepo.esewaInit(finalUrl, client, deviceId, duration, coupon, durationType);

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (success) => emit(SubscriptionState.esewaInitResponse(success)),
    );
  }

  Future<void> esewaRedirect({
    required String finalUrl,
    required String client,
    required String deviceId,
    required String duration,
    required String? coupon,
    required String durationType,
  }) async {
    emit(const SubscriptionState.loading());

    final result = await paymentRepo.esewaInit(finalUrl, client, deviceId, duration, coupon, durationType);

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (success) => emit(SubscriptionState.esewaInitResponse(success)),
    );
  }

  Future<void> fetchSubscriptions() async {
    try {
      emit(const SubscriptionState.loading());

      final List<SubscriptionModel> fetchedSubscriptions = await paymentRepo.getPricing();

      emit(SubscriptionState.pricesLoaded(fetchedSubscriptions));
    } catch (e) {
      emit(SubscriptionState.error('Error fetching subscriptions: $e'));
    }
  }
}
