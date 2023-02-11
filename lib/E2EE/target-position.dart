import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TargetPosition extends StatelessWidget {
  bool boolPosTopRight;
  bool boolPosTopLeft;
  bool boolPosBottomRight;
  bool boolPosBottomLeft;
  double top;
  double right;
  double bottom;
  double left;
  double height;
  double width;
  var visibility;
  String imagePath;
  BoxFit fit;
  int seconds;
  double appBarHeight;
  TargetPosition(
    this.boolPosTopRight,
    this.boolPosTopLeft,
    this.boolPosBottomRight,
    this.boolPosBottomLeft,
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.width,
    this.height,
    this.visibility,
    this.imagePath,
    this.fit,
    this.seconds,
    this.appBarHeight,
  );
  @override
  Widget build(BuildContext context) {
    return topLeftPositioned(context);
  }

  Widget topLeftPositioned(context) {
    return AnimatedPositioned(
      top: (MediaQuery.of(context).size.height - appBarHeight) * top,
      left: MediaQuery.of(context).size.width * left,
      width: MediaQuery.of(context).size.width * width,
      height: (MediaQuery.of(context).size.height - appBarHeight) * height,
      duration: Duration(seconds: seconds),
      child: Container(
        //color: Colors.blue,
        child: AnimatedOpacity(
          opacity: visibility == true ? 1.0 : 0.0,
          duration: Duration(seconds: seconds),
          child: Image.asset(
            imagePath,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
