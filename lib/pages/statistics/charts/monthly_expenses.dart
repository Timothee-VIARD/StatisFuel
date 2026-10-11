import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:statisfuel/collections/collections.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/utils/date.dart';
import 'package:statisfuel/utils/num.dart';

import 'default/app_line_chart.dart';
import 'default/chart_point.dart';

class MonthlyExpensesChart extends StatelessWidget {
  final List<Consumption> points;

  const MonthlyExpensesChart({
    super.key,
    required this.points,
  });

  List<ChartPoint> _monthlyPoints(BuildContext context) {
    final expensesByMonth = <int, double>{};

    for (final consumption in points) {
      final price = consumption.totalPrice;
      if (price == null || !price.isFinite) {
        continue;
      }

      final monthKey =
          consumption.date.year * 12 + (consumption.date.month - 1);
      expensesByMonth.update(
        monthKey,
        (total) => total + price,
        ifAbsent: () => price,
      );
    }

    if (expensesByMonth.isEmpty) {
      return [];
    }

    final firstMonth = expensesByMonth.keys.reduce((a, b) => a < b ? a : b);
    final lastMonth = expensesByMonth.keys.reduce((a, b) => a > b ? a : b);
    for (var monthKey = firstMonth; monthKey <= lastMonth; monthKey++) {
      expensesByMonth.putIfAbsent(monthKey, () => 0);
    }

    final months = expensesByMonth.keys.toList()..sort();

    return months.map((monthKey) {
      final month = DateTime(
        monthKey ~/ 12,
        monthKey % 12 + 1,
      );
      final monthLabel = month.getMonthString(context);
      return ChartPoint(
        x: monthKey.toDouble(),
        y: expensesByMonth[monthKey]!,
        label: monthLabel,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AppLineChart(
      title: 'Dépenses mensuelles',
      points: _monthlyPoints(context),
      tooltipBuilder: (point) => '${point.label}\n'
          'Total: ${point.y.toFormattedString(
        format: NumberFormat.currency(
          symbol: t.unit.price,
          locale: 'fr_FR',
          decimalDigits: 2,
        ),
      )}',
      minY: 0,
      yInterval: 100,
      xLabelBuilder: (value) {
        final monthKey = value.round();
        final month = DateTime(
          monthKey ~/ 12,
          monthKey % 12 + 1,
        );
        return month.getMonthShortString(context);
      },
      yLabelBuilder: (value) => value.toFormattedString(
        format: NumberFormat.compactCurrency(
          symbol: t.unit.price,
          locale: 'fr_FR',
          decimalDigits: 0,
        ),
      ),
    );
  }
}
