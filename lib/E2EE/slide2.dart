import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/src/provider.dart';

import 'package:flutter/material.dart';

import '../Main/global.dart';
import '../Main/language-provider.dart';
import '../Painters/line-positioned-widget.dart';
import '../main.dart';
import 'description-widget.dart';
import 'home-page-E2EE.dart';
import 'positioned-widget.dart';
import 'redServerPosition.dart';
import 'target-position.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Slide2 extends StatefulWidget {
  const Slide2({super.key});

  @override
  Slide2State createState() => Slide2State();
}

bool switchOldValue = false;
bool scaleEnabledOldVal = false;
var sliderOldValue = 0;
var valOldValue = 0;
bool languageOldValue = true;
String locale = 'de';
final scrollController = ScrollController();
List isLastIndex = [false, true];
//-------------------------------

String dropdownValue = 'Deutsch';
var settingsVideoButton = 0.13;
var settingsStopButton = 0.13;
var advancedSettingsButton = 0.13;
var backToZero = 0;
var checkSettingsDuration = 0;
var isSettingsPressed = 0;
var settingsButtonDuration = 0;
var malloryOpacity = 0.0;
bool redLine = false;
var targetPosition = 0.8;
bool red = false;
bool redProblem = false;
List checkRedServerVisibility = [false, false, false, false];
List redServerVisibility = [true, true, true, true];
var redServerCounter = -1;
var messageLastIndexProblem = 0;
/*
 * priority between the both servers at the bottom
 */
List priority = [true, true];
int descIndex = -1;
int containerSeconds = 0;
int isPressedUp = 0;
int isPressedDown = 0;
int checkVisibility = 0;
List stepsVisibility = [true, false];
var timerProblem = 0;
/*
 * priority between (Alice and middle-left server)
 * and (middle-left server and left-bottom server)
 */
bool priority2 = true;
var seconds = Global.slider;
List messagePosition = [0.09, 0.01];
var indexVisibilitySlide2 = -1;
List contentVisibility = [];
List malloryAndTargetVisibility = [];
List lineColor = [];
bool messageVisibility = false;
double messageOpacity = 0.0;
bool dropButton = false;
bool desc = true;
bool descVisbility = desc;
String text = '';
bool videoButton = true;
bool settingButton = true;
var timerSeconds = 3;
Timer timerSlide2 = Timer(Duration(seconds: seconds), () {});
Timer lineTimerSlide2 = Timer(Duration(seconds: seconds), () {});
Timer serverTimerSlide2 = Timer(Duration(seconds: seconds), () {});
Timer serverVideoTimerSlide2 = Timer(Duration(seconds: seconds), () {});
Timer lineVideoTimerSlide2 = Timer(Duration(seconds: seconds), () {});
Timer lateTimerSlide2 = Timer(Duration(seconds: seconds), () {});
Timer videoTimerSlide2 =
    Timer.periodic(Duration(seconds: Global.slider), (videoTimer) {});
Timer pageNumberTimer = Timer(Duration(seconds: seconds), () {});
Timer finishTimer =
    Timer.periodic(Duration(seconds: Global.slider), (finish) {});
List serverPath = [
  'assets/server.jpeg',
  'assets/server.jpeg',
  'assets/server.jpeg',
  'assets/server.jpeg'
];
int redServerSeconds = 0;
TextEditingController pageController1 = TextEditingController()
  ..text = (indexVisibilitySlide2 + 1).toString();

class Slide2State extends State<Slide2> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 17; i++) {
      contentVisibility.add(true);
    }
    for (var i = 0; i < 10; i++) {
      malloryAndTargetVisibility.add(false);
    }
    for (var i = 0; i < 6; i++) {
      lineColor.add(Colors.black);
    }
  }

  @override
  // ignore: must_call_super
  void dispose() {
    timerSlide2.cancel();
    lineTimerSlide2.cancel();
    serverTimerSlide2.cancel();
    serverVideoTimerSlide2.cancel();
    lineVideoTimerSlide2.cancel();
    lateTimerSlide2.cancel();
    videoTimerSlide2.cancel();
    contentVisibility.clear();
    malloryAndTargetVisibility.clear();
    lineColor.clear();
    videoButton = true;
    pageController1 = TextEditingController()..text = (0).toString();
    redLine = false;
    videoButton = true;
    red = false;
    indexVisibilitySlide2 = -1;
    redServerCounter = -1;
    stepsVisibility = [true, false];
    for (var i = 0; i < 4; i++) {
      serverPath[i] = 'assets/server.jpeg';
    }
    for (var i = 0; i < checkRedServerVisibility.length; i++) {
      checkRedServerVisibility[i] = false;
    }
    for (var i = 0; i < redServerVisibility.length; i++) {
      redServerVisibility[i] = true;
    }
    malloryOpacity = 0.0;
    targetPosition = 0.8;
    seconds = 0;
    text = '';
    desc = true;
    descVisbility = desc;
    containerSeconds = 0;
    dropButton = false;
    redLine = false;
    settingsVideoButton = 0.13;
    settingsStopButton = 0.13;
    advancedSettingsButton = 0.13;
    settingButton = true;
    super.dispose();
  }

  String translate(BuildContext ctx, indexVisibility) {
    // switch (indexVisibility) {
    //   case 1:
    //     return AppLocalizations.of(ctx)!.slide1Item0;
    //   case 2:
    //     return AppLocalizations.of(ctx)!.slide1Item1;
    //   case 3:
    //     return AppLocalizations.of(ctx)!.slide1Item2;
    //   case 4:
    //     return AppLocalizations.of(ctx)!.slide1Item3;
    //   case 5:
    //     return AppLocalizations.of(ctx)!.slide1Item4;
    //   case 6:
    //     return AppLocalizations.of(ctx)!.slide1Item5;
    //   case 7:
    //     return AppLocalizations.of(ctx)!.slide1Item6;
    //   default:
    //     return "";
    // }
    return "";
  }

  Timer selectPageNumber(int a, int sec) {
    pageNumberTimer = Timer.periodic(
      Duration(seconds: sec),
      (Timer pageNumberTimer) {
        setState(
          () {
            seconds = 0;

            if (isLastIndex[0] == true) {
              openDialog(false);
              pageNumberTimer.cancel();
            }
            if (indexVisibilitySlide2 == a) {
              pageNumberTimer.cancel();
            } else {
              if ((!red || redServerVisibility[redServerCounter] == true) &&
                  redServerCounter != 3 &&
                  !redLine) {
                redLine = true;
                redServerCounter++;
                indexVisibilitySlide2++;
                if (indexVisibilitySlide2 >= 0) {
                  isLastIndex[1] = false;
                }
                stepsVisibility[0] = !stepsVisibility[0];
                stepsVisibility[1] = !stepsVisibility[1];
                malloryOpacity = 1.0;

                if (redServerCounter != indexVisibilitySlide2) {
                  redServerCounter--;
                }
                red = true;

                redServerVisibility[redServerCounter] = false;
                setState(
                  () {
                    malloryAndTargetVisibility[indexVisibilitySlide2] = true;
                  },
                );
                serverTimerSlide2 = Timer(
                  Duration(seconds: seconds),
                  () {
                    setState(
                      () {
                        serverPath[redServerCounter] = 'assets/red_server.jpeg';
                        redServerVisibility[redServerCounter] = true;
                        checkRedServerVisibility[redServerCounter] = true;
                        redLine = false;
                      },
                    );
                  },
                );
                if (redServerCounter == 3) {
                  redServerCounter = 3;
                }
                redServerSeconds = 1;
              } else if (indexVisibilitySlide2 >= 3 &&
                  indexVisibilitySlide2 < a &&
                  redServerVisibility[redServerCounter] == true &&
                  !redLine) {
                redLine = true;
                indexVisibilitySlide2++;
                if (indexVisibilitySlide2 == 9) {
                  isLastIndex[0] = true;
                }
                stepsVisibility[0] = !stepsVisibility[0];
                stepsVisibility[1] = !stepsVisibility[1];
                if (redServerCounter >= 4) redProblem = true;

                if (indexVisibilitySlide2 >= 4 && indexVisibilitySlide2 <= 8) {
                  if (indexVisibilitySlide2 == 6) {
                    contentVisibility[6] = false;

                    contentVisibility[9] = false;
                  } else if (indexVisibilitySlide2 == 7) {
                    contentVisibility[14] = false;
                  } else if (indexVisibilitySlide2 == 8) {
                    contentVisibility[2] = false;
                  } else if (indexVisibilitySlide2 == 4) {
                    contentVisibility[5] = false;
                  } else {
                    contentVisibility[12] = false;
                  }
                  lineTimerSlide2 = Timer(
                    Duration(seconds: seconds),
                    () {
                      setState(
                        () {
                          if (indexVisibilitySlide2 == 6) {
                            lineColor[2] = Colors.red;
                            lineColor[3] = Colors.red;
                            contentVisibility[6] = true;

                            contentVisibility[9] = true;
                          } else if (indexVisibilitySlide2 == 7) {
                            lineColor[4] = Colors.red;
                            contentVisibility[14] = true;
                          } else if (indexVisibilitySlide2 == 8) {
                            lineColor[5] = Colors.red;
                            contentVisibility[2] = true;
                          } else if (indexVisibilitySlide2 == 4) {
                            lineColor[0] = Colors.red;
                            contentVisibility[5] = true;
                          } else {
                            lineColor[1] = Colors.red;
                            contentVisibility[12] = true;
                          }
                          redLine = false;
                        },
                      );
                    },
                  );
                  // seconds = 1;
                }
                malloryAndTargetVisibility[indexVisibilitySlide2] = true;
                if (indexVisibilitySlide2 == 9) {
                  malloryOpacity = 0.3;
                  targetPosition = 0.07;
                  redLine = false;
                }
              }
            }

            if (indexVisibilitySlide2 ==
                malloryAndTargetVisibility.length - 1) {
              indexVisibilitySlide2 = malloryAndTargetVisibility.length - 1;
            }
          },
        );
      },
    );
    return pageNumberTimer;
  }

  Timer videoTimerProblem() {
    Timer videoTimerVariable = Timer.periodic(
      Duration(seconds: Global.slider),
      (Timer videoTimerVariable) {
        setState(
          () {
            if (isLastIndex[0] == true) {
              openDialog(false);
              videoTimerVariable.cancel();
            }

            if ((!red || redServerVisibility[redServerCounter] == true) &&
                redServerCounter != 3 &&
                !redLine) {
              redLine = true;

              redServerCounter++;
              indexVisibilitySlide2++;
              if (indexVisibilitySlide2 >= 0) {
                isLastIndex[1] = false;
              }
              stepsVisibility[0] = !stepsVisibility[0];
              stepsVisibility[1] = !stepsVisibility[1];
              malloryOpacity = 1.0;

              if (redServerCounter != indexVisibilitySlide2) {
                redServerCounter--;
              }
              red = true;

              redServerVisibility[redServerCounter] = false;
              setState(
                () {
                  malloryAndTargetVisibility[indexVisibilitySlide2] = true;
                },
              );
              serverTimerSlide2 = Timer(
                const Duration(seconds: 1),
                () {
                  setState(
                    () {
                      serverPath[redServerCounter] = 'assets/red_server.jpeg';
                      redServerVisibility[redServerCounter] = true;
                      checkRedServerVisibility[redServerCounter] = true;
                      redLine = false;
                    },
                  );
                },
              );
              if (redServerCounter == 3) {
                redServerCounter = 3;
              }
              redServerSeconds = 1;
            } else if (indexVisibilitySlide2 >= 3 &&
                indexVisibilitySlide2 < 9 &&
                redServerVisibility[redServerCounter] == true &&
                !redLine) {
              redLine = true;
              indexVisibilitySlide2++;
              if (indexVisibilitySlide2 == 9) {
                isLastIndex[0] = true;
              }
              stepsVisibility[0] = !stepsVisibility[0];
              stepsVisibility[1] = !stepsVisibility[1];
              if (redServerCounter >= 4) redProblem = true;

              if (indexVisibilitySlide2 >= 4 && indexVisibilitySlide2 <= 8) {
                if (indexVisibilitySlide2 == 6) {
                  contentVisibility[6] = false;

                  contentVisibility[9] = false;
                } else if (indexVisibilitySlide2 == 7) {
                  contentVisibility[14] = false;
                } else if (indexVisibilitySlide2 == 8) {
                  contentVisibility[2] = false;
                } else if (indexVisibilitySlide2 == 4) {
                  contentVisibility[5] = false;
                } else {
                  contentVisibility[12] = false;
                }
                lineTimerSlide2 = Timer(
                  Duration(seconds: 1),
                  () {
                    setState(
                      () {
                        if (indexVisibilitySlide2 == 6) {
                          lineColor[2] = Colors.red;
                          lineColor[3] = Colors.red;
                          contentVisibility[6] = true;

                          contentVisibility[9] = true;
                        } else if (indexVisibilitySlide2 == 7) {
                          lineColor[4] = Colors.red;
                          contentVisibility[14] = true;
                        } else if (indexVisibilitySlide2 == 8) {
                          lineColor[5] = Colors.red;
                          contentVisibility[2] = true;
                        } else if (indexVisibilitySlide2 == 4) {
                          lineColor[0] = Colors.red;
                          contentVisibility[5] = true;
                        } else {
                          lineColor[1] = Colors.red;
                          contentVisibility[12] = true;
                        }
                        redLine = false;
                      },
                    );
                  },
                );
                seconds = 1;
              }
              malloryAndTargetVisibility[indexVisibilitySlide2] = true;
              if (indexVisibilitySlide2 == 9) {
                malloryOpacity = 0.3;
                targetPosition = 0.07;
                redLine = false;
              }
            }
            if (indexVisibilitySlide2 ==
                malloryAndTargetVisibility.length - 1) {
              indexVisibilitySlide2 = malloryAndTargetVisibility.length - 1;
            }
          },
        );
      },
    );
    return videoTimerVariable;
  }

  bool stop = true;

  @override
  Widget build(BuildContext context) {
    if (isPressedDown == 2 && isPressedUp == 1 && desc) {
      containerSeconds = 2;
      isPressedUp = 0;
      isPressedDown = 0;
    } else if (isPressedDown == 2 && isPressedUp == 1 && !desc) {
      containerSeconds = 2;
      isPressedUp = 0;
      isPressedDown = 0;
    } else if (checkVisibility == 1) {
      containerSeconds = 0;
      checkVisibility = 0;
    }
    if (isSettingsPressed == 1) {
      settingsButtonDuration = 100;
      backToZero = 1;
      isSettingsPressed = 0;
    } else if (checkSettingsDuration == 1) {
      backToZero = 0;
      settingsButtonDuration = 0;
      checkSettingsDuration = 0;
    }
    return InteractiveViewer(
      panEnabled: true,
      scaleEnabled: Global.scaleEnabled,
      maxScale: 4,
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                HomePageE2EEState.returnAppBar[1],
            child: SafeArea(
              child: Container(
                child: Image.asset(
                  'assets/internet-cloud.jpeg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          // ALice-Image Position
          MyPositioned(
            false,
            true,
            false,
            false,
            0.01,
            0.0,
            0.0,
            0.01,
            0.08,
            0.14,
            true,
            'assets/alice.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // Bob-Image Position
          MyPositioned(
            true,
            false,
            false,
            false,
            0.01,
            0.01,
            0.0,
            0.0,
            0.08,
            0.14,
            true,
            'assets/bob.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // Middle left
          MyServer(
            false,
            true,
            false,
            false,
            0.23,
            0.0,
            0.0,
            0.2,
            0.08,
            0.12,
            redServerVisibility[0],
            serverPath[0],
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            redServerSeconds,
          ),

          // its-image
          MyPositioned(
            false,
            true,
            false,
            false,
            0.37,
            0.0,
            0.0,
            0.13,
            0.08,
            0.12,
            contentVisibility[1],
            'assets/its.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // google-image-1
          MyPositioned(
            true,
            false,
            false,
            false,
            0.32,
            0.28,
            0.0,
            0.0,
            0.08,
            0.12,
            contentVisibility[4],
            'assets/google.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // google-image-2
          MyPositioned(
            true,
            false,
            false,
            false,
            0.62,
            0.26,
            0.0,
            0.0,
            0.08,
            0.12,
            contentVisibility[10],
            'assets/google.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // Middle right
          MyServer(
            true,
            false,
            false,
            false,
            0.23,
            0.2,
            0.0,
            0.0,
            0.08,
            0.12,
            redServerVisibility[1],
            serverPath[1],
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            redServerSeconds,
          ),

          // Bottom left
          MyServer(
            false,
            true,
            false,
            false,
            0.6,
            0.0,
            0.0,
            0.28,
            0.08,
            0.12,
            redServerVisibility[3],
            serverPath[3],
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            redServerSeconds,
          ),

          // Bottom right
          MyServer(
            true,
            false,
            false,
            false,
            0.5,
            0.25,
            0.0,
            0.0,
            0.08,
            0.12,
            redServerVisibility[2],
            serverPath[2],
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            redServerSeconds,
          ),

          // Line between top-left and middle-left
          MyLine(
            contentVisibility[2],
            0.08,
            0.14,
            0.198,
            0.28,
            seconds,
            lineColor[5],
          ),

          // Line between middle-left and middle-right
          MyLine(
            contentVisibility[5],
            0.28,
            0.28,
            0.72,
            0.28,
            seconds,
            lineColor[0],
          ),

          // Line between top-right and middle right
          MyLine(
            contentVisibility[6],
            0.78,
            0.229,
            0.92,
            0.14,
            seconds,
            lineColor[2],
          ),

          // Line between top-right and bottom-right
          MyLine(
            contentVisibility[9],
            0.72,
            0.5,
            0.92,
            0.14,
            seconds,
            lineColor[3],
          ),

          // Line between down-left and bottom-right
          MyLine(
            contentVisibility[12],
            0.36,
            0.65,
            0.67,
            0.55,
            seconds,
            lineColor[1],
          ),

          // Line between middle-left and bottom-left
          MyLine(
            contentVisibility[14],
            0.25,
            0.34,
            0.31,
            0.6,
            seconds,
            lineColor[4],
          ),
          //Mallory1
          MyPositioned(
            false,
            true,
            false,
            false,
            0.155,
            0.0,
            0.0,
            0.25,
            0.08,
            0.12,
            malloryAndTargetVisibility[0],
            'assets/mallory.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            malloryOpacity,
          ),
          //Mallory2
          MyPositioned(
            true,
            false,
            false,
            false,
            0.155,
            0.27,
            0.0,
            0.0,
            0.08,
            0.12,
            malloryAndTargetVisibility[1],
            'assets/mallory.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            malloryOpacity,
          ),
          //Mallory3
          MyPositioned(
            true,
            false,
            false,
            false,
            0.48,
            0.32,
            0.0,
            0.0,
            0.08,
            0.12,
            malloryAndTargetVisibility[2],
            'assets/mallory.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            malloryOpacity,
          ),
          //Mallory4
          MyPositioned(
            false,
            true,
            false,
            false,
            0.58,
            0.0,
            0.0,
            0.21,
            0.08,
            0.12,
            malloryAndTargetVisibility[3],
            'assets/mallory.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            malloryOpacity,
          ),
          //Mallory5
          MyPositioned(
            true,
            false,
            false,
            false,
            0.2,
            0.45,
            0.0,
            0.0,
            0.08,
            0.12,
            malloryAndTargetVisibility[4],
            'assets/mallory.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            malloryOpacity,
          ),
          //Mallory6
          MyPositioned(
            false,
            true,
            false,
            false,
            0.54,
            0.0,
            0.0,
            0.45,
            0.08,
            0.12,
            malloryAndTargetVisibility[5],
            'assets/mallory.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            malloryOpacity,
          ),
          //Mallory7
          MyPositioned(
            true,
            false,
            false,
            false,
            0.095,
            0.1,
            0.0,
            0.0,
            0.08,
            0.12,
            malloryAndTargetVisibility[6],
            'assets/mallory.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            malloryOpacity,
          ),
          //Mallory8
          MyPositioned(
            false,
            true,
            false,
            false,
            0.35,
            0.0,
            0.0,
            0.27,
            0.08,
            0.12,
            malloryAndTargetVisibility[7],
            'assets/mallory.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            malloryOpacity,
          ),
          //Mallory9
          MyPositioned(
            false,
            true,
            false,
            false,
            0.09,
            0.0,
            0.0,
            0.125,
            0.08,
            0.12,
            malloryAndTargetVisibility[8],
            'assets/mallory.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),
          //target
          TargetPosition(
            false,
            true,
            false,
            false,
            targetPosition,
            0.0,
            0.0,
            0.1,
            0.13,
            0.18,
            malloryAndTargetVisibility[9],
            'assets/target.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
          ),

          // Steps1
          MyPositioned(
            true,
            false,
            false,
            false,
            0.88,
            0.23,
            0.0,
            0.0,
            0.04,
            0.1,
            stepsVisibility[0],
            'assets/steps1.jpeg',
            BoxFit.fill,
            0,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // Steps2
          MyPositioned(
            true,
            false,
            false,
            false,
            0.88,
            0.23,
            0.0,
            0.0,
            0.04,
            0.1,
            stepsVisibility[1],
            'assets/steps2.jpeg',
            BoxFit.fill,
            0,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // Alice-Posteingangsserver
          Positioned(
            top: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                0.23,
            left: MediaQuery.of(context).size.width * 0.09,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.04,
            child: AnimatedOpacity(
              opacity: contentVisibility[13] == true ? 1.0 : 0.0,
              duration: Duration(seconds: seconds == 0 ? 0 : 2),
              child: Container(
                padding: EdgeInsets.only(right: 4.0, left: 4.0),
                color: Colors.grey[300],
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      // context.watch<LanguageProvider>().selectedLanguage == true
                      //     ? DescList.posteingangsserver
                      //     : DescListEnglish.inboxServer,
                      'test',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Alice-Postausgangsserver
          Positioned(
            top: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                0.28,
            left: MediaQuery.of(context).size.width * 0.09,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.04,
            child: AnimatedOpacity(
              opacity: contentVisibility[0] == true ? 1.0 : 0.0,
              duration: Duration(seconds: seconds == 0 ? 0 : 2),
              child: Container(
                padding: EdgeInsets.only(right: 4.0, left: 4.0),
                color: Colors.grey[300],
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      // context.watch<LanguageProvider>().selectedLanguage == true
                      //     ? DescList.postausgangsserver
                      //     : DescListEnglish.outgoingMailServer,
                      'test',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Bob-Posteingangsserver
          Positioned(
            top: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                0.23,
            right: MediaQuery.of(context).size.width * 0.09,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.04,
            child: AnimatedOpacity(
              opacity: contentVisibility[3] == true ? 1.0 : 0.0,
              duration: Duration(seconds: seconds == 0 ? 0 : 2),
              child: Container(
                padding: EdgeInsets.only(right: 4.0, left: 4.0),
                color: Colors.grey[300],
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      // context.watch<LanguageProvider>().selectedLanguage == true
                      //     ? DescList.posteingangsserver
                      //     : DescListEnglish.inboxServer,
                      'test',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bottom-right-Posteingangsserver
          Positioned(
            bottom: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                0.35,
            right: MediaQuery.of(context).size.width * 0.15,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.04,
            child: AnimatedOpacity(
              opacity: contentVisibility[8] == true ? 1.0 : 0.0,
              duration: Duration(seconds: seconds == 0 ? 0 : 2),
              child: Container(
                padding: EdgeInsets.only(right: 4.0, left: 4.0),
                color: Colors.grey[300],
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      // context.watch<LanguageProvider>().selectedLanguage == true
                      //     ? DescList.posteingangsserver
                      //     : DescListEnglish.inboxServer,
                      'test',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Weiterleitungsserver
          Positioned(
            bottom: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                0.22,
            left: MediaQuery.of(context).size.width * 0.25,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.04,
            child: AnimatedOpacity(
              opacity: contentVisibility[11] == true ? 1.0 : 0.0,
              duration: Duration(seconds: seconds == 0 ? 0 : 2),
              child: Container(
                padding: EdgeInsets.only(right: 4.0, left: 4.0),
                color: Colors.grey[300],
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      // context.watch<LanguageProvider>().selectedLanguage == true
                      //     ? DescList.weiterleitungsserver
                      //     : DescListEnglish.forwardingServer,
                      'test',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Internet-Text
          Positioned(
            top: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                0.45,
            left: MediaQuery.of(context).size.width * 0.45,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.04,
            child: Container(
              padding: EdgeInsets.only(right: 4.0, left: 4.0),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'INTERNET',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // description
          Description(desc, text, descVisbility, containerSeconds,
              HomePageE2EEState.returnAppBar[1], false),

          // The Message
          AnimatedPositioned(
            top: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                messagePosition[1],
            right: MediaQuery.of(context).size.width * messagePosition[0],
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.1,
            duration: Duration(seconds: seconds),
            child: AnimatedOpacity(
              opacity: messageOpacity,
              duration: Duration(seconds: seconds == 0 ? 0 : 1),
              child: Image.asset('assets/message.jpeg'),
            ),
          ),

          // Right-Button
          Positioned(
            right: MediaQuery.of(context).size.width * 0.01,
            bottom: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            child: FloatingActionButton(
              backgroundColor: isLastIndex[0] ? Colors.grey : Colors.blue,
              heroTag: "right2",
              onPressed: () => setState(
                () {
                  videoTimerSlide2.cancel();
                  videoButton = true;

                  seconds = Global.slider;

                  if (isLastIndex[0] == true) {
                    openDialog(false);
                  }

                  if ((!red || redServerVisibility[redServerCounter] == true) &&
                      redServerCounter != 3 &&
                      !redLine) {
                    redLine = true;

                    redServerCounter++;
                    indexVisibilitySlide2++;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide2 + 1).toString();
                    if (indexVisibilitySlide2 >= 0) {
                      isLastIndex[1] = false;
                    }
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    malloryOpacity = 1.0;

                    if (redServerCounter != indexVisibilitySlide2) {
                      redServerCounter--;
                    }
                    red = true;

                    redServerVisibility[redServerCounter] = false;
                    setState(
                      () {
                        malloryAndTargetVisibility[indexVisibilitySlide2] =
                            true;
                      },
                    );
                    serverTimerSlide2 = Timer(
                      const Duration(seconds: 1),
                      () {
                        setState(
                          () {
                            serverPath[redServerCounter] =
                                'assets/red_server.jpeg';
                            redServerVisibility[redServerCounter] = true;
                            checkRedServerVisibility[redServerCounter] = true;
                            redLine = false;
                          },
                        );
                      },
                    );
                    if (redServerCounter == 3) {
                      redServerCounter = 3;
                    }
                    redServerSeconds = 1;
                  } else if (indexVisibilitySlide2 >= 3 &&
                      indexVisibilitySlide2 < 9 &&
                      redServerVisibility[redServerCounter] == true &&
                      !redLine) {
                    redLine = true;
                    indexVisibilitySlide2++;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide2 + 1).toString();
                    if (indexVisibilitySlide2 == 9) {
                      isLastIndex[0] = true;
                    }
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    if (redServerCounter >= 4) redProblem = true;

                    if (indexVisibilitySlide2 >= 4 &&
                        indexVisibilitySlide2 <= 8) {
                      if (indexVisibilitySlide2 == 6) {
                        contentVisibility[6] = false;

                        contentVisibility[9] = false;
                      } else if (indexVisibilitySlide2 == 7) {
                        contentVisibility[14] = false;
                      } else if (indexVisibilitySlide2 == 8) {
                        contentVisibility[2] = false;
                      } else if (indexVisibilitySlide2 == 4) {
                        contentVisibility[5] = false;
                      } else {
                        contentVisibility[12] = false;
                      }
                      lineTimerSlide2 = Timer(
                        Duration(seconds: 1),
                        () {
                          setState(
                            () {
                              if (indexVisibilitySlide2 == 6) {
                                lineColor[2] = Colors.red;
                                lineColor[3] = Colors.red;
                                contentVisibility[6] = true;

                                contentVisibility[9] = true;
                              } else if (indexVisibilitySlide2 == 7) {
                                lineColor[4] = Colors.red;
                                contentVisibility[14] = true;
                              } else if (indexVisibilitySlide2 == 8) {
                                lineColor[5] = Colors.red;
                                contentVisibility[2] = true;
                              } else if (indexVisibilitySlide2 == 4) {
                                lineColor[0] = Colors.red;
                                contentVisibility[5] = true;
                              } else {
                                lineColor[1] = Colors.red;
                                contentVisibility[12] = true;
                              }
                              redLine = false;
                            },
                          );
                        },
                      );
                      seconds = 1;
                    }
                    malloryAndTargetVisibility[indexVisibilitySlide2] = true;
                    if (indexVisibilitySlide2 == 9) {
                      malloryOpacity = 0.3;
                      targetPosition = 0.07;
                      redLine = false;
                    }
                  }
                  if (indexVisibilitySlide2 ==
                      malloryAndTargetVisibility.length - 1) {
                    indexVisibilitySlide2 =
                        malloryAndTargetVisibility.length - 1;
                  }
                },
              ),
              child: Icon(Icons.arrow_forward,
                  size: MediaQuery.of(context).size.height * 0.06),
            ),
          ),

          // Left-Button

          Positioned(
            left: MediaQuery.of(context).size.width * 0.01,
            bottom: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            child: FloatingActionButton(
              backgroundColor: isLastIndex[1] ? Colors.grey : Colors.blue,
              heroTag: "left2",
              onPressed: () => setState(
                () {
                  descVisbility = true;
                  videoTimerSlide2.cancel();

                  videoButton = true;
                  malloryOpacity = 1.0;
                  seconds = Global.slider;

                  if (isLastIndex[1] == true) {
                    openDialog(true);
                  }

                  if (redServerCounter < 0) {
                    redServerCounter = 0;
                  }
                  if ((red ||
                          malloryAndTargetVisibility[redServerCounter] ==
                                  true &&
                              malloryAndTargetVisibility[
                                      indexVisibilitySlide2 + 1] ==
                                  false) &&
                      redServerCounter <= 3 &&
                      !redProblem &&
                      indexVisibilitySlide2 <= 3) {
                    red = false;
                    redServerVisibility[redServerCounter] = false;
                    setState(
                      () {
                        malloryAndTargetVisibility[indexVisibilitySlide2] =
                            false;
                        indexVisibilitySlide2--;
                        pageController1 = TextEditingController()
                          ..text = (indexVisibilitySlide2 + 1).toString();
                        if (indexVisibilitySlide2 < 0) {
                          isLastIndex[1] = true;
                        }

                        stepsVisibility[0] = !stepsVisibility[0];
                        stepsVisibility[1] = !stepsVisibility[1];
                      },
                    );
                    serverTimerSlide2 = Timer(
                      Duration(seconds: 1),
                      () {
                        setState(
                          () {
                            serverPath[redServerCounter] = 'assets/server.jpeg';
                            redServerVisibility[redServerCounter] = true;
                            checkRedServerVisibility[redServerCounter] = false;
                            if (redServerCounter > 0) {
                              redServerCounter--;
                            }
                          },
                        );
                      },
                    );

                    redServerSeconds = 1;
                  } else if (indexVisibilitySlide2 > 3 &&
                      indexVisibilitySlide2 <= 9 &&
                      !redLine) {
                    redLine = true;
                    if (indexVisibilitySlide2 == 4) redProblem = false;
                    if (indexVisibilitySlide2 >= 4 &&
                        indexVisibilitySlide2 <= 8) {
                      stepsVisibility[0] = !stepsVisibility[0];
                      stepsVisibility[1] = !stepsVisibility[1];
                      if (indexVisibilitySlide2 == 6) {
                        contentVisibility[6] = false;

                        contentVisibility[9] = false;
                      } else if (indexVisibilitySlide2 == 7) {
                        contentVisibility[14] = false;
                      } else if (indexVisibilitySlide2 == 8) {
                        contentVisibility[2] = false;
                      } else if (indexVisibilitySlide2 == 4) {
                        contentVisibility[5] = false;
                      } else {
                        contentVisibility[12] = false;
                      }
                      lineTimerSlide2 = Timer(
                        Duration(seconds: 1),
                        () {
                          setState(
                            () {
                              if (indexVisibilitySlide2 == 6) {
                                lineColor[2] = Colors.black;
                                lineColor[3] = Colors.black;
                                contentVisibility[6] = true;

                                contentVisibility[9] = true;
                              } else if (indexVisibilitySlide2 == 7) {
                                lineColor[4] = Colors.black;
                                contentVisibility[14] = true;
                              } else if (indexVisibilitySlide2 == 8) {
                                lineColor[5] = Colors.black;
                                contentVisibility[2] = true;
                              } else if (indexVisibilitySlide2 == 4) {
                                lineColor[0] = Colors.black;
                                contentVisibility[5] = true;
                              } else {
                                lineColor[1] = Colors.black;
                                contentVisibility[12] = true;
                              }
                              redLine = false;
                              indexVisibilitySlide2--;
                              pageController1 = TextEditingController()
                                ..text = (indexVisibilitySlide2 + 1).toString();
                              if (indexVisibilitySlide2 < 9) {
                                isLastIndex[0] = false;
                              }
                              if (indexVisibilitySlide2 < 0) {
                                isLastIndex[1] = true;
                              }
                            },
                          );
                        },
                      );
                      seconds = 1;
                    }
                    malloryAndTargetVisibility[indexVisibilitySlide2] = false;
                    if (indexVisibilitySlide2 >= 9) {
                      redLine = false;
                      targetPosition = 0.8;
                      indexVisibilitySlide2--;
                      pageController1 = TextEditingController()
                        ..text = (indexVisibilitySlide2 + 1).toString();
                      if (indexVisibilitySlide2 < 9) {
                        isLastIndex[0] = false;
                      }
                      stepsVisibility[0] = !stepsVisibility[0];
                      stepsVisibility[1] = !stepsVisibility[1];
                    }
                  }
                  if (indexVisibilitySlide2 == 0) {
                    indexVisibilitySlide2 = 0;
                  }
                  // if (indexVisibilitySlide2 == -1) {
                  //   text = '';
                  // }

                  // if (indexVisibilitySlide2 < 9 && indexVisibilitySlide2 > -1) {
                  //   if (Languages.selectedLanguage)
                  //     text = DescList.slide2Desc[0];
                  //   else
                  //     text = DescListEnglish.slide2Desc[0];
                  // }
                  // if (indexVisibilitySlide2 >= 9) {
                  //   if (Languages.selectedLanguage)
                  //     text = DescList.slide2Desc[1];
                  //   else
                  //     text = DescListEnglish.slide2Desc[1];
                  // }
                },
              ),
              child: Icon(
                Icons.arrow_back,
                size: MediaQuery.of(context).size.height * 0.06,
              ),
            ),
          ),

          // Middle-Button
          Positioned(
            left: MediaQuery.of(context).size.width * 0.472,
            bottom: MediaQuery.of(context).size.height * 0.001,
            width: MediaQuery.of(context).size.width * 0.08,
            height: MediaQuery.of(context).size.height * 0.08,
            child: FloatingActionButton(
              heroTag: "middle2",
              onPressed: () => setState(
                () {
                  isPressedUp = 1;
                  isPressedDown = 2;

                  dropButton = !dropButton;
                  containerSeconds = 2;
                  desc = !desc;
                  timerSlide2 = Timer(
                    Duration(seconds: 2),
                    () {
                      setState(
                        () {
                          descVisbility = desc;
                          checkVisibility = 1;
                        },
                      );
                    },
                  );
                },
              ),
              child: dropButton
                  ? Icon(
                      Icons.arrow_drop_up,
                      size: MediaQuery.of(context).size.height * 0.04,
                    )
                  : Icon(
                      Icons.arrow_drop_down,
                      size: MediaQuery.of(context).size.height * 0.04,
                    ),
            ),
          ),

          // Advanced-Setting-Button
          AnimatedPositioned(
            right: MediaQuery.of(context).size.width * 0.01,
            bottom: MediaQuery.of(context).size.height * advancedSettingsButton,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            duration: Duration(
                milliseconds: settingsButtonDuration + 200 * backToZero),
            child: FloatingActionButton(
              heroTag: "settings9",
              backgroundColor: Colors.orange,
              onPressed: () {
                scaleEnabledOldVal = Global.scaleEnabled;
                switchOldValue = Global.switchValue;
                locale = Global.locale;
                sliderOldValue = Global.slider;
                valOldValue = Global.val;
                languageOldValue = Global.selectedLanguage;
                showDialog<String>(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    scrollable: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    title: Text(
                      AppLocalizations.of(context)!.settings,
                      textAlign: TextAlign.center,
                    ),
                    content: SizedBox(
                      height: 300.0,
                      width: 500.0,
                      child: RawScrollbar(
                        controller: scrollController,
                        thumbColor: Colors.blue,
                        radius: const Radius.circular(20),
                        thickness: 5,
                        child: ListView(
                          controller: scrollController,
                          shrinkWrap: true,
                          children: <Widget>[
                            const SizedBox(height: 20),
                            _buildRow(
                              AppLocalizations.of(context)!.animationSpeed,
                              StatefulBuilder(
                                builder: (BuildContext context,
                                    void Function(void Function()) setState) {
                                  return Slider(
                                    value: Global.val.toDouble(),
                                    min: 1.0,
                                    max: 3.0,
                                    divisions: 2,
                                    label: Global.val.toString(),
                                    onChanged: (double newValue) {
                                      setState(
                                        () {
                                          Global.val = newValue.round();

                                          if (Global.val == 1) {
                                            Global.slider = Global.val + 2;
                                            if (!videoButton) {
                                              videoTimerSlide2.cancel();
                                              videoTimerSlide2 =
                                                  videoTimerProblem();
                                            }
                                          } else if (Global.val == 3) {
                                            Global.slider = Global.val - 2;
                                            if (!videoButton) {
                                              videoTimerSlide2.cancel();
                                              videoTimerSlide2 =
                                                  videoTimerProblem();
                                            }
                                          } else {
                                            Global.slider = Global.val;
                                            if (!videoButton) {
                                              videoTimerSlide2.cancel();
                                              videoTimerSlide2 =
                                                  videoTimerProblem();
                                            }
                                          }
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                              false,
                            ),
                            _buildRow(
                              AppLocalizations.of(context)!.appLanguage,
                              Container(
                                margin: const EdgeInsets.only(left: 18.0),
                                child: StatefulBuilder(
                                  builder: (BuildContext context,
                                      void Function(void Function()) setState) {
                                    return DropdownButton<String>(
                                      value: Global.selectedLanguage == true
                                          ? Global.languages[0]
                                          : Global.languages[1],
                                      elevation: 16,
                                      style: const TextStyle(
                                        color: Colors.blue,
                                      ),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.blueAccent,
                                      ),
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            dropdownValue = newValue!;
                                            if (dropdownValue ==
                                                Global.languages[1]) {
                                              Global.selectedLanguage = false;
                                              E2EEVis.of(context)!.setLocale(
                                                  const Locale.fromSubtags(
                                                      languageCode: 'en'));
                                              Global.locale = 'en';
                                              // setLanguage('en');
                                            } else {
                                              Global.selectedLanguage = true;
                                              E2EEVis.of(context)!.setLocale(
                                                  const Locale.fromSubtags(
                                                      languageCode: 'de'));
                                              Global.locale = 'de';
                                              // setLanguage('de');
                                            }
                                          },
                                        );
                                        Provider.of<LanguageProvider>(context,
                                                listen: false)
                                            .changeLanguage(1);
                                      },
                                      items: Global.languages
                                          .map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        },
                                      ).toList(),
                                    );
                                  },
                                ),
                              ),
                              false,
                            ),
                            _buildRow(
                              AppLocalizations.of(context)!.zoomEnable,
                              StatefulBuilder(
                                builder: (BuildContext context,
                                    void Function(void Function()) setState) {
                                  return CupertinoSwitch(
                                    value: Global.switchValue,
                                    onChanged: (value) {
                                      setState(() {
                                        Global.switchValue = value;
                                        Global.scaleEnabled =
                                            Global.switchValue;
                                      });
                                    },
                                  );
                                },
                              ),
                              true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                          setState(() {});
                        },
                        child: const Text('OK'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'Cancel');
                          setState(() {
                            Global.switchValue = switchOldValue;
                            Global.scaleEnabled = scaleEnabledOldVal;
                            Global.slider = sliderOldValue;
                            Global.val = valOldValue;

                            Global.selectedLanguage = languageOldValue;
                            Global.locale = locale;
                            E2EEVis.of(context)!.setLocale(
                                Locale.fromSubtags(languageCode: locale));
                          });
                        },
                        child: Text(AppLocalizations.of(context)!.cancel),
                      ),
                    ],
                  ),
                );
              },
              child: Icon(Icons.settings,
                  size: MediaQuery.of(context).size.height * 0.045),
            ),
          ),

          // Video-Stop-Button

          AnimatedPositioned(
            right: MediaQuery.of(context).size.width * 0.01,
            bottom: MediaQuery.of(context).size.height * settingsStopButton,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            duration: Duration(
                milliseconds: settingsButtonDuration + 100 * backToZero),
            child: FloatingActionButton(
              heroTag: "stop2",
              backgroundColor: Colors.red,
              onPressed: () => setState(
                () {
                  videoButton = true;
                  red = false;
                  videoTimerSlide2.cancel();

                  serverTimerSlide2.cancel();
                  lateTimerSlide2.cancel();
                  lineVideoTimerSlide2.cancel();
                  serverVideoTimerSlide2.cancel();
                  indexVisibilitySlide2 = -1;
                  pageController1 = TextEditingController()
                    ..text = (0).toString();
                  redServerCounter = -1;
                  for (var i = 0; i < malloryAndTargetVisibility.length; i++) {
                    malloryAndTargetVisibility[i] = false;
                  }
                  for (var i = 0; i < 4; i++) {
                    serverPath[i] = 'assets/server.jpeg';
                  }
                  for (var i = 0; i < checkRedServerVisibility.length; i++) {
                    checkRedServerVisibility[i] = false;
                  }
                  for (var i = 0; i < redServerVisibility.length; i++) {
                    redServerVisibility[i] = true;
                  }
                  for (var i = 0; i < contentVisibility.length; i++) {
                    if (i == 5 ||
                        i == 12 ||
                        i == 6 ||
                        i == 9 ||
                        i == 14 ||
                        i == 2) contentVisibility[i] = true;
                  }
                  contentVisibility[2] = false;
                  contentVisibility[5] = false;
                  contentVisibility[6] = false;
                  contentVisibility[9] = false;
                  contentVisibility[12] = false;
                  contentVisibility[14] = false;

                  for (var i = 0; i < lineColor.length; i++) {
                    lineColor[i] = Colors.black;
                  }

                  lineTimerSlide2 = Timer(
                    const Duration(milliseconds: 50),
                    () {
                      setState(
                        () {
                          contentVisibility[2] = true;
                          contentVisibility[5] = true;
                          contentVisibility[6] = true;
                          contentVisibility[9] = true;
                          contentVisibility[12] = true;
                          contentVisibility[14] = true;
                          lineTimerSlide2.cancel();
                        },
                      );
                    },
                  );

                  malloryOpacity = 0.0;
                  targetPosition = 0.8;
                  seconds = 0;
                  text = '';
                  desc = true;
                  descVisbility = desc;
                  containerSeconds = 0;
                  dropButton = false;
                  stepsVisibility = [true, false];
                  redLine = false;
                },
              ),
              child: Icon(Icons.restart_alt_rounded,
                  size: MediaQuery.of(context).size.height * 0.06),
            ),
          ),

          // Video-Play-Button

          AnimatedPositioned(
            right: MediaQuery.of(context).size.width * 0.01,
            bottom: MediaQuery.of(context).size.height * settingsVideoButton,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            duration: Duration(milliseconds: settingsButtonDuration),
            child: FloatingActionButton(
              heroTag: "play2",
              backgroundColor: Colors.green,
              onPressed: () => setState(
                () {
                  desc = true;
                  descVisbility = desc;
                  dropButton = false;
                  videoButton = !videoButton;
                  timerSlide2 = Timer(
                    Duration(seconds: 2),
                    () {
                      setState(
                        () {
                          checkVisibility = 1;
                        },
                      );
                    },
                  );
                  if (!videoButton) {
                    videoTimerSlide2 = videoTimerProblem();
                  } else {
                    videoTimerSlide2.cancel();
                  }
                },
              ),
              child: videoButton
                  ? Icon(Icons.play_arrow,
                      size: MediaQuery.of(context).size.height * 0.06)
                  : Icon(Icons.pause,
                      size: MediaQuery.of(context).size.height * 0.06),
            ),
          ),

          // More-Button

          Positioned(
            right: MediaQuery.of(context).size.width * 0.01,
            bottom: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            child: FloatingActionButton(
              heroTag: "more2",
              onPressed: () => setState(
                () {
                  isSettingsPressed = 1;
                  settingButton = !settingButton;
                  if (!settingButton) {
                    settingsStopButton = 0.35;
                    settingsVideoButton = 0.24;
                    advancedSettingsButton = 0.46;
                    settingsButtonDuration = 100;
                    backToZero = 1;
                  } else {
                    settingsStopButton = 0.13;
                    settingsVideoButton = 0.13;
                    advancedSettingsButton = 0.13;
                    settingsButtonDuration = 100;
                    backToZero = 1;
                  }

                  timerSlide2 = Timer(
                    Duration(milliseconds: 100),
                    () {
                      setState(
                        () {
                          checkSettingsDuration = 1;
                        },
                      );
                    },
                  );
                },
              ),
              child: settingButton
                  ? Icon(Icons.more_vert,
                      size: MediaQuery.of(context).size.height * 0.05)
                  : Icon(Icons.close,
                      size: MediaQuery.of(context).size.height * 0.05),
            ),
          ),

          // Page-number
          Positioned(
            bottom: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                0.03,
            right: MediaQuery.of(context).size.width * 0.12,
            width: MediaQuery.of(context).size.width * 0.1,
            height: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                0.1,
            child: Center(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: TextButton(
                  onPressed: () {
                    numberPageDialog();
                  },
                  child: Text(
                    '${indexVisibilitySlide2 + 1} / 10',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String text, Widget widget, bool isSwitch) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Text(text)),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(
                      vertical: 8, horizontal: isSwitch ? 35 : 20),
                  child: widget,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  numberPageDialog() {
    showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        scrollable: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                AppLocalizations.of(context)!.goToStep,
                textAlign: TextAlign.left,
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: pageController1,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(2),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        content: const SizedBox(
          height: 5.0,
          width: 300.0,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setState(() {
                if (videoButton == false) {
                  videoTimerSlide2.cancel();
                }
                videoButton = true;
                seconds = Global.slider;
              });
              if ((int.parse(pageController1.text) > 10) ||
                  (int.parse(pageController1.text) < 0)) {
                showFlushBarMessage(
                    const Icon(
                      Icons.error,
                      size: 32,
                      color: Colors.white,
                    ),
                    AppLocalizations.of(context)!.errorTitel,
                    AppLocalizations.of(context)!.outOfRangeError,
                    Colors.red);
              } else {
                stepNumber();
                Navigator.pop(context, 'Ok');
              }
            },
            child: const Text('Ok'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                if (indexVisibilitySlide2 != -1) {
                  pageController1 = TextEditingController()
                    ..text = (indexVisibilitySlide2).toString();
                } else {
                  pageController1 = TextEditingController()
                    ..text = (0).toString();
                }
              });
              Navigator.pop(context, 'No');
            },
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
        ],
      ),
    );
  }

  void showFlushBarMessage(
      Icon icon, String title, String message, Color backgroundColor) {
    Flushbar(
      icon: icon,
      title: title,
      titleSize: 20,
      message: message,
      duration: const Duration(seconds: 2),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      maxWidth: MediaQuery.of(context).size.width * 0.4,
      backgroundColor: backgroundColor,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  stepNumber() {
    bool isFinished = false;
    setState(() {
      finishTimer = Timer.periodic(const Duration(milliseconds: 1), (finish) {
        setState(() {
          if (!isFinished) {
            stopFunction();
          }

          if (isFinished) {
            selectPageNumber(int.parse(pageController1.text) - 1, 0);
          }
          if (isFinished) {
            finishTimer.cancel();
          }
          isFinished = true;
        });
      });
    });
  }

  stopFunction() {
    setState(() {
      videoButton = true;
      red = false;
      videoTimerSlide2.cancel();

      serverTimerSlide2.cancel();
      lateTimerSlide2.cancel();
      lineVideoTimerSlide2.cancel();
      serverVideoTimerSlide2.cancel();
      indexVisibilitySlide2 = -1;
      redServerCounter = -1;
      isLastIndex = [false, true];
      for (var i = 0; i < malloryAndTargetVisibility.length; i++) {
        malloryAndTargetVisibility[i] = false;
      }
      for (var i = 0; i < 4; i++) {
        serverPath[i] = 'assets/server.jpeg';
      }
      for (var i = 0; i < checkRedServerVisibility.length; i++) {
        checkRedServerVisibility[i] = false;
      }
      for (var i = 0; i < redServerVisibility.length; i++) {
        redServerVisibility[i] = true;
      }
      for (var i = 0; i < contentVisibility.length; i++) {
        if (i == 5 || i == 12 || i == 6 || i == 9 || i == 14 || i == 2) {
          contentVisibility[i] = true;
        }
      }
      contentVisibility[2] = false;
      contentVisibility[5] = false;
      contentVisibility[6] = false;
      contentVisibility[9] = false;
      contentVisibility[12] = false;
      contentVisibility[14] = false;

      for (var i = 0; i < lineColor.length; i++) {
        lineColor[i] = Colors.black;
      }

      lineTimerSlide2 = Timer(
        const Duration(milliseconds: 50),
        () {
          setState(
            () {
              contentVisibility[2] = true;
              contentVisibility[5] = true;
              contentVisibility[6] = true;
              contentVisibility[9] = true;
              contentVisibility[12] = true;
              contentVisibility[14] = true;
              lineTimerSlide2.cancel();
            },
          );
        },
      );

      malloryOpacity = 0.0;
      targetPosition = 0.8;
      seconds = 0;
      text = '';
      desc = true;
      descVisbility = desc;
      containerSeconds = 0;
      dropButton = false;
      stepsVisibility = [true, false];
      redLine = false;
    });
  }

  openDialog(bool isLeft) {
    showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        scrollable: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.error,
                size: 30,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 15,
              child: Text(
                isLeft
                    ? AppLocalizations.of(context)!.lastLeft2
                    : AppLocalizations.of(context)!.lastRight,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        content: const SizedBox(
          height: 5.0,
          width: 300.0,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Yes');
              HomePageE2EEState.controller.animateTo(isLeft ? 1 : 3);
            },
            child: Text(AppLocalizations.of(context)!.yes),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'No');
              setState(() {});
            },
            child: Text(AppLocalizations.of(context)!.no),
          ),
        ],
      ),
    );
  }
}
