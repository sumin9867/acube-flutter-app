// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubscriptionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionStateCopyWith<$Res> {
  factory $SubscriptionStateCopyWith(
          SubscriptionState value, $Res Function(SubscriptionState) then) =
      _$SubscriptionStateCopyWithImpl<$Res, SubscriptionState>;
}

/// @nodoc
class _$SubscriptionStateCopyWithImpl<$Res, $Val extends SubscriptionState>
    implements $SubscriptionStateCopyWith<$Res> {
  _$SubscriptionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SubscriptionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SubscriptionState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SubscriptionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SubscriptionState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$PricesLoadedImplCopyWith<$Res> {
  factory _$$PricesLoadedImplCopyWith(
          _$PricesLoadedImpl value, $Res Function(_$PricesLoadedImpl) then) =
      __$$PricesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SubscriptionModel> subscriptions});
}

/// @nodoc
class __$$PricesLoadedImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$PricesLoadedImpl>
    implements _$$PricesLoadedImplCopyWith<$Res> {
  __$$PricesLoadedImplCopyWithImpl(
      _$PricesLoadedImpl _value, $Res Function(_$PricesLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptions = null,
  }) {
    return _then(_$PricesLoadedImpl(
      null == subscriptions
          ? _value._subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionModel>,
    ));
  }
}

/// @nodoc

class _$PricesLoadedImpl implements _PricesLoaded {
  const _$PricesLoadedImpl(final List<SubscriptionModel> subscriptions)
      : _subscriptions = subscriptions;

  final List<SubscriptionModel> _subscriptions;
  @override
  List<SubscriptionModel> get subscriptions {
    if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscriptions);
  }

  @override
  String toString() {
    return 'SubscriptionState.pricesLoaded(subscriptions: $subscriptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricesLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._subscriptions, _subscriptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_subscriptions));

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PricesLoadedImplCopyWith<_$PricesLoadedImpl> get copyWith =>
      __$$PricesLoadedImplCopyWithImpl<_$PricesLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) {
    return pricesLoaded(subscriptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) {
    return pricesLoaded?.call(subscriptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) {
    if (pricesLoaded != null) {
      return pricesLoaded(subscriptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) {
    return pricesLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) {
    return pricesLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) {
    if (pricesLoaded != null) {
      return pricesLoaded(this);
    }
    return orElse();
  }
}

abstract class _PricesLoaded implements SubscriptionState {
  const factory _PricesLoaded(final List<SubscriptionModel> subscriptions) =
      _$PricesLoadedImpl;

  List<SubscriptionModel> get subscriptions;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PricesLoadedImplCopyWith<_$PricesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EsewaRedirectImplCopyWith<$Res> {
  factory _$$EsewaRedirectImplCopyWith(
          _$EsewaRedirectImpl value, $Res Function(_$EsewaRedirectImpl) then) =
      __$$EsewaRedirectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String redirectUrl});
}

/// @nodoc
class __$$EsewaRedirectImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$EsewaRedirectImpl>
    implements _$$EsewaRedirectImplCopyWith<$Res> {
  __$$EsewaRedirectImplCopyWithImpl(
      _$EsewaRedirectImpl _value, $Res Function(_$EsewaRedirectImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redirectUrl = null,
  }) {
    return _then(_$EsewaRedirectImpl(
      null == redirectUrl
          ? _value.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EsewaRedirectImpl implements _EsewaRedirect {
  const _$EsewaRedirectImpl(this.redirectUrl);

  @override
  final String redirectUrl;

  @override
  String toString() {
    return 'SubscriptionState.esewaRedirect(redirectUrl: $redirectUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EsewaRedirectImpl &&
            (identical(other.redirectUrl, redirectUrl) ||
                other.redirectUrl == redirectUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, redirectUrl);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EsewaRedirectImplCopyWith<_$EsewaRedirectImpl> get copyWith =>
      __$$EsewaRedirectImplCopyWithImpl<_$EsewaRedirectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) {
    return esewaRedirect(redirectUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) {
    return esewaRedirect?.call(redirectUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) {
    if (esewaRedirect != null) {
      return esewaRedirect(redirectUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) {
    return esewaRedirect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) {
    return esewaRedirect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) {
    if (esewaRedirect != null) {
      return esewaRedirect(this);
    }
    return orElse();
  }
}

abstract class _EsewaRedirect implements SubscriptionState {
  const factory _EsewaRedirect(final String redirectUrl) = _$EsewaRedirectImpl;

  String get redirectUrl;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EsewaRedirectImplCopyWith<_$EsewaRedirectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CouponDetailsLoadedImplCopyWith<$Res> {
  factory _$$CouponDetailsLoadedImplCopyWith(_$CouponDetailsLoadedImpl value,
          $Res Function(_$CouponDetailsLoadedImpl) then) =
      __$$CouponDetailsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CouponModel coupon});

  $CouponModelCopyWith<$Res> get coupon;
}

/// @nodoc
class __$$CouponDetailsLoadedImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$CouponDetailsLoadedImpl>
    implements _$$CouponDetailsLoadedImplCopyWith<$Res> {
  __$$CouponDetailsLoadedImplCopyWithImpl(_$CouponDetailsLoadedImpl _value,
      $Res Function(_$CouponDetailsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coupon = null,
  }) {
    return _then(_$CouponDetailsLoadedImpl(
      null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as CouponModel,
    ));
  }

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CouponModelCopyWith<$Res> get coupon {
    return $CouponModelCopyWith<$Res>(_value.coupon, (value) {
      return _then(_value.copyWith(coupon: value));
    });
  }
}

/// @nodoc

class _$CouponDetailsLoadedImpl implements _CouponDetailsLoaded {
  const _$CouponDetailsLoadedImpl(this.coupon);

  @override
  final CouponModel coupon;

  @override
  String toString() {
    return 'SubscriptionState.couponDetailsLoaded(coupon: $coupon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponDetailsLoadedImpl &&
            (identical(other.coupon, coupon) || other.coupon == coupon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coupon);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponDetailsLoadedImplCopyWith<_$CouponDetailsLoadedImpl> get copyWith =>
      __$$CouponDetailsLoadedImplCopyWithImpl<_$CouponDetailsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) {
    return couponDetailsLoaded(coupon);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) {
    return couponDetailsLoaded?.call(coupon);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) {
    if (couponDetailsLoaded != null) {
      return couponDetailsLoaded(coupon);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) {
    return couponDetailsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) {
    return couponDetailsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) {
    if (couponDetailsLoaded != null) {
      return couponDetailsLoaded(this);
    }
    return orElse();
  }
}

abstract class _CouponDetailsLoaded implements SubscriptionState {
  const factory _CouponDetailsLoaded(final CouponModel coupon) =
      _$CouponDetailsLoadedImpl;

  CouponModel get coupon;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CouponDetailsLoadedImplCopyWith<_$CouponDetailsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$KhaltiInitResponseImplCopyWith<$Res> {
  factory _$$KhaltiInitResponseImplCopyWith(_$KhaltiInitResponseImpl value,
          $Res Function(_$KhaltiInitResponseImpl) then) =
      __$$KhaltiInitResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({KhaltiInitModel response});

  $KhaltiInitModelCopyWith<$Res> get response;
}

/// @nodoc
class __$$KhaltiInitResponseImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$KhaltiInitResponseImpl>
    implements _$$KhaltiInitResponseImplCopyWith<$Res> {
  __$$KhaltiInitResponseImplCopyWithImpl(_$KhaltiInitResponseImpl _value,
      $Res Function(_$KhaltiInitResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$KhaltiInitResponseImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as KhaltiInitModel,
    ));
  }

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KhaltiInitModelCopyWith<$Res> get response {
    return $KhaltiInitModelCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$KhaltiInitResponseImpl implements _KhaltiInitResponse {
  const _$KhaltiInitResponseImpl(this.response);

  @override
  final KhaltiInitModel response;

  @override
  String toString() {
    return 'SubscriptionState.khaltiInitResponse(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KhaltiInitResponseImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KhaltiInitResponseImplCopyWith<_$KhaltiInitResponseImpl> get copyWith =>
      __$$KhaltiInitResponseImplCopyWithImpl<_$KhaltiInitResponseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) {
    return khaltiInitResponse(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) {
    return khaltiInitResponse?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) {
    if (khaltiInitResponse != null) {
      return khaltiInitResponse(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) {
    return khaltiInitResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) {
    return khaltiInitResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) {
    if (khaltiInitResponse != null) {
      return khaltiInitResponse(this);
    }
    return orElse();
  }
}

abstract class _KhaltiInitResponse implements SubscriptionState {
  const factory _KhaltiInitResponse(final KhaltiInitModel response) =
      _$KhaltiInitResponseImpl;

  KhaltiInitModel get response;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KhaltiInitResponseImplCopyWith<_$KhaltiInitResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EsewaInitResponseImplCopyWith<$Res> {
  factory _$$EsewaInitResponseImplCopyWith(_$EsewaInitResponseImpl value,
          $Res Function(_$EsewaInitResponseImpl) then) =
      __$$EsewaInitResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EsewaInitPaymentModel response});

  $EsewaInitPaymentModelCopyWith<$Res> get response;
}

/// @nodoc
class __$$EsewaInitResponseImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$EsewaInitResponseImpl>
    implements _$$EsewaInitResponseImplCopyWith<$Res> {
  __$$EsewaInitResponseImplCopyWithImpl(_$EsewaInitResponseImpl _value,
      $Res Function(_$EsewaInitResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$EsewaInitResponseImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as EsewaInitPaymentModel,
    ));
  }

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EsewaInitPaymentModelCopyWith<$Res> get response {
    return $EsewaInitPaymentModelCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$EsewaInitResponseImpl implements _EsewaInitResponse {
  const _$EsewaInitResponseImpl(this.response);

  @override
  final EsewaInitPaymentModel response;

  @override
  String toString() {
    return 'SubscriptionState.esewaInitResponse(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EsewaInitResponseImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EsewaInitResponseImplCopyWith<_$EsewaInitResponseImpl> get copyWith =>
      __$$EsewaInitResponseImplCopyWithImpl<_$EsewaInitResponseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) {
    return esewaInitResponse(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) {
    return esewaInitResponse?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) {
    if (esewaInitResponse != null) {
      return esewaInitResponse(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) {
    return esewaInitResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) {
    return esewaInitResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) {
    if (esewaInitResponse != null) {
      return esewaInitResponse(this);
    }
    return orElse();
  }
}

abstract class _EsewaInitResponse implements SubscriptionState {
  const factory _EsewaInitResponse(final EsewaInitPaymentModel response) =
      _$EsewaInitResponseImpl;

  EsewaInitPaymentModel get response;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EsewaInitResponseImplCopyWith<_$EsewaInitResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentResponceImplCopyWith<$Res> {
  factory _$$PaymentResponceImplCopyWith(_$PaymentResponceImpl value,
          $Res Function(_$PaymentResponceImpl) then) =
      __$$PaymentResponceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentResponse response});

  $PaymentResponseCopyWith<$Res> get response;
}

/// @nodoc
class __$$PaymentResponceImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$PaymentResponceImpl>
    implements _$$PaymentResponceImplCopyWith<$Res> {
  __$$PaymentResponceImplCopyWithImpl(
      _$PaymentResponceImpl _value, $Res Function(_$PaymentResponceImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$PaymentResponceImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as PaymentResponse,
    ));
  }

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentResponseCopyWith<$Res> get response {
    return $PaymentResponseCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$PaymentResponceImpl implements _PaymentResponce {
  const _$PaymentResponceImpl(this.response);

  @override
  final PaymentResponse response;

  @override
  String toString() {
    return 'SubscriptionState.paymentResponce(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentResponceImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentResponceImplCopyWith<_$PaymentResponceImpl> get copyWith =>
      __$$PaymentResponceImplCopyWithImpl<_$PaymentResponceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) {
    return paymentResponce(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) {
    return paymentResponce?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) {
    if (paymentResponce != null) {
      return paymentResponce(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) {
    return paymentResponce(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) {
    return paymentResponce?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) {
    if (paymentResponce != null) {
      return paymentResponce(this);
    }
    return orElse();
  }
}

abstract class _PaymentResponce implements SubscriptionState {
  const factory _PaymentResponce(final PaymentResponse response) =
      _$PaymentResponceImpl;

  PaymentResponse get response;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentResponceImplCopyWith<_$PaymentResponceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentHistoryImplCopyWith<$Res> {
  factory _$$PaymentHistoryImplCopyWith(_$PaymentHistoryImpl value,
          $Res Function(_$PaymentHistoryImpl) then) =
      __$$PaymentHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PaymentHistoryModel> response, bool hasMore});
}

/// @nodoc
class __$$PaymentHistoryImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$PaymentHistoryImpl>
    implements _$$PaymentHistoryImplCopyWith<$Res> {
  __$$PaymentHistoryImplCopyWithImpl(
      _$PaymentHistoryImpl _value, $Res Function(_$PaymentHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? hasMore = null,
  }) {
    return _then(_$PaymentHistoryImpl(
      null == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as List<PaymentHistoryModel>,
      null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PaymentHistoryImpl implements _PaymentHistory {
  const _$PaymentHistoryImpl(
      final List<PaymentHistoryModel> response, this.hasMore)
      : _response = response;

  final List<PaymentHistoryModel> _response;
  @override
  List<PaymentHistoryModel> get response {
    if (_response is EqualUnmodifiableListView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_response);
  }

  @override
  final bool hasMore;

  @override
  String toString() {
    return 'SubscriptionState.paymentHistory(response: $response, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentHistoryImpl &&
            const DeepCollectionEquality().equals(other._response, _response) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_response), hasMore);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentHistoryImplCopyWith<_$PaymentHistoryImpl> get copyWith =>
      __$$PaymentHistoryImplCopyWithImpl<_$PaymentHistoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) {
    return paymentHistory(response, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) {
    return paymentHistory?.call(response, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) {
    if (paymentHistory != null) {
      return paymentHistory(response, hasMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) {
    return paymentHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) {
    return paymentHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) {
    if (paymentHistory != null) {
      return paymentHistory(this);
    }
    return orElse();
  }
}

abstract class _PaymentHistory implements SubscriptionState {
  const factory _PaymentHistory(
          final List<PaymentHistoryModel> response, final bool hasMore) =
      _$PaymentHistoryImpl;

  List<PaymentHistoryModel> get response;
  bool get hasMore;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentHistoryImplCopyWith<_$PaymentHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentHistoryDeviceImplCopyWith<$Res> {
  factory _$$PaymentHistoryDeviceImplCopyWith(_$PaymentHistoryDeviceImpl value,
          $Res Function(_$PaymentHistoryDeviceImpl) then) =
      __$$PaymentHistoryDeviceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PaymentHistoryModel> response});
}

/// @nodoc
class __$$PaymentHistoryDeviceImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$PaymentHistoryDeviceImpl>
    implements _$$PaymentHistoryDeviceImplCopyWith<$Res> {
  __$$PaymentHistoryDeviceImplCopyWithImpl(_$PaymentHistoryDeviceImpl _value,
      $Res Function(_$PaymentHistoryDeviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$PaymentHistoryDeviceImpl(
      null == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as List<PaymentHistoryModel>,
    ));
  }
}

/// @nodoc

class _$PaymentHistoryDeviceImpl implements _PaymentHistoryDevice {
  const _$PaymentHistoryDeviceImpl(final List<PaymentHistoryModel> response)
      : _response = response;

  final List<PaymentHistoryModel> _response;
  @override
  List<PaymentHistoryModel> get response {
    if (_response is EqualUnmodifiableListView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_response);
  }

  @override
  String toString() {
    return 'SubscriptionState.paymentHistoryDevice(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentHistoryDeviceImpl &&
            const DeepCollectionEquality().equals(other._response, _response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_response));

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentHistoryDeviceImplCopyWith<_$PaymentHistoryDeviceImpl>
      get copyWith =>
          __$$PaymentHistoryDeviceImplCopyWithImpl<_$PaymentHistoryDeviceImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) {
    return paymentHistoryDevice(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) {
    return paymentHistoryDevice?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) {
    if (paymentHistoryDevice != null) {
      return paymentHistoryDevice(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) {
    return paymentHistoryDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) {
    return paymentHistoryDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) {
    if (paymentHistoryDevice != null) {
      return paymentHistoryDevice(this);
    }
    return orElse();
  }
}

abstract class _PaymentHistoryDevice implements SubscriptionState {
  const factory _PaymentHistoryDevice(
      final List<PaymentHistoryModel> response) = _$PaymentHistoryDeviceImpl;

  List<PaymentHistoryModel> get response;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentHistoryDeviceImplCopyWith<_$PaymentHistoryDeviceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionCountLoadedImplCopyWith<$Res> {
  factory _$$TransactionCountLoadedImplCopyWith(
          _$TransactionCountLoadedImpl value,
          $Res Function(_$TransactionCountLoadedImpl) then) =
      __$$TransactionCountLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int length});
}

/// @nodoc
class __$$TransactionCountLoadedImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$TransactionCountLoadedImpl>
    implements _$$TransactionCountLoadedImplCopyWith<$Res> {
  __$$TransactionCountLoadedImplCopyWithImpl(
      _$TransactionCountLoadedImpl _value,
      $Res Function(_$TransactionCountLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
  }) {
    return _then(_$TransactionCountLoadedImpl(
      null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TransactionCountLoadedImpl implements _TransactionCountLoaded {
  const _$TransactionCountLoadedImpl(this.length);

  @override
  final int length;

  @override
  String toString() {
    return 'SubscriptionState.transactionCountLoaded(length: $length)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionCountLoadedImpl &&
            (identical(other.length, length) || other.length == length));
  }

  @override
  int get hashCode => Object.hash(runtimeType, length);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionCountLoadedImplCopyWith<_$TransactionCountLoadedImpl>
      get copyWith => __$$TransactionCountLoadedImplCopyWithImpl<
          _$TransactionCountLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) {
    return transactionCountLoaded(length);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) {
    return transactionCountLoaded?.call(length);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) {
    if (transactionCountLoaded != null) {
      return transactionCountLoaded(length);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) {
    return transactionCountLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) {
    return transactionCountLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) {
    if (transactionCountLoaded != null) {
      return transactionCountLoaded(this);
    }
    return orElse();
  }
}

abstract class _TransactionCountLoaded implements SubscriptionState {
  const factory _TransactionCountLoaded(final int length) =
      _$TransactionCountLoadedImpl;

  int get length;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionCountLoadedImplCopyWith<_$TransactionCountLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SubscriptionState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SubscriptionState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CoupomErrorImplCopyWith<$Res> {
  factory _$$CoupomErrorImplCopyWith(
          _$CoupomErrorImpl value, $Res Function(_$CoupomErrorImpl) then) =
      __$$CoupomErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CoupomErrorImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$CoupomErrorImpl>
    implements _$$CoupomErrorImplCopyWith<$Res> {
  __$$CoupomErrorImplCopyWithImpl(
      _$CoupomErrorImpl _value, $Res Function(_$CoupomErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CoupomErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CoupomErrorImpl implements _CoupomError {
  const _$CoupomErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SubscriptionState.couponnError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoupomErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoupomErrorImplCopyWith<_$CoupomErrorImpl> get copyWith =>
      __$$CoupomErrorImplCopyWithImpl<_$CoupomErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubscriptionModel> subscriptions)
        pricesLoaded,
    required TResult Function(String redirectUrl) esewaRedirect,
    required TResult Function(CouponModel coupon) couponDetailsLoaded,
    required TResult Function(KhaltiInitModel response) khaltiInitResponse,
    required TResult Function(EsewaInitPaymentModel response) esewaInitResponse,
    required TResult Function(PaymentResponse response) paymentResponce,
    required TResult Function(List<PaymentHistoryModel> response, bool hasMore)
        paymentHistory,
    required TResult Function(List<PaymentHistoryModel> response)
        paymentHistoryDevice,
    required TResult Function(int length) transactionCountLoaded,
    required TResult Function(String message) error,
    required TResult Function(String message) couponnError,
  }) {
    return couponnError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult? Function(String redirectUrl)? esewaRedirect,
    TResult? Function(CouponModel coupon)? couponDetailsLoaded,
    TResult? Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult? Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult? Function(PaymentResponse response)? paymentResponce,
    TResult? Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult? Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult? Function(int length)? transactionCountLoaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? couponnError,
  }) {
    return couponnError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionModel> subscriptions)? pricesLoaded,
    TResult Function(String redirectUrl)? esewaRedirect,
    TResult Function(CouponModel coupon)? couponDetailsLoaded,
    TResult Function(KhaltiInitModel response)? khaltiInitResponse,
    TResult Function(EsewaInitPaymentModel response)? esewaInitResponse,
    TResult Function(PaymentResponse response)? paymentResponce,
    TResult Function(List<PaymentHistoryModel> response, bool hasMore)?
        paymentHistory,
    TResult Function(List<PaymentHistoryModel> response)? paymentHistoryDevice,
    TResult Function(int length)? transactionCountLoaded,
    TResult Function(String message)? error,
    TResult Function(String message)? couponnError,
    required TResult orElse(),
  }) {
    if (couponnError != null) {
      return couponnError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PricesLoaded value) pricesLoaded,
    required TResult Function(_EsewaRedirect value) esewaRedirect,
    required TResult Function(_CouponDetailsLoaded value) couponDetailsLoaded,
    required TResult Function(_KhaltiInitResponse value) khaltiInitResponse,
    required TResult Function(_EsewaInitResponse value) esewaInitResponse,
    required TResult Function(_PaymentResponce value) paymentResponce,
    required TResult Function(_PaymentHistory value) paymentHistory,
    required TResult Function(_PaymentHistoryDevice value) paymentHistoryDevice,
    required TResult Function(_TransactionCountLoaded value)
        transactionCountLoaded,
    required TResult Function(_Error value) error,
    required TResult Function(_CoupomError value) couponnError,
  }) {
    return couponnError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PricesLoaded value)? pricesLoaded,
    TResult? Function(_EsewaRedirect value)? esewaRedirect,
    TResult? Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult? Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult? Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult? Function(_PaymentResponce value)? paymentResponce,
    TResult? Function(_PaymentHistory value)? paymentHistory,
    TResult? Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult? Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoupomError value)? couponnError,
  }) {
    return couponnError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PricesLoaded value)? pricesLoaded,
    TResult Function(_EsewaRedirect value)? esewaRedirect,
    TResult Function(_CouponDetailsLoaded value)? couponDetailsLoaded,
    TResult Function(_KhaltiInitResponse value)? khaltiInitResponse,
    TResult Function(_EsewaInitResponse value)? esewaInitResponse,
    TResult Function(_PaymentResponce value)? paymentResponce,
    TResult Function(_PaymentHistory value)? paymentHistory,
    TResult Function(_PaymentHistoryDevice value)? paymentHistoryDevice,
    TResult Function(_TransactionCountLoaded value)? transactionCountLoaded,
    TResult Function(_Error value)? error,
    TResult Function(_CoupomError value)? couponnError,
    required TResult orElse(),
  }) {
    if (couponnError != null) {
      return couponnError(this);
    }
    return orElse();
  }
}

abstract class _CoupomError implements SubscriptionState {
  const factory _CoupomError(final String message) = _$CoupomErrorImpl;

  String get message;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoupomErrorImplCopyWith<_$CoupomErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
