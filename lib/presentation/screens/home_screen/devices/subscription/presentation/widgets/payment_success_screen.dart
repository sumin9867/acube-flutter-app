// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/cubit/payment_history_detail_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_history_details.dart';
import 'package:gpspro/presentation/screens/home_screen/error_screen.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final String paymentId;
  const PaymentSuccessScreen({super.key, required this.paymentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.onPrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0), // Adjust the radius as needed
          ),
          side: BorderSide(
            color: Colors.grey, // Border color
            width: 1, // Border width
          ),
        ),
        title: const Text(
          'Payment Information',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => locator.get<PaymentHistoryDetailCubit>()..getPaymentDetails(paymentId),
          child: Column(
            children: [
              BlocBuilder<PaymentHistoryDetailCubit, PaymentHistoryDetailState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox(),
                    loading: () => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 10,
                        children: [
                          loadingShimmer(),
                          loadingShimmer(),
                          loadingShimmer(),
                          loadingShimmer(),
                          loadingShimmer(),
                          loadingShimmer(),
                        ],
                      ),
                    ),
                    error: (message) => ErrorScreen(
                      title: 'Error',
                      message: message,
                      onRetry: () {
                        context.read<PaymentHistoryDetailCubit>().getPaymentDetails(paymentId);
                      },
                    ),
                    paymentHistoryDetails: (response) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _transactionInfo(response),
                                  const SizedBox(height: 10),
                                  _infoCard(
                                    context: context,
                                    title: 'Coupon Information',
                                    icon: Icons.person_outline,
                                    details: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        _buildRow('Coupon Discount:',
                                            'Rs ${response.pricingInfoDetails?.promoDetails?.discount ?? 'N/A'}'),
                                        _buildRow(
                                            'Coupon Code:', response.pricingInfoDetails?.promoDetails?.code ?? 'N/A'),
                                      ],
                                    ),
                                    payment: response,
                                  ),
                                  const SizedBox(height: 10),
                                  _infoCard(
                                    context: context,
                                    title: 'Device Information',
                                    icon: Icons.devices,
                                    details: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        _buildRow('Vehicle Name:', response.deviceInfo?.name ?? 'N/A'),
                                        _buildRow('Vehicle Type:', response.deviceInfo?.category ?? 'N/A'),
                                        _buildRow('IMEI:', response.deviceInfo?.id.toString() ?? 'N/A'),
                                      ],
                                    ),
                                    payment: response,
                                  ),
                                  const SizedBox(height: 16),
                                  _priceDetails(context, response),
                                  const SizedBox(height: 16),
                                  _durationInfo(context, response),
                                  const SizedBox(height: 16),
                                  _additionalInfo(response, context),
                                ],
                              ),
                            ),
                            // Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              child: ElevatedButton(
                                onPressed: () {
                                  context.pop();
                                  // Button action
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 60),
                                  backgroundColor: context.colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // Circular border of 10
                                  ),
                                ),
                                child: Text(
                                  'Done',
                                  style: TextStyle(color: context.colorScheme.onPrimary, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loadingShimmer() {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: double.infinity,
          height: 20.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _transactionInfo(PaymentHistoryDetails payment) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rs. ${payment.amount}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: payment.status == 'Completed'
                      ? Colors.green.withOpacity(0.1)
                      : const Color.fromARGB(255, 255, 170, 0).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  payment.status ?? '',
                  style: TextStyle(
                      color: payment.status == 'Completed' ? Colors.green : const Color.fromARGB(255, 255, 132, 0)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 12, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text('Transaction Date: ${DateFormat('d/MM/yyyy').format(DateTime.parse(payment.createdAt))}'),
                ],
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  const Icon(Icons.payment, size: 12, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text('Method: ${payment.method?.toUpperCase()}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoCard({
    required String title,
    IconData? icon,
    required Widget details,
    required PaymentHistoryDetails payment,
    required BuildContext context,
  }) {
    final double titleFontSize = MediaQuery.of(context).size.height * 0.015;
    final double detailsFontSize = MediaQuery.of(context).size.height * 0.014;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18, color: Colors.grey),
                const SizedBox(width: 5),
              ],
              Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 6),
            child: DefaultTextStyle(
              style: TextStyle(fontSize: detailsFontSize, color: Colors.black),
              child: details, // Using DefaultTextStyle to apply font size globally
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceDetails(BuildContext context, PaymentHistoryDetails payment) {
    return _sectionContainer(
      context: context,
      title: 'Price Details',
      child: _priceRow(context, payment),
      payment: payment,
    );
  }

  Widget _durationInfo(BuildContext context, PaymentHistoryDetails payment) {
    final double titleFontSize = MediaQuery.of(context).size.height * 0.015;
    final double detailsFontSize = MediaQuery.of(context).size.height * 0.014;
    return _sectionContainer(
      context: context,
      title: 'Duration Information',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.access_time, size: MediaQuery.of(context).size.height * 0.014, color: Colors.grey),
              const SizedBox(width: 5),
              Text('${payment.durationInfo?.duration} year',
                  style: TextStyle(fontSize: detailsFontSize, fontWeight: FontWeight.w600)),
            ],
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Bonus Days:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleFontSize),
                ),
                TextSpan(
                  text: ' Rs.${payment.durationInfo?.bonusDays} ',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: detailsFontSize),
                ),
              ],
            ),
          ),
        ],
      ),
      payment: payment,
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4), // Adds spacing between rows
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.normal)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _additionalInfo(
    PaymentHistoryDetails payment,
    BuildContext context,
  ) {
    final double titleFontSize = MediaQuery.of(context).size.height * 0.015;
    final double detailsFontSize = MediaQuery.of(context).size.height * 0.014;
    return Column(children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Additinal Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleFontSize),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Transaction ID:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleFontSize),
                  ),
                  TextSpan(
                    text: payment.transactionInfo?.transactionId ?? ' N/A',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: detailsFontSize),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Payment ID:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleFontSize),
                  ),
                  TextSpan(
                    text: payment.pidx,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: detailsFontSize),
                  ),
                ],
              ),
            ),
            labeledText(label: 'Product Code', value: payment.transactionInfo?.productCode ?? 'N/A'),
            labeledText(label: 'Total Amount: ', value: payment.pricingInfoDetails?.finalPrice.toString() ?? 'N/A'),
            labeledText(label: 'Status', value: payment.transactionInfo?.status ?? 'Pending'),
          ],
        ),
      )
    ]);
  }

  Widget labeledText({
    required String label,
    required String value,
    double titleFontSize = 12.0,
    double detailsFontSize = 12.0,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: titleFontSize,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: detailsFontSize,
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(BuildContext context, PaymentHistoryDetails payment) {
    final double titleFontSize = MediaQuery.of(context).size.height * 0.015;
    final double detailsFontSize = MediaQuery.of(context).size.height * 0.014;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Original Price\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: detailsFontSize),
                  ),
                  TextSpan(
                    text: 'Rs.${payment.pricingInfoDetails?.originalPrice}',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: detailsFontSize),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .3,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Final Price\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: detailsFontSize),
                  ),
                  TextSpan(
                    text: 'Rs.${payment.pricingInfoDetails?.finalPrice}',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: detailsFontSize),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        Row(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Discount Price\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleFontSize),
                  ),
                  TextSpan(
                    text: 'Rs.${payment.pricingInfoDetails?.discountAmount}',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: detailsFontSize),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .275,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'VAT\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: detailsFontSize),
                  ),
                  TextSpan(
                    text: 'Rs.${payment.pricingInfoDetails?.vatAmount}',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: detailsFontSize),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _sectionContainer(
      {required String title,
      required Widget child,
      required BuildContext context,
      required PaymentHistoryDetails payment}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.015, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
