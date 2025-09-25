import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/cubit/subscription_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/payment_hsitory_listtile.dart';
import 'package:gpspro/presentation/screens/home_screen/error_screen.dart';

class PayementHistory extends StatefulWidget {
  const PayementHistory({super.key});

  @override
  State<PayementHistory> createState() => _PayementHistoryState();
}

class _PayementHistoryState extends State<PayementHistory> {
  final int _pageSize = 10;
  int _currentPage = 1;
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _loadInitialData() {
    _currentPage = 1;
    context.read<SubscriptionCubit>().getPaymentHistory(_currentPage.toString(), _pageSize.toString());
  }

  void _scrollListener() {
    if (_shouldLoadMore()) {
      _loadMore();
    }
  }

  bool _shouldLoadMore() {
    return _scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && !_isLoadingMore;
  }

  Future<void> _loadMore() async {
    if (_isLoadingMore) return;

    setState(() => _isLoadingMore = true);

    _currentPage++;

    await context.read<SubscriptionCubit>().getPaymentHistory(_currentPage.toString(), _pageSize.toString());

    setState(() => _isLoadingMore = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          context.locale.paymentHistory,
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<SubscriptionCubit, SubscriptionState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            paymentHistory: (paymentHistory, hasMore) {
              if (paymentHistory.isEmpty) {
                return Center(child: Text(context.locale.noPaymentHistory));
              }

              return RefreshIndicator(
                onRefresh: () async {
                  _loadInitialData();
                },
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .12,
                  ),
                  controller: _scrollController,
                  itemCount: paymentHistory.length + (hasMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= paymentHistory.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PaymentHistoryListTile(paymentHistory: paymentHistory[index]),
                    );
                  },
                ),
              );
            },
            error: (message) => ErrorScreen(
              title: 'Error',
              message: message,
              onRetry: () {
                _loadInitialData();
              },
            ),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}
