import 'package:flutter/material.dart';
import 'package:statisfuel/collections/collections.dart';

import 'default/app_line_chart.dart';
import 'default/chart_point.dart';

class DailyConsumptionChart extends StatelessWidget {
  final List<Consumption> points;

  const DailyConsumptionChart({
    super.key,
    required this.points,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return AppLineChart(
      title: 'Consommation journalière',
      points: points
          .map(
            (consumption) {
              if (consumption.litersPer100km == null) {
                return null;
              }
              return ChartPoint(
                x: consumption.date.millisecondsSinceEpoch.toDouble(),
                y: consumption.litersPer100km!,
                label: '${consumption.date.day}/${consumption.date.month}',
              );
            },
          )
          .whereType<ChartPoint>()
          .toList(),
      tooltipBuilder: (point) => 'Date: ${point.label}\n'
          'Value: ${point.y.toStringAsFixed(2)}',
    );
  }
}
