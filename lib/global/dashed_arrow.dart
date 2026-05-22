
import 'package:flutter/material.dart';
import 'package:statisfuel/theme/app_config.dart';

class DashedArrow extends StatelessWidget {
  final double height;
  final Color? color;
  final double dashWidth;
  final double dashGap;
  final double strokeWidth;
  final double arrowHeadSize;

  const DashedArrow({
    super.key,
    this.height = 24.0,
    this.color,
    this.dashWidth = 1.5,
    this.dashGap = 6.0,
    this.strokeWidth = 2.0,
    this.arrowHeadSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final arrowColor = color ?? Theme.of(context).colorScheme.onSurface;
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: AppConfig.spacing),
      child: CustomPaint(
        painter: _DashedArrowPainter(
          color: arrowColor,
          dashWidth: dashWidth,
          dashGap: dashGap,
          strokeWidth: strokeWidth,
          arrowHeadSize: arrowHeadSize,
        ),
      ),
    );
  }
}

class _DashedArrowPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashGap;
  final double strokeWidth;
  final double arrowHeadSize;

  _DashedArrowPainter({
    required this.color,
    required this.dashWidth,
    required this.dashGap,
    required this.strokeWidth,
    required this.arrowHeadSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final y = size.height / 2;
    final endX = size.width;
    final lineEndX = endX - arrowHeadSize + 2.0;

    double x = 0.0;
    while (x < lineEndX) {
      final x2 = (x + dashWidth) < lineEndX ? (x + dashWidth) : lineEndX;
      canvas.drawLine(Offset(x, y), Offset(x2, y), paint);
      x += dashWidth + dashGap;
    }

    // Draw arrow head as two lines.
    canvas.drawLine(
      Offset(lineEndX + arrowHeadSize - 2.0, y),
      Offset(lineEndX, y - arrowHeadSize / 2),
      paint,
    );
    canvas.drawLine(
      Offset(lineEndX + arrowHeadSize - 2.0, y),
      Offset(lineEndX, y + arrowHeadSize / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}