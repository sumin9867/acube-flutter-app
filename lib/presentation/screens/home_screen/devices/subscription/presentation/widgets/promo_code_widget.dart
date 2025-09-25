import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/cubit/subscription_cubit.dart';

class PromoCodeField extends StatefulWidget {
  final TextEditingController promoController;
  final bool onPromoApplied;

  const PromoCodeField({
    super.key,
    required this.promoController,
    required this.onPromoApplied,
  });

  @override
  State<PromoCodeField> createState() => _PromoCodeFieldState();
}

class _PromoCodeFieldState extends State<PromoCodeField> {
  bool isPromoAppliedSuccessfully = false;
  final FocusNode _focusNode = FocusNode();

  void _showPromoModal(BuildContext context) {
    widget.promoController.clear();

    showModalBottomSheet(
      context: context,
      isDismissible: true,
      useRootNavigator: true,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        // Delay focus until modal is fully animated
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) _focusNode.requestFocus();
        });

        return SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: BlocConsumer<SubscriptionCubit, SubscriptionState>(
              listener: (context, state) {
                state.maybeWhen(
                  couponDetailsLoaded: (coupon) {
                    setState(() {
                      isPromoAppliedSuccessfully = true;
                    });
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                final isLoading = state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );

                final errorMessage = state.maybeWhen(
                  couponnError: (message) => message,
                  orElse: () => null,
                );

                return Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.8,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.locale.applyCouponCode,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF181818),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          context.locale.enterCouponCode,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF646464),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                          decoration: BoxDecoration(
                            color: errorMessage != null
                                ? const Color.fromRGBO(255, 1, 1, 0.06)
                                : const Color.fromRGBO(2, 128, 255, 0.07),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: errorMessage != null ? Colors.red : const Color.fromRGBO(0, 145, 255, 1),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context.locale.couponHere,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: errorMessage != null ? Colors.red : const Color.fromRGBO(0, 145, 255, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextField(
                                focusNode: _focusNode,
                                controller: widget.promoController,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              errorMessage,
                              style: const TextStyle(
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                height: 20 / 14,
                                letterSpacing: -0.3,
                                color: Color.fromRGBO(217, 61, 66, 1),
                              ),
                            ),
                          ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: isLoading
                                ? null
                                : () {
                                    final code = widget.promoController.text.trim();
                                    if (code.isEmpty) {
                                      context.read<SubscriptionCubit>().emit(
                                            SubscriptionState.error(
                                              context.locale.pleaseEnterPromoCode,
                                            ),
                                          );
                                      return;
                                    }
                                    context.read<SubscriptionCubit>().fetchCoupon(code);
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0880EA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    context.locale.applyCode,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                        if (Platform.isIOS) const SizedBox(height: 20),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPromoModal(context),
      child: Text(
        isPromoAppliedSuccessfully ? context.locale.couponAppliedSuccess : context.locale.applyCouponCode,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF126CC0),
        ),
      ),
    );
  }
}
