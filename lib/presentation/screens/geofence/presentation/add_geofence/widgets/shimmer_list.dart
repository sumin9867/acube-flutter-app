import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  final int itemCount;
  final double firstshimmerheight;
  final double firstshimmerWidth;

  final double secondshimmerheight;

  final double secondshimmerwidth;
  final double gap;

  // Number of shimmer items to display

  const ShimmerList(
      {super.key,
      required this.itemCount,
      required this.firstshimmerheight,
      required this.firstshimmerWidth,
      required this.secondshimmerheight,

      required this.secondshimmerwidth, required this.gap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(itemCount, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: firstshimmerWidth,
                height: firstshimmerheight,
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
              ),
               SizedBox(
                height: gap,
              ),
              SizedBox(
                width: secondshimmerwidth,
                height: secondshimmerheight,
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
              ),
            ],
          ),
        );
      }),
    );
  }
}
