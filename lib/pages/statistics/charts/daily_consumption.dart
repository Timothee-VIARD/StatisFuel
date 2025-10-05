import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:statisfuel/i18n/strings.g.dart';

class DailyConsumptionChart extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> data;

  const DailyConsumptionChart({super.key, required this.data, required this.title});

  @override
  State<DailyConsumptionChart> createState() => _DailyConsumptionChartState();
}

class _DailyConsumptionChartState extends State<DailyConsumptionChart> {
  late TransformationController _transformationController;

  late double maxY;
  late double minY;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
  }

  List<FlSpot> _convertDataToSpots(List<Map<String, dynamic>> data) {
    maxY = double.negativeInfinity;
    minY = double.infinity;

    return data.map((entry) {
      final date = entry['date'] as DateTime;
      final value = entry['value'] as double;

      final roundedValue = value.roundToDouble();
      if (value > maxY) {
        if (roundedValue > value) {
          maxY = roundedValue;
        } else {
          maxY = roundedValue + 0.5;
        }
      }
      if (value < minY) {
        if (roundedValue < value) {
          minY = roundedValue;
        } else {
          minY = value;
        }
      }

      return FlSpot(date.millisecondsSinceEpoch.toDouble(), double.parse(value.toStringAsFixed(2)));
    }).toList();
  }

  String _formatDate(double value) {
    final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
    return '${date.day}/${date.month}';
  }

  @override
  Widget build(BuildContext context) {
    final spots = _convertDataToSpots(widget.data);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'MPLUSRounded1c',
              ),
            ),
            MenuAnchor(
              builder: (BuildContext context, MenuController controller, Widget? child) {
                return IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    controller.open();
                  },
                );
              },
              menuChildren: [
                MenuItemButton(
                  onPressed: () {
                    // context.read<HistoryCubit>().exportToCsv();
                  },
                  child: Text(t.global.exportToCSV),
                ),
                MenuItemButton(
                  onPressed: () {
                    // context.read<HistoryCubit>().importFromCsv();
                  },
                  child: Text(t.global.importFromCSV),
                ),
                MenuItemButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext contextDialog) {
                        return AlertDialog(
                          title: Text(t.global.confirm),
                          content: Text(t.consumption.warningDeleteAll),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(contextDialog).pop();
                              },
                              child: Text(t.global.forms.cancel),
                            ),
                            ElevatedButton(
                              style: TextButton.styleFrom(backgroundColor: Colors.red),
                              onPressed: () {
                                // context.read<HistoryCubit>().deleteAllConsumptions();
                                Navigator.of(contextDialog).pop();
                              },
                              child: Text(
                                t.global.delete,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(t.global.deleteAll),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        AspectRatio(
          aspectRatio: 2,
          child: LineChart(
            LineChartData(
              minY: minY,
              maxY: maxY,
              borderData: FlBorderData(show: true),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  barWidth: 4,
                  preventCurveOverShooting: true,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withAlpha(100),
                        Colors.blue.withAlpha(0),
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
                        child: Transform.rotate(
                          angle: -45 * pi / 180,
                          child: Text(
                            _formatDate(value),
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 30),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 30),
                ),
              ),
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      final date = DateTime.fromMillisecondsSinceEpoch(spot.x.toInt());
                      return LineTooltipItem(
                        'Date: ${date.day}/${date.month}/${date.year}\nValue: ${spot.y.toStringAsFixed(2)}',
                        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      );
                    }).toList();
                  },
                  getTooltipColor: (LineBarSpot barSpot) => Colors.blue,
                ),
              ),
            ),
            transformationConfig: FlTransformationConfig(
              scaleAxis: FlScaleAxis.horizontal,
              maxScale: 10.0,
              transformationController: _transformationController,
            ),
          ),
        ),
      ],
    );
  }
}
