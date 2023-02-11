import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyLine extends StatelessWidget {
  bool visibility;
  double x1;
  double y1;
  double x2;
  double y2;
  static double opacity = 0.0;
  int seconds;
  Color color;
  MyLine(
    this.visibility,
    this.x1,
    this.y1,
    this.x2,
    this.y2,
    this.seconds,
    this.color,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: AnimatedOpacity(
        opacity: visibility == true ? 1.0 : 0.0,
        duration: Duration(seconds: seconds),
        child: CustomPaint(
          foregroundPainter: LinePainter(
            x1,
            y1,
            x2,
            y2,
            color,
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  double a;
  double b;
  double c;
  double d;
  Color color;
  LinePainter(
    this.a,
    this.b,
    this.c,
    this.d,
    this.color,
  );
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 4;
    paint.color = color;
    //paint.color = Colors.green;
    canvas.drawLine(
      Offset(size.width * a, size.height * b),
      Offset(size.width * c, size.height * d),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // ignore: todo
    // TODO: implement shouldRepaint
    return false;
  }
}
