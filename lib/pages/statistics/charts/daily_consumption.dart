import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:statisfuel/collections/collections.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/utils/date.dart';
import 'package:statisfuel/utils/num.dart';

import 'default/app_line_chart.dart';
import 'default/chart_point.dart';

class DailyConsumptionChart extends StatelessWidget {
  final List<Consumption> data;

  const DailyConsumptionChart({
    super.key,
    required this.data,
  });

  double _monthAxisValue(DateTime date) {
    final monthIndex = date.year * 12 + date.month - 1;
    final daysInMonth = DateTime(date.year, date.month + 1, 0).day;
    final dayProgress = (date.day - 1) / daysInMonth;
    return monthIndex + dayProgress;
  }

  @override
  Widget build(BuildContext context) {
    final points = data
        .map(
          (consumption) {
            if (consumption.litersPer100km == null) {
              return null;
            }
            return ChartPoint(
              x: _monthAxisValue(consumption.date),
              y: consumption.litersPer100km!,
              label: consumption.date
                  .toFormattedString(format: t.global.date.formatReadable),
            );
          },
        )
        .whereType<ChartPoint>()
        .toList();

    return AppLineChart(
      title: 'Consommation journalière (L/100km)',
      points: points,
      xLabelBuilder: (value) {
        if (value != value.floorToDouble()) {
          return '';
        }

        final monthIndex = value.floor();
        final date = DateTime(
          monthIndex ~/ 12,
          monthIndex % 12 + 1,
        );
        return date.getMonthShortString(context);
      },
      yLabelBuilder: (value) =>
          value.toFormattedString(format: NumberFormat('#,##0.0', 'fr_FR')),
      tooltipBuilder: (point) => '${point.label}\n'
          '${point.y.toFormattedString(format: NumberFormat('#,##0.00', 'fr_FR'), unit: t.unit.litersPer100km)}',
      yInterval: 0.5,
      minX: points.reversed.firstOrNull?.x,
      maxX: points.reversed.lastOrNull?.x,
      xInterval: 1.0,
    );
  }
}
