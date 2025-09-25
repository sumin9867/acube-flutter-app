import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/cubit/subscription_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_response.dart';
import 'package:intl/intl.dart';

class KhaltiPaymentVerification extends StatelessWidget {
  final String pidx;

  const KhaltiPaymentVerification({super.key, required this.pidx});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
        title: Text(
          context.locale.transaction,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocProvider(
        create: (context) => locator.get<SubscriptionCubit>()..kaltiPaymentVerification(pidx),
        child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              paymentResponce: (response) {
                context.read<MyDevicesCubit>().refreshDevices();

                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .03,
                      ),
                      margin: const EdgeInsets.all(16),
                      // padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green, size: 60),
                          const SizedBox(height: 10),
                          Text(
                            '${context.locale.nrs} ${response.paymentInfo?.amount ?? 0}',
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            '${context.locale.paid_for_device} ${response.updatedDevice?.name}',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            getFormattedDate(),
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 20),
                          _buildPaymentInfo(response, context),
                          const SizedBox(height: 20),
                          // const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .02,
                          bottom: MediaQuery.of(context).size.height * .03),
                      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                      // padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          _buildUpdatedDeviceInfo(response, context),
                          const SizedBox(height: 20),
                          // if (response.message != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              response.message ?? context.locale.payment_message_success,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16, color: Color.fromARGB(255, 2, 162, 8)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: MediaQuery.of(context).size.height * 0.056,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          context.locale.done,
                          style: const TextStyle(
                            fontSize: 18, // Increase font size
                            fontWeight: FontWeight.bold, // Make text bold
                            color: Colors.white, // Make text white
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
              error: (String message) => Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.error,
                        size: 40,
                        color: Colors.red, // Increase the size of the icon
                      ),
                      const SizedBox(height: 20),
                      Text(
                        context.locale.payment_failed,
                        style: const TextStyle(
                          fontSize: 24, // Increase font size
                          fontWeight: FontWeight.bold, // Make text bold
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        context.locale.payment_error_message(message),
                        style: const TextStyle(
                          color: Colors.black, // Set color to black
                          fontSize: 16, // Make the text a little bigger
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.height * 0.25,
                        child: ElevatedButton(
                          onPressed: () {
                            context.pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            context.locale.back_to_subscription,
                            style: const TextStyle(
                              fontSize: 18, // Increase font size
                              fontWeight: FontWeight.bold, // Make text bold
                              color: Colors.white, // Make text white
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            context.locale.have_question,
                            style: const TextStyle(
                              fontSize: 16, // Font size for "Have a question?"
                              color: Colors.black, // Color for "Have a question?"
                            ),
                          ),
                          const SizedBox(width: 8), // Add a space between the texts
                          Text(
                            context.locale.contact_support,
                            style: const TextStyle(
                              fontSize: 16, // Font size for "Contact Support"
                              color: Colors.blue, // Color for "Contact Support"
                              fontWeight: FontWeight.w600, // Make text bold
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPaymentInfo(PaymentResponse payment, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 242, 242, 242),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow(context.locale.payment_reference_id, payment.paymentInfo?.refId ?? ''),
          _buildRow(context.locale.payment_status, context.locale.success),
          const Divider(),
          _buildRow(context.locale.amount, '${context.locale.nrs} ${payment.paymentInfo?.amount ?? ""}'),
        ],
      ),
    );
  }

  Widget _buildRow(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            value.toString(), // Ensure value is converted to String
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdatedDeviceInfo(PaymentResponse payment, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 242, 242, 242),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Device ID: ${'N/A'}',
          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          // ),
          // Text(
          //   'Device Name: ${'N/A'}',
          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          // ),
          // Text(
          //   'Expiration Time: ${'N/A'}',
          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          // ),
          _buildRow(context.locale.device_id, payment.updatedDevice?.id ?? 0),

          _buildRow(context.locale.device_name, payment.updatedDevice?.name ?? ''),
          _buildRow(context.locale.expiration_time,
              DateFormat('dd MMM, yyyy').format(payment.updatedDevice?.expirationTime ?? DateTime.now())),
        ],
      ),
    );
  }

  String getFormattedDate() {
    final DateFormat formatter = DateFormat('dd MMM, yyyy hh:mm a');
    return formatter.format(DateTime.now());
  }
}
