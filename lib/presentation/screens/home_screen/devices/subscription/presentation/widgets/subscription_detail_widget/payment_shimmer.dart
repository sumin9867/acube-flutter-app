import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PaymentHistoryShimmer extends StatelessWidget {
  final int itemCount;

  const PaymentHistoryShimmer({this.itemCount = 5, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, __) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Container(width: 55, height: 55, color: Colors.grey),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: 100, height: 14, color: Colors.grey),
                        const SizedBox(height: 8),
                        Container(width: 60, height: 12, color: Colors.grey),
                      ],
                    ),
                  ),
                  Container(width: 60, height: 24, color: Colors.grey, margin: const EdgeInsets.only(right: 12)),
                ],
              ),
            ),
          ),
        ),
        childCount: itemCount,
      ),
    );
  }
}
