// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyPositioned extends StatelessWidget {
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
  // ignore: prefer_typing_uninitialized_variables
  var visibility;
  String imagePath;
  BoxFit fit;
  int seconds;
  double appBarHeight;
  // ignore: prefer_typing_uninitialized_variables
  var opacity;
  MyPositioned(
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
      this.opacity,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (boolPosTopRight) {
      return topRightPositioned(context);
    } else if (boolPosTopLeft) {
      return topLeftPositioned(context);
    } else if (boolPosBottomRight) {
      return bottomRightPositioned(context);
    } else {
      return bottomLeftPositioned(context);
    }
  }

  Widget topRightPositioned(context) {
    return Positioned(
      top: (MediaQuery.of(context).size.height - appBarHeight) * top,
      right: MediaQuery.of(context).size.width * right,
      width: MediaQuery.of(context).size.width * width,
      height: (MediaQuery.of(context).size.height - appBarHeight) * height,
      child: AnimatedOpacity(
        opacity: visibility == true ? opacity : 0.0,
        duration: Duration(seconds: seconds),
        child: Image.asset(
          imagePath,
          fit: fit,
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
      child: AnimatedOpacity(
        opacity: visibility == true ? opacity : 0.0,
        duration: Duration(seconds: seconds),
        child: Image.asset(
          imagePath,
          fit: fit,
        ),
      ),
    );
  }

  Widget bottomRightPositioned(context) {
    return Positioned(
      bottom: (MediaQuery.of(context).size.height - appBarHeight) * bottom,
      right: MediaQuery.of(context).size.width * right,
      width: MediaQuery.of(context).size.width * width,
      height: (MediaQuery.of(context).size.height - appBarHeight) * height,
      child: AnimatedOpacity(
        opacity: visibility == true ? opacity : 0.0,
        duration: Duration(seconds: seconds),
        child: Image.asset(
          imagePath,
          fit: fit,
        ),
      ),
    );
  }

  Widget bottomLeftPositioned(context) {
    return Positioned(
      bottom: (MediaQuery.of(context).size.height - appBarHeight) * bottom,
      left: MediaQuery.of(context).size.width * left,
      width: MediaQuery.of(context).size.width * width,
      height: (MediaQuery.of(context).size.height - appBarHeight) * height,
      child: AnimatedOpacity(
        opacity: visibility == true ? opacity : 0.0,
        duration: Duration(seconds: seconds),
        child: Image.asset(
          imagePath,
          fit: fit,
        ),
      ),
    );
  }
}
