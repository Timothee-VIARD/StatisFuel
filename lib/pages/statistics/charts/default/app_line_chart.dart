import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:statisfuel/global/widget.dart';

import 'chart_point.dart';

class AppLineChart extends StatefulWidget {
  final String title;
  final List<ChartPoint> points;
  final Color? color;
  final String Function(ChartPoint point)? tooltipBuilder;

  const AppLineChart({
    super.key,
    required this.title,
    required this.points,
    this.color,
    this.tooltipBuilder,
  });

  @override
  State<AppLineChart> createState() => _AppLineChartState();
}

class _AppLineChartState extends State<AppLineChart> {
  late final TransformationController _transformationController;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  ({List<FlSpot> spots, double minY, double maxY}) _prepareData() {
    var minY = double.infinity;
    var maxY = double.negativeInfinity;

    final spots = widget.points
        .where((point) => point.x.isFinite && point.y.isFinite)
        .map((point) {
      minY = min(minY, point.y);
      maxY = max(maxY, point.y);
      return FlSpot(point.x, point.y);
    }).toList();

    if (spots.isEmpty || !minY.isFinite || !maxY.isFinite) {
      return (spots: spots, minY: 0, maxY: 1);
    }

    minY = minY.floorToDouble();
    maxY = maxY.ceilToDouble();

    if (minY == maxY) {
      minY -= 1;
      maxY += 1;
    }

    return (spots: spots, minY: minY, maxY: maxY);
  }

  ChartPoint? _pointForX(double value) {
    for (final point in widget.points) {
      if (point.x == value) {
        return point;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final preparedData = _prepareData();

    return TVCard(
      title: (_) => widget.title,
      content: AspectRatio(
        aspectRatio: 2,
        child: LineChart(
          LineChartData(
            minY: preparedData.minY,
            maxY: preparedData.maxY,
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: preparedData.spots,
                isCurved: true,
                barWidth: 4,
                preventCurveOverShooting: true,
                color: widget.color ?? Theme.of(context).primaryColor,
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      widget.color?.withAlpha(100) ??
                          Theme.of(context).primaryColor.withAlpha(100),
                      widget.color?.withAlpha(50) ??
                          Theme.of(context).primaryColor.withAlpha(50),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 38,
                  getTitlesWidget: (value, meta) {
                    return SideTitleWidget(
                      meta: meta,
                      child: Text(
                        _pointForX(value)?.label ?? '',
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
              ),
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 46),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 46),
              ),
            ),
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipItems: (touchedSpots) {
                  return touchedSpots
                      .map((spot) {
                        if (!spot.x.isFinite || !spot.y.isFinite) {
                          return null;
                        }

                        final point = _pointForX(spot.x);
                        final text = widget.tooltipBuilder?.call(point!) ??
                            '${point?.label ?? ''}\nValue: ${spot.y.toStringAsFixed(2)}';
                        return LineTooltipItem(
                          text,
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      })
                      .whereType<LineTooltipItem>()
                      .toList();
                },
                getTooltipColor: (_) =>
                    widget.color ?? Theme.of(context).primaryColor,
              ),
            ),
          ),
          transformationConfig: FlTransformationConfig(
            scaleAxis: FlScaleAxis.horizontal,
            maxScale: 10,
            transformationController: _transformationController,
          ),
        ),
      ),
    );
  }
}
