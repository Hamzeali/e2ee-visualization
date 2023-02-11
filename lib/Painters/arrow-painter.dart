// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:math' as math;

class ArrowPainter extends CustomPainter {
  double p1x;
  double p1y;
  double p2x;
  double p2y;
  double arrowSizeVal;
  Color arrowColor;
  ArrowPainter(
      {required this.p1x,
      required this.p1y,
      required this.p2x,
      required this.p2y,
      required this.arrowSizeVal,
      required this.arrowColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = arrowColor
      ..strokeWidth = 2;

    final p1 = Offset(p1x, p1y);
    final p2 = Offset(p2x, p2y);

    canvas.drawLine(p1, p2, paint);

    final dX = p2.dx - p1.dx;
    final dY = p2.dy - p1.dy;
    final angle = math.atan2(dY, dX);

    final arrowSize = arrowSizeVal;
    const arrowAngle = 25 * math.pi / 180;

    final path = Path();

    path.moveTo(p2.dx - arrowSize * math.cos(angle - arrowAngle),
        p2.dy - arrowSize * math.sin(angle - arrowAngle));
    path.lineTo(p2.dx, p2.dy);
    path.lineTo(p2.dx - arrowSize * math.cos(angle + arrowAngle),
        p2.dy - arrowSize * math.sin(angle + arrowAngle));
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
