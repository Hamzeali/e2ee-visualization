// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  Color color;
  PaintingStyle paintingStyle;
  CirclePainter(this.color, this.paintingStyle);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = paintingStyle;
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
