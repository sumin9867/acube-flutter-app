import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/domain/arguments/web_arguments.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/subscription.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/cubit/subscription_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/esewa_init_payment_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/subscription_color.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/back_button_widget.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/payment_option.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/pricing_card.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/promo_code_widget.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/time_button_group.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/webview/esewa_web_view_page_payment.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/webview/khalti_web_view_page_payment.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/repository/payment_repo.dart';
import 'package:shimmer/shimmer.dart';

class VehicleSubscriptionAlertWidget extends StatefulWidget {
  final Device device;
  const VehicleSubscriptionAlertWidget({super.key, required this.device});

  @override
  State<VehicleSubscriptionAlertWidget> createState() => _VehicleSubscriptionAlertWidgetState();
}

class _VehicleSubscriptionAlertWidgetState extends State<VehicleSubscriptionAlertWidget> {
  PaymentRepo paymentRepo = PaymentRepo();
  final TextEditingController _promoController = TextEditingController();
  bool isPromoApplied = false;
  int? basePrice;
  String selectedLabel = '1 years';
  int discount = 0;
  String token = '';
  String selectedPayment = 'Esewa';
  String referenceId = '';
  List<SubscriptionModel> subscriptions = [];
  SubscriptionModel? selectedSubscription;
  bool isTextFieldVisible = false;
  EsewaInitPaymentModel? esewaInitResponseData;

  Device? selectedDevice;

  int finalPrice = 0;
  void _updateFinalPrice(int price) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          finalPrice = price;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchSubscriptions();
  }

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  Future<void> _fetchSubscriptions() async {
    try {
      final List<SubscriptionModel> fetchedSubscriptions = await paymentRepo.getPricing();
      setState(() {
        subscriptions = fetchedSubscriptions;
        if (subscriptions.isNotEmpty) {
          selectedSubscription = subscriptions.first;
          basePrice = selectedSubscription!.durationPrice;
        }
      });
    } catch (e) {
      log('Error fetching subscriptions: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SubscriptionAppColors.appBarBackground,
      appBar: AppBar(
        backgroundColor: SubscriptionAppColors.background,
        title: Text(
          context.locale.subscriptionPayment,
          style: const TextStyle(color: SubscriptionAppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocListener<SubscriptionCubit, SubscriptionState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            paymentResponce: (response) {
              context.read<MyDevicesCubit>().refreshDevices();
            },
            esewaRedirect: (redirectUrl) {
              _lunchEsewaPayement(redirectUrl, esewaInitResponseData!);
            },
            esewaInitResponse: (response) {
              esewaInitResponseData = response;
              context.read<SubscriptionCubit>().redirectEsewa(
                  amount: response.amount ?? '',
                  failureUrl: response.failureUrl ?? '',
                  productDeliveryCharge: response.productDeliveryCharge ?? '',
                  productServiceCharge: response.productServiceCharge ?? '',
                  productCode: response.productCode ?? '',
                  signature: response.signature ?? '',
                  signedFieldNames: response.signedFieldNames ?? '',
                  successUrl: response.successUrl ?? '',
                  taxAmount: response.taxAmount ?? '',
                  totalAmount: response.totalAmount ?? '',
                  transactionUuid: response.transactionUuid);
            },
            khaltiInitResponse: (response) {
              _launchKhaltiPayment(response.paymentUrl, response.pidx);
            },
            // error: (message) => {AppToast.showError(message: message, context: context)},
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            couponDetailsLoaded: (coupon) {
              setState(() {
                context.pop();
                token = coupon.token;
                discount = coupon.discount;
                isPromoApplied = true;
                isTextFieldVisible = false;
              });

              AppToast.showSuccess(message: '${context.locale.couponApplied} $discount', context: context);
            },
          );
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  context.locale.selectDuration,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: SubscriptionAppColors.textPrimary,
                  ),
                ),
              ),
              subscriptions.isEmpty
                  ? const TimeButtonGroupShimmer()
                  : TimeButtonGroup(
                      options: subscriptions.map((sub) {
                        return TimeOption(
                          label: '${sub.duration} ${sub.durationUnit}',
                          amount: sub.durationPrice -
                              (sub.discountType == 'percentage'
                                  ? (sub.durationPrice * sub.discount / 100).round()
                                  : sub.discount),
                          originalAmount: sub.durationPrice,
                        );
                      }).toList(),
                      selectedLabel: '${selectedSubscription?.duration} ${selectedSubscription?.durationUnit}',
                      onSelect: _updateSubscription,
                    ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  context.locale.selectPaymentMethod,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: SubscriptionAppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PaymentOptions(
                  selectedPayment: selectedPayment,
                  onSelect: (method) => setState(() => selectedPayment = method),
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PromoCodeField(
                  onPromoApplied: isPromoApplied,
                  promoController: _promoController,
                ),
              ),
              const SizedBox(height: 40),
              PricingCard(
                discount: discount,
                selectedSubscription: selectedSubscription,
                isPromoApplied: isPromoApplied,
                onFinalPriceCalculated: (price) {
                  _updateFinalPrice(price);
                },
              ),
              BottomButtons(
                onCancel: () => Navigator.pop(context),
                onContinue: () async {
                  // 👈 make it async
                  if (selectedPayment == 'Esewa') {
                    await context.read<SubscriptionCubit>().esewaInit(
                          // 👈 await here
                          finalUrl: 'https://www.trackon-gps.com/',
                          client: 'https://www.trackon-gps.com/',
                          deviceId: widget.device.id.toString(),
                          duration: selectedLabel[0],
                          coupon: token,
                          durationType: 'years',
                        );
                  } else {
                    await context.read<SubscriptionCubit>().khaltiInit(
                          finalUrl: 'https://www.trackon-gps.com/',
                          client: 'https://www.trackon-gps.com/',
                          deviceId: widget.device.id.toString(),
                          duration: selectedLabel[0],
                          coupon: token,
                          durationType: 'years',
                        );
                  }
                },
                finalAmount: finalPrice.toString(),
              ),
              if (Platform.isIOS)
                const SizedBox(
                  height: 30,
                ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _updateSubscription(String label) {
    final SubscriptionModel newSubscription = subscriptions.firstWhere(
      (sub) => '${sub.duration} ${sub.durationUnit}' == label,
      orElse: () => subscriptions.first,
    );

    log('Updating subscription to: $label');
    log('New selectedSubscription: ${newSubscription.duration} ${newSubscription.durationUnit}');

    setState(() {
      selectedSubscription = newSubscription;
      basePrice = selectedSubscription!.durationPrice;

      selectedLabel = label;
    });
  }

  Future<void> _launchKhaltiPayment(String url, String pidx) async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => KhaltiPaymentWebViewScreen(
                params: WebViewRouteParams('Khalti Payment', url),
                pidx: pidx,
              )),
    );
  }

  Future<void> _lunchEsewaPayement(String url, EsewaInitPaymentModel esewa) async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EsewaWebViewPagePayment(
                params: WebViewRouteParams('Esewa Payment', url),
                esewaInitPaymentModel: esewa,
              )),
    );
  }
}

class TimeButtonGroupShimmer extends StatelessWidget {
  const TimeButtonGroupShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(5, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              height: 150,
              width: 120,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            );
          }),
        ),
      ),
    );
  }
}
