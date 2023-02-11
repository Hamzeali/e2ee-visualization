import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyServer extends StatelessWidget {
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
  int redServerSeconds;
  MyServer(
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
    this.redServerSeconds,
  );
  @override
  Widget build(BuildContext context) {
    if (boolPosTopRight)
      return topRightPositioned(context);
    else
      return topLeftPositioned(context);
  }

  Widget topRightPositioned(context) {
    return Positioned(
      top: (MediaQuery.of(context).size.height - appBarHeight) * top,
      right: MediaQuery.of(context).size.width * right,
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      child: Container(
        //color: Colors.blue,
        child: AnimatedOpacity(
          opacity: visibility == true ? 1.0 : 0.0,
          duration: Duration(seconds: redServerSeconds),
          child: Image.asset(
            imagePath,
            //  key: ValueKey<String>(imagePath),
            fit: fit,
          ),
        ),
      ),
    );
  }

  Widget topLeftPositioned(context) {
    return Positioned(
      top: (MediaQuery.of(context).size.height - appBarHeight) * top,
      left: MediaQuery.of(context).size.width * left,
      width: MediaQuery.of(context).size.width * width,
      height: (MediaQuery.of(context).size.height - appBarHeight) * height,
      child: Container(
        //color: Colors.blue,
        child: AnimatedOpacity(
          opacity: visibility == true ? 1.0 : 0.0,
          duration: Duration(seconds: redServerSeconds),
          child: Image.asset(
            imagePath,
            //key: ValueKey<String>(imagePath),
            fit: fit,
          ),
        ),
      ),
    );
  }
}
