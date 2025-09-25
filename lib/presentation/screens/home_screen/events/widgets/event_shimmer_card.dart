import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EventCardShimmer extends StatelessWidget {
  const EventCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
              border: Border.all(color: Colors.black12, width: 0.3),
            ),
            child: Row(
              children: [
                // Icon Placeholder
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    width: 24,
                    height: 24,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(width: 16.0),

                // Text Placeholders
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: 14,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Device Name
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: 10,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                ),

                // Time Placeholder
              ],
            ),
          ),

          // Left indicator bar shimmer
          Positioned(
            top: 10,
            bottom: 10,
            left: 0,
            child: Container(
              height: double.infinity,
              width: 4.5,
              decoration: BoxDecoration(
                color: Colors.grey[300]!,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventCardShimmerList extends StatelessWidget {
  const EventCardShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // Disable scrolling on inner ListView
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: 6,

      itemBuilder: (context, index) => const EventCardShimmer(),
    );
  }
}
