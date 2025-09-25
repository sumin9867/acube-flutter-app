import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/constants/api_constant.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/domain/models/subscription.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/coupon_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/esewa_init_payment_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/khalti_init_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_history_details.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_history_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_response.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/transaction_summary.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/repository/i_payment_repo.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPaymentRepo)
class PaymentRepo implements IPaymentRepo {
  final Dio _dio;

  PaymentRepo({Dio? dio}) : _dio = dio ?? Dio() {
    final authCubit = locator.get<AuthCubit>();
    final cookie = authCubit.userSession?.cookie ?? '';

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Accept'] = 'application/json';
        options.headers['Cookie'] = cookie;
        return handler.next(options);
      },
    ));
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      logPrint: print,
    ));
  }

  final String _baseUrl = '${ApiConstant.baseUrl}/payment';

  bool _isSuccess(int? code) => code != null && code >= 200 && code < 300;

  void _handleDioError(DioException e) {
    log('Dio Error: ${e.message ?? 'No error message'}');
    log('Response: ${e.response?.data}');
  }

  @override
  Future<List<SubscriptionModel>> getPricing() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/pricing/available',
      );

      if (_isSuccess(response.statusCode)) {
        return (response.data as List).map((e) => SubscriptionModel.fromJson(e)).toList();
      }
      throw Exception('Failed with status: ${response.statusCode}');
    } catch (e) {
      if (e is DioException) _handleDioError(e);
      throw Exception('Error getting pricing: $e');
    }
  }

  @override
  Future<Either<String, CouponModel>> getCouponResponse(String coupon) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/coupon/validate',
        data: {'code': coupon},
      );

      return _isSuccess(response.statusCode)
          ? Right(CouponModel.fromJson(response.data))
          : const Left('Failed to validate coupon.');
    } catch (e) {
      if (e is DioException) {
        _handleDioError(e);
        return Left(e.response?.data?['message'] ?? 'Error validating coupon');
      }
      return Left('Error validating coupon: $e');
    }
  }

  @override
  Future<Either<String, KhaltiInitModel>> getKhaltiInitResponse({
    required String finalUrl,
    required String client,
    required String deviceId,
    required String duration,
    required String? coupon,
    required String durationType,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/khalti/pay',
        data: {
          'finalUrl': finalUrl,
          'client': client,
          'deviceId': deviceId,
          'duration': int.parse(duration),
          'coupon': coupon,
          'duration_type': durationType,
        },
      );

      return _isSuccess(response.statusCode)
          ? Right(KhaltiInitModel.fromJson(response.data))
          : const Left('Failed to initiate Khalti payment.');
    } catch (e) {
      if (e is DioException) {
        _handleDioError(e);
        return Left(e.response?.data?['message'] ?? 'Error initiating Khalti payment');
      }
      return Left('Error initiating Khalti payment: $e');
    }
  }

  @override
  Future<Either<String, PaymentResponse>> paymentVerification(String pidx) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/khalti/verify',
        data: {'pidx': pidx},
      );

      return _isSuccess(response.statusCode)
          ? Right(PaymentResponse.fromJson(response.data))
          : Left('${response.data['message']}');
    } catch (e) {
      if (e is DioException) {
        _handleDioError(e);
        return Left(e.response?.data?['message'] ?? 'Error validating');
      }
      return Left('$e');
    }
  }

  @override
  Future<Either<String, EsewaInitPaymentModel>> esewaInit(
    String finalUrl,
    String client,
    String deviceId,
    String duration,
    String? coupon,
    String durationType,
  ) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/esewa/pay',
        data: {
          'finalUrl': finalUrl,
          'client': client,
          'deviceId': deviceId,
          'duration': int.parse(duration),
          'coupon': coupon,
          'duration_type': durationType,
        },
      );
      log('Esewa Init Response: ${response.data}');
      return _isSuccess(response.statusCode)
          ? Right(EsewaInitPaymentModel.fromJson(response.data))
          : const Left('Failed to initiate esewa payment.');
    } catch (e) {
      if (e is DioException) {
        _handleDioError(e);
        final errorMap = e.response?.data?['message'];
        if (errorMap is Map && errorMap['message'] is List && errorMap['message'].isNotEmpty) {
          return Left(errorMap['message'][0]);
        } else if (errorMap is String) {
          return Left(errorMap);
        }
        return const Left('Error initiating esewa payment');
      }
      return Left('Error initiating esewa payment: $e');
    }
  }

  @override
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
  }) async {
    try {
      final Map<String, String> body = {
        'amount': amount,
        'failure_url': failureUrl,
        'product_delivery_charge': productDeliveryCharge,
        'product_service_charge': productServiceCharge,
        'product_code': productCode,
        'signature': signature,
        'signed_field_names': signedFieldNames,
        'success_url': successUrl,
        'tax_amount': taxAmount,
        'total_amount': totalAmount,
        'transaction_uuid': transactionUuid,
      };

      final encodedBody = body.entries
          .map((entry) => '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}')
          .join('&');

      final response = await http.post(
        Uri.parse('https://epay.esewa.com.np/api/epay/main/v2/form'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: encodedBody,
      );

      return response.statusCode == 302
          ? Right(response.headers['location'].toString())
          : Left('Payment failed: ${response.statusCode}');
    } catch (e) {
      return Left('Error initiating esewa payment: $e');
    }
  }

  @override
  Future<Either<String, PaymentResponse>> esewapaymentVerification(String token) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/esewa/verify',
        data: {'token': token},
      );

      return _isSuccess(response.statusCode)
          ? Right(PaymentResponse.fromJson(response.data))
          : Left('${response.data['message']}');
    } catch (e) {
      if (e is DioException) {
        _handleDioError(e);
        return Left(e.response?.data?['message'] ?? 'Error validating');
      }
      return Left('$e');
    }
  }

  @override
  Future<Either<String, List<PaymentHistoryModel>>> getPaymentHistory(String page, String limit) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/manage/prev?page=$page&limit=$limit',
      );

      if (_isSuccess(response.statusCode)) {
        final data = response.data['documents'] as List;
        return Right(data.map((e) => PaymentHistoryModel.fromJson(e)).toList());
      }
      return const Left('Failed to getPaymentHistory.');
    } catch (e) {
      if (e is DioException) _handleDioError(e);
      return Left('Error getPaymentHistory: $e');
    }
  }

  @override
  Future<Either<String, List<PaymentHistoryModel>>> getPaymentHistoryDevice(String deviceId) async {
    try {
      final response = await _dio.get(
        'https://api.trackongps.com/api2/payment/history?status=completed&deviceId=$deviceId&limit=20',
      );

      if (_isSuccess(response.statusCode)) {
        final data = response.data['documents'] as List;
        return Right(data.map((e) => PaymentHistoryModel.fromJson(e)).toList());
      }
      return const Left('Failed to getPaymentHistory.');
    } catch (e) {
      if (e is DioException) _handleDioError(e);
      return Left('Error getPaymentHistory: $e');
    }
  }

  @override
  Future<Either<String, PaymentHistoryDetails>> getPaymentHistoryDetails(String paymentId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/manage/prev/$paymentId',
      );

      return _isSuccess(response.statusCode)
          ? Right(PaymentHistoryDetails.fromJson(response.data))
          : const Left('Failed to getPaymentHistory.');
    } catch (e) {
      if (e is DioException) _handleDioError(e);
      return Left('Error getPaymentHistory: $e');
    }
  }

  @override
  Future<Either<String, TransactionSummary>> getTransactionNumber() async {
    try {
      final response = await _dio.get(
        'https://web.trackongps.com/api2/analytics/payment/overview',
      );

      return _isSuccess(response.statusCode)
          ? Right(TransactionSummary.fromJson(response.data))
          : const Left('Failed to get transaction number.');
    } catch (e) {
      if (e is DioException) _handleDioError(e);
      return Left('Error fetching transaction summary: $e');
    }
  }
}
