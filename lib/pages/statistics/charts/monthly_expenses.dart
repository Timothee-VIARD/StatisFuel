import 'package:flutter/material.dart';
import 'package:statisfuel/collections/collections.dart';
import 'package:statisfuel/utils/date.dart';

import 'default/app_line_chart.dart';
import 'default/chart_point.dart';

class MonthlyExpensesChart extends StatelessWidget {
  final List<Consumption> points;

  const MonthlyExpensesChart({
    super.key,
    required this.points,
  });

  List<ChartPoint> _monthlyPoints() {
    final expensesByMonth = <DateTime, double>{};

    for (final consumption in points) {
      final price = consumption.totalPrice;
      if (price == null || !price.isFinite) {
        continue;
      }

      final month = DateTime(consumption.date.year, consumption.date.month);
      expensesByMonth.update(
        month,
        (total) => total + price,
        ifAbsent: () => price,
      );
    }

    final months = expensesByMonth.keys.toList()..sort();

    return months.map((month) {
      final monthLabel = month.getMonthString();
      return ChartPoint(
        x: month.millisecondsSinceEpoch.toDouble(),
        y: expensesByMonth[month]!,
        label: monthLabel,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AppLineChart(
      title: 'Dépenses mensuelles',
      points: _monthlyPoints(),
      tooltipBuilder: (point) => 'Mois: ${point.label}\n'
          'Total: ${point.y.toStringAsFixed(2)}',
    );
  }
}
