import 'package:flutter/material.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/info/widgets/metric_card.dart';

class MetricRow extends StatelessWidget {
  final MetricCard first;
  final MetricCard second;

  const MetricRow({
    super.key,
    required this.first,
    required this.second,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: first),
        const SizedBox(width: 12),
        Expanded(child: second),
      ],
    );
  }
}
