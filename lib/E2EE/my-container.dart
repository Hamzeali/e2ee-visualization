// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TooltipShippingFeeBorder extends ShapeBorder {
  var a;
  var b;
  var c;
  var d;
  var e;
  var f;
  TooltipShippingFeeBorder(this.a, this.b, this.c, this.d, this.e, this.f);
  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.only(top: 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect =
        Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(20)))
      ..moveTo(rect.topCenter.dx + a, rect.topCenter.dy)
      ..relativeLineTo(10, -20)
      ..relativeLineTo(20, 20)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
