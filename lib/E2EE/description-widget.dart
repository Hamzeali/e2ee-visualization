// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class Description extends StatefulWidget {
  static final descBoxKey = GlobalKey();
  bool isSlide1DH;
  bool visible;
  bool descVisibility;
  String desc;
  double appBarHeight;
  int seconds;
  Description(this.visible, this.desc, this.descVisibility, this.seconds,
      this.appBarHeight, this.isSlide1DH,
      {Key? key})
      : super(key: key);

  @override
  State<Description> createState() => DescriptionState();
}

class DescriptionState extends State<Description> {
  var boxHeight = 0.26;
  var boxWidth = 0.3;
  var boxLeft = 0.35;

  bool isScaled = false;
  final scrollController = ScrollController();

  final time = const Duration(seconds: 2);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: widget.visible
          ? (MediaQuery.of(context).size.height - widget.appBarHeight) * 0.08
          : (MediaQuery.of(context).size.height - widget.appBarHeight) * -0.04,
      left: MediaQuery.of(context).size.width * 0.1,
      width: MediaQuery.of(context).size.width * 0.8,
      height: widget.visible
          ? (MediaQuery.of(context).size.height - widget.appBarHeight) *
              boxHeight
          : 0,
      duration: Duration(seconds: widget.seconds),
      child: InkWell(
        onLongPress: () {
          setState(
            () {
              if (!isScaled) {
                boxHeight = 0.7;
                boxWidth = 0.8;
                boxLeft = 0.1;
                isScaled = true;
              } else {
                boxHeight = 0.26;
                boxWidth = 0.3;
                boxLeft = 0.35;
                isScaled = false;
              }
            },
          );
        },
        child: AnimatedOpacity(
          opacity: widget.visible == true ? 0.8 : 0.0,
          duration: Duration(seconds: widget.seconds),
          child: MouseRegion(
            cursor:
                isScaled ? SystemMouseCursors.text : SystemMouseCursors.basic,
            child: widget.isSlide1DH
                ? Showcase(
                    key: Description.descBoxKey,
                    description: AppLocalizations.of(context)!.showCase8,
                    descTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    tooltipBackgroundColor: Colors.blue,
                    targetBorderRadius:
                        const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.indigo,
                            Colors.blue,
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Visibility(
                        visible: widget.visible,
                        child: RawScrollbar(
                            controller: scrollController,
                            thumbColor: Colors.black,
                            radius: const Radius.circular(20),
                            thickness: 5,
                            child: isScaled
                                ? SingleChildScrollView(
                                    controller: scrollController,
                                    child: SelectableText(
                                      widget.descVisibility ? widget.desc : '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                    ),
                                  )
                                : SingleChildScrollView(
                                    controller: scrollController,
                                    child: Text(
                                      widget.descVisibility ? widget.desc : '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                    ),
                                  )),
                      ),
                    ),
                  )
                : MouseRegion(
                    cursor: isScaled
                        ? SystemMouseCursors.text
                        : SystemMouseCursors.basic,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.indigo,
                            Colors.blue,
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Visibility(
                        visible: widget.visible,
                        child: RawScrollbar(
                          controller: scrollController,
                          thumbColor: Colors.black,
                          radius: const Radius.circular(20),
                          thickness: 5,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: isScaled
                                ? SelectableText(
                                    widget.descVisibility ? widget.desc : '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.02,
                                    ),
                                  )
                                : Text(
                                    widget.descVisibility ? widget.desc : '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.02,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
