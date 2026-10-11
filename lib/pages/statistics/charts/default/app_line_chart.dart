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
  final String Function(double value)? xLabelBuilder;
  final String Function(double value)? yLabelBuilder;
  final double? minX;
  final double? maxX;
  final double? xInterval;
  final double? minY;
  final double? maxY;
  final double? yInterval;

  const AppLineChart({
    super.key,
    required this.title,
    required this.points,
    this.color,
    this.tooltipBuilder,
    this.xLabelBuilder,
    this.yLabelBuilder,
    this.minX,
    this.maxX,
    this.xInterval,
    this.minY,
    this.maxY,
    this.yInterval,
  })  : assert(xInterval == null || xInterval > 0),
        assert(yInterval == null || yInterval > 0),
        assert(minX == null || maxX == null || minX < maxX),
        assert(minY == null || maxY == null || minY < maxY);

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

  ({List<FlSpot> spots, double minX, double maxX, double minY, double maxY})
      _prepareData() {
    var minY = double.infinity;
    var maxY = double.negativeInfinity;

    final spots = widget.points
        .where((point) => point.x.isFinite && point.y.isFinite)
        .map((point) {
      minY = min(minY, point.y);
      maxY = max(maxY, point.y);
      return FlSpot(point.x, point.y);
    }).toList()
      ..sort((first, second) => first.x.compareTo(second.x));

    if (spots.isEmpty || !minY.isFinite || !maxY.isFinite) {
      return (
        spots: spots,
        minX: widget.minX ?? 0,
        maxX: widget.maxX ?? 1,
        minY: widget.minY ?? 0,
        maxY: widget.maxY ?? 1,
      );
    }

    if (widget.minY != null) {
      minY = widget.minY!;
    } else if (widget.yInterval != null) {
      minY = _previousIntervalBound(minY, widget.yInterval!);
    } else {
      minY = minY.floorToDouble();
    }
    if (widget.maxY != null) {
      maxY = widget.maxY!;
    } else if (widget.yInterval != null) {
      maxY = _nextIntervalBound(maxY, minY, widget.yInterval!);
    } else {
      maxY = maxY.ceilToDouble();
    }

    if (maxY <= minY) {
      if (widget.maxY != null) {
        minY = maxY - 1;
      } else if (widget.minY == null) {
        minY -= 1;
        maxY += 1;
      } else {
        maxY = minY + 1;
      }
    }

    var minX = spots.first.x;
    var maxX = spots.last.x;
    if (widget.minX != null) {
      minX = widget.minX!;
    }
    if (widget.maxX != null) {
      maxX = widget.maxX!;
    } else if (widget.xInterval != null) {
      maxX = _nextIntervalBound(maxX, minX, widget.xInterval!);
    }
    if (maxX <= minX) {
      if (widget.maxX != null) {
        minX = maxX - 1;
      } else if (widget.minX == null) {
        minX -= 1;
        maxX += 1;
      } else {
        maxX = minX + 1;
      }
    }

    return (spots: spots, minX: minX, maxX: maxX, minY: minY, maxY: maxY);
  }

  double _previousIntervalBound(double value, double interval) {
    final steps = max(1, (value / interval).floor());
    return steps * interval;
  }

  double _nextIntervalBound(double value, double minimum, double interval) {
    final steps = max(1, ((value - minimum) / interval).ceil());
    return minimum + steps * interval;
  }

  ChartPoint? _pointForX(double value) {
    for (final point in widget.points) {
      if (point.x == value) {
        return point;
      }
    }
    return null;
  }

  double _niceInterval(double minValue, double maxValue) {
    final rawInterval = (maxValue - minValue) / 4;
    if (!rawInterval.isFinite || rawInterval <= 0) {
      return 1;
    }

    final magnitude = pow(10, (log(rawInterval) / ln10).floor()).toDouble();
    final normalized = rawInterval / magnitude;
    final multiplier = normalized <= 1
        ? 1
        : normalized <= 2
            ? 2
            : normalized <= 5
                ? 5
                : 10;
    return multiplier * magnitude;
  }

  double _xInterval(List<FlSpot> spots) {
    if (spots.length < 2) {
      return spots.length == 1 ? 2 : 1;
    }

    final range = spots.last.x - spots.first.x;
    if (!range.isFinite || range <= 0) {
      return 1;
    }

    final interval = range / min(spots.length - 1, 4);
    return interval.isFinite && interval > 0 ? interval : 1;
  }

  double _labelsReservedSize(
    BuildContext context,
    Iterable<String> labels, {
    required bool horizontal,
  }) {
    final textStyle = const TextStyle(fontSize: 10);
    var reservedSize = 0.0;

    for (final label in labels.where((label) => label.isNotEmpty)) {
      final painter = TextPainter(
        text: TextSpan(text: label, style: textStyle),
        textDirection: Directionality.of(context),
        maxLines: 1,
      )..layout();
      reservedSize = max(
        reservedSize,
        horizontal ? painter.height : painter.width,
      );
    }

    return max(22, reservedSize + 10);
  }

  Iterable<String> _xLabels(
    double minX,
    double maxX,
    double interval,
  ) sync* {
    for (var value = minX; value <= maxX; value += interval) {
      yield widget.xLabelBuilder?.call(value) ?? _pointForX(value)?.label ?? '';
    }
  }

  Iterable<String> _yLabels(
    double minY,
    double maxY,
    double interval,
  ) sync* {
    for (var value = minY; value <= maxY; value += interval) {
      yield widget.yLabelBuilder?.call(value) ?? value.toStringAsFixed(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final preparedData = _prepareData();
    final xInterval = widget.xInterval ?? _xInterval(preparedData.spots);
    final yInterval =
        widget.yInterval ?? _niceInterval(preparedData.minY, preparedData.maxY);
    final xReservedSize = _labelsReservedSize(
      context,
      _xLabels(preparedData.minX, preparedData.maxX, xInterval),
      horizontal: true,
    );
    final yReservedSize = _labelsReservedSize(
      context,
      _yLabels(preparedData.minY, preparedData.maxY, yInterval),
      horizontal: false,
    );

    return TVCard(
      title: (_) => widget.title,
      content: AspectRatio(
        aspectRatio: 2,
        child: LineChart(
          LineChartData(
            minX: preparedData.minX,
            maxX: preparedData.maxX,
            minY: preparedData.minY,
            maxY: preparedData.maxY,
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: preparedData.spots,
                isStrokeJoinRound: true,
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
                  interval: xInterval,
                  reservedSize: xReservedSize,
                  getTitlesWidget: (value, meta) {
                    final label = widget.xLabelBuilder?.call(value);

                    return SideTitleWidget(
                      meta: meta,
                      fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
                      child: Text(
                        label ?? '',
                        maxLines: 1,
                        style: const TextStyle(fontSize: 10),
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: yInterval,
                  reservedSize: yReservedSize,
                  getTitlesWidget: (value, meta) {
                    final label = widget.yLabelBuilder?.call(value);
                    return SideTitleWidget(
                      meta: meta,
                      fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
                      child: Text(
                        label ?? value.toStringAsFixed(0),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 10),
                      ),
                    );
                  },
                ),
              ),
              rightTitles: const AxisTitles(),
            ),
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                fitInsideHorizontally: true,
                fitInsideVertically: true,
                maxContentWidth: 140,
                tooltipMargin: 8,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots
                      .map((spot) {
                        if (!spot.x.isFinite || !spot.y.isFinite) {
                          return null;
                        }

                        final point = _pointForX(spot.x);
                        final text = point == null
                            ? 'Value: ${spot.y.toStringAsFixed(2)}'
                            : widget.tooltipBuilder?.call(point) ??
                                '${point.label}\nValue: ${spot.y.toStringAsFixed(2)}';
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
