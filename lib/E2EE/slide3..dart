import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Main/global.dart';
import '../Main/language-provider.dart';
import '../Painters/line-positioned-widget.dart';
import '../main.dart';
import 'description-widget.dart';
import 'home-page-E2EE.dart';
import 'positioned-widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Slide3 extends StatefulWidget {
  const Slide3({super.key});

  @override
  Slide3State createState() => Slide3State();
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
bool greenLine = false;
var malloryOpacity = 1.0;
var whiteMessageOpacity = 0.0;
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

bool redLine = false;
var timerProblem = 0;
/*
 * priority between (Alice and middle-left server)
 * and (middle-left server and left-bottom server)
 */
bool priority2 = true;
var seconds = Global.slider;
List messagePosition = [0.09, 0.01];
List whiteMessagePosition = [0.875, 0.01];
var indexVisibilitySlide3 = -1;
bool messageVisibility = false;
List contentVisibility = [];
List malloryAndTargetVisibility = [];
List cipherVisibility = [false, false];
List lineColor = [];
double messageOpacity = 0.0;
bool dropButton = false;
bool desc = true;
bool descVisbility = desc;
String text = '';
bool videoButton = true;
bool settingButton = true;
var timerSeconds = 3;
Timer leftCipherTimer = Timer(Duration(seconds: 1), () {});
Timer rightCipherTimer = Timer(Duration(seconds: 1), () {});
Timer lineTimer = Timer(Duration(seconds: 1), () {});
Timer leftCipherVideoTimer = Timer(Duration(seconds: 1), () {});
Timer rightCipherVideoTimer = Timer(Duration(seconds: 1), () {});
Timer lineVideoTimer = Timer(Duration(seconds: 1), () {});
late Timer timerSlide3 = Timer(Duration(seconds: 1), () {});
late Timer videoTimerSlide3 =
    Timer.periodic(Duration(seconds: Global.slider), (videoTimer) {});
List serverPath = [
  'assets/red_server.jpeg',
  'assets/red_server.jpeg',
  'assets/red_server.jpeg',
  'assets/red_server.jpeg'
];
List cipherPath = [
  'assets/cipher-left.jpeg',
  'assets/cipher-right.jpeg',
];
//---------------
TextEditingController pageController1 = TextEditingController()
  ..text = (indexVisibilitySlide3 + 1).toString();
Timer pageNumberTimer = Timer(Duration(seconds: seconds), () {});
Timer finishTimer =
    Timer.periodic(Duration(seconds: Global.slider), (finish) {});

class Slide3State extends State<Slide3> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 17; i++) {
      contentVisibility.add(true);
    }
    for (var i = 0; i < 9; i++) {
      malloryAndTargetVisibility.add(true);
    }
    for (var i = 0; i < 6; i++) {
      lineColor.add(Colors.red);
    }
  }

  @override
  // ignore: must_call_super
  void dispose() {
    videoTimerSlide3.cancel();
    timerSlide3.cancel();
    leftCipherTimer.cancel();
    rightCipherTimer.cancel();
    lineTimer.cancel();
    leftCipherVideoTimer.cancel();
    rightCipherVideoTimer.cancel();
    lineVideoTimer.cancel();
    pageNumberTimer.cancel();
    finishTimer.cancel();
    videoButton = true;

    contentVisibility.clear();
    malloryAndTargetVisibility.clear();
    lineColor.clear();

    pageController1 = TextEditingController()..text = (0).toString();

    isLastIndex = [false, true];

    cipherVisibility[0] = false;
    cipherVisibility[1] = false;
    whiteMessagePosition[0] = 0.875;
    whiteMessagePosition[1] = 0.01;
    whiteMessageOpacity = 0.0;
    messagePosition[0] = 0.09;
    messagePosition[1] = 0.01;
    indexVisibilitySlide3 = -1;
    messageOpacity = 0.0;
    seconds = 0;
    text = '';
    desc = true;
    descVisbility = desc;
    containerSeconds = 0;
    descIndex = -1;
    dropButton = false;
    stepsVisibility = [true, false];
    timerProblem = 0;
    messageLastIndexProblem = 0;
    settingsVideoButton = 0.13;
    settingsStopButton = 0.13;
    advancedSettingsButton = 0.13;
    settingButton = true;
    super.dispose();
  }

  String translate(BuildContext ctx, indexVisibility) {
    switch (indexVisibility) {
      case 0:
        return AppLocalizations.of(ctx)!.slide3Item0;
      case 1:
        return AppLocalizations.of(ctx)!.slide3Item1;
      case 2:
        return AppLocalizations.of(ctx)!.slide3Item2;
      case 3:
        return AppLocalizations.of(ctx)!.slide3Item3;
      case 4:
        return AppLocalizations.of(ctx)!.slide3Item4;
      case 5:
        return AppLocalizations.of(ctx)!.slide3Item5;
      case 6:
        return AppLocalizations.of(ctx)!.slide3Item6;
      case 7:
        return AppLocalizations.of(ctx)!.slide3Item7;
      case 8:
        return AppLocalizations.of(ctx)!.slide3Item8;
      case 9:
        return AppLocalizations.of(ctx)!.slide3Item9;
      case 10:
        return AppLocalizations.of(ctx)!.slide3Item10;
      case 11:
        return AppLocalizations.of(ctx)!.slide3Item11;
      default:
        return "";
    }
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
            if (indexVisibilitySlide3 == a) {
              pageNumberTimer.cancel();
            } else {
              if (!redLine &&
                  indexVisibilitySlide3 < a &&
                  contentVisibility[0] == true) {
                indexVisibilitySlide3++;
                if (indexVisibilitySlide3 >= 0) {
                  isLastIndex[1] = false;
                }
                pageController1 = TextEditingController()
                  ..text = (indexVisibilitySlide3 + 1).toString();
                if (indexVisibilitySlide3 == 11) {
                  isLastIndex[0] = true;
                }
                stepsVisibility[0] = !stepsVisibility[0];
                stepsVisibility[1] = !stepsVisibility[1];
                if (indexVisibilitySlide3 == 0) redLine = true;
              }

              if (indexVisibilitySlide3 == 0 && contentVisibility[0] == true) {
                contentVisibility[indexVisibilitySlide3] = false;
                lineTimer = Timer(
                  Duration(seconds: 1),
                  () {
                    setState(
                      () {
                        lineColor[0] = Colors.green;
                        print(indexVisibilitySlide3);
                        contentVisibility[indexVisibilitySlide3] = true;
                        redLine = false;
                        greenLine = true;
                      },
                    );
                  },
                );
                seconds = 1;
              }
              if (indexVisibilitySlide3 == 1) {
                whiteMessageOpacity = 1.0;
              } else if (indexVisibilitySlide3 == 2) {
                leftCipherTimer = Timer(
                  Duration(seconds: 1),
                  () {
                    setState(
                      () {
                        cipherVisibility[0] = true;
                      },
                    );
                  },
                );

                whiteMessagePosition[0] = 0.74;
                whiteMessagePosition[1] = 0.15;
              } else if (indexVisibilitySlide3 == 3) {
                whiteMessagePosition[0] = 0.23;
                whiteMessagePosition[1] = 0.15;
              } else if (indexVisibilitySlide3 == 4) {
                rightCipherTimer = Timer(
                  Duration(seconds: 1),
                  () {
                    setState(
                      () {
                        cipherVisibility[1] = true;
                      },
                    );
                  },
                );
                whiteMessagePosition[0] = 0.09;
                whiteMessagePosition[1] = 0.01;
              } else if (indexVisibilitySlide3 == 5) {
                whiteMessageOpacity = 0.0;
                messageOpacity = 1.0;
              } else if (indexVisibilitySlide3 == 6) {
                messagePosition[0] = 0.28;
                messagePosition[1] = 0.41;
              } else if (indexVisibilitySlide3 == 7) {
                messagePosition[0] = 0.64;
                messagePosition[1] = 0.52;
              } else if (indexVisibilitySlide3 == 8) {
                messagePosition[0] = 0.74;
                messagePosition[1] = 0.15;
              } else if (indexVisibilitySlide3 == 9) {
                messagePosition[0] = 0.875;
                messagePosition[1] = 0.01;
              } else if (indexVisibilitySlide3 == 10) {
                messageOpacity = 0.0;
              } else if (indexVisibilitySlide3 == 11) {
                malloryAndTargetVisibility[6] = false;
                malloryAndTargetVisibility[8] = false;
                cipherVisibility[0] = false;
                cipherVisibility[1] = false;
              }
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
            seconds = Global.slider;
            if (isLastIndex[0] == true) {
              openDialog(false);
              videoTimerVariable.cancel();
            }
            if (!redLine &&
                indexVisibilitySlide3 < 11 &&
                contentVisibility[0] == true) {
              indexVisibilitySlide3++;
              if (indexVisibilitySlide3 >= 0) {
                isLastIndex[1] = false;
              }
              pageController1 = TextEditingController()
                ..text = (indexVisibilitySlide3 + 1).toString();
              if (indexVisibilitySlide3 == 11) {
                isLastIndex[0] = true;
              }
              stepsVisibility[0] = !stepsVisibility[0];
              stepsVisibility[1] = !stepsVisibility[1];
              if (indexVisibilitySlide3 == 0) redLine = true;
            }

            if (indexVisibilitySlide3 == 0 && contentVisibility[0] == true) {
              contentVisibility[indexVisibilitySlide3] = false;
              lineTimer = Timer(
                Duration(seconds: 1),
                () {
                  setState(
                    () {
                      lineColor[0] = Colors.green;
                      print(indexVisibilitySlide3);
                      contentVisibility[indexVisibilitySlide3] = true;
                      redLine = false;
                      greenLine = true;
                    },
                  );
                },
              );
              seconds = 1;
            }
            if (indexVisibilitySlide3 == 1) {
              whiteMessageOpacity = 1.0;
            } else if (indexVisibilitySlide3 == 2) {
              leftCipherTimer = Timer(
                Duration(seconds: 1),
                () {
                  setState(
                    () {
                      cipherVisibility[0] = true;
                    },
                  );
                },
              );

              whiteMessagePosition[0] = 0.74;
              whiteMessagePosition[1] = 0.15;
            } else if (indexVisibilitySlide3 == 3) {
              whiteMessagePosition[0] = 0.23;
              whiteMessagePosition[1] = 0.15;
            } else if (indexVisibilitySlide3 == 4) {
              rightCipherTimer = Timer(
                Duration(seconds: 1),
                () {
                  setState(
                    () {
                      cipherVisibility[1] = true;
                    },
                  );
                },
              );
              whiteMessagePosition[0] = 0.09;
              whiteMessagePosition[1] = 0.01;
            } else if (indexVisibilitySlide3 == 5) {
              whiteMessageOpacity = 0.0;
              messageOpacity = 1.0;
            } else if (indexVisibilitySlide3 == 6) {
              messagePosition[0] = 0.28;
              messagePosition[1] = 0.41;
            } else if (indexVisibilitySlide3 == 7) {
              messagePosition[0] = 0.64;
              messagePosition[1] = 0.52;
            } else if (indexVisibilitySlide3 == 8) {
              messagePosition[0] = 0.74;
              messagePosition[1] = 0.15;
            } else if (indexVisibilitySlide3 == 9) {
              messagePosition[0] = 0.875;
              messagePosition[1] = 0.01;
            } else if (indexVisibilitySlide3 == 10) {
              messageOpacity = 0.0;
            } else if (indexVisibilitySlide3 == 11) {
              malloryAndTargetVisibility[6] = false;
              malloryAndTargetVisibility[8] = false;
              cipherVisibility[0] = false;
              cipherVisibility[1] = false;
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
    text = translate(context, indexVisibilitySlide3);
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
          MyPositioned(
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
            true,
            serverPath[0],
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
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
          MyPositioned(
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
            true,
            serverPath[1],
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // Bottom left
          MyPositioned(
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
            true,
            serverPath[2],
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // Bottom right
          MyPositioned(
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
            true,
            serverPath[3],
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
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

          // Line between top-left and middle-left
          MyLine(contentVisibility[0], 0.08, 0.14, 0.198, 0.28, seconds,
              lineColor[0]),

          // Line between middle-left and middle-right
          MyLine(contentVisibility[5], 0.28, 0.28, 0.72, 0.28, seconds,
              lineColor[1]),

          // Line between top-right and middle right
          MyLine(contentVisibility[0], 0.78, 0.229, 0.92, 0.14, seconds,
              lineColor[0]),

          // Line between top-right and bottom-right
          MyLine(contentVisibility[0], 0.72, 0.5, 0.92, 0.14, seconds,
              lineColor[0]),

          // Line between down-left and bottom-right
          MyLine(contentVisibility[12], 0.36, 0.65, 0.67, 0.55, seconds,
              lineColor[3]),

          // Line between middle-left and bottom-left
          MyLine(contentVisibility[14], 0.25, 0.34, 0.31, 0.6, seconds,
              lineColor[4]),

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
            0.15,
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

          // Cipher-left
          MyPositioned(
            false,
            true,
            false,
            false,
            0.007,
            0.0,
            0.0,
            0.2,
            0.1,
            0.15,
            cipherVisibility[0],
            cipherPath[0],
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // Cipher-right
          MyPositioned(
            true,
            false,
            false,
            false,
            0.005,
            0.09,
            0.0,
            0.0,
            0.1,
            0.15,
            cipherVisibility[1],
            cipherPath[1],
            BoxFit.fill,
            seconds,
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
                      AppLocalizations.of(context)!.inboxServer,
                      // context.watch<LanguageProvider>().selectedLanguage == true
                      //     ? DescList.posteingangsserver
                      //     : DescListEnglish.inboxServer,
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
              opacity: contentVisibility[2] == true ? 1.0 : 0.0,
              duration: Duration(seconds: seconds == 0 ? 0 : 2),
              child: Container(
                padding: EdgeInsets.only(right: 4.0, left: 4.0),
                color: Colors.grey[300],
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      AppLocalizations.of(context)!.outgoingMailServer,
                      // context.watch<LanguageProvider>().selectedLanguage == true
                      //     ? DescList.postausgangsserver
                      //     : DescListEnglish.outgoingMailServer,
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
                0.275,
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
                      AppLocalizations.of(context)!.inboxServer,
                      // context.watch<LanguageProvider>().selectedLanguage == true
                      //     ? DescList.posteingangsserver
                      //     : DescListEnglish.inboxServer,
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
                      AppLocalizations.of(context)!.outgoingMailServer,
                      // context.watch<LanguageProvider>().selectedLanguage == true
                      //     ? DescList.posteingangsserver
                      //     : DescListEnglish.inboxServer,
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
                      AppLocalizations.of(context)!.forwardingServer,
                      // context.watch<LanguageProvider>().selectedLanguage == true
                      //     ? DescList.weiterleitungsserver
                      //     : DescListEnglish.forwardingServer,
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

          // The Grey Message
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

          // The White Message
          AnimatedPositioned(
            top: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                whiteMessagePosition[1],
            right: MediaQuery.of(context).size.width * whiteMessagePosition[0],
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.1,
            duration: Duration(seconds: seconds),
            child: AnimatedOpacity(
              opacity: whiteMessageOpacity,
              duration: Duration(seconds: seconds == 0 ? 0 : 1),
              child: Image.asset('assets/white-message.jpeg'),
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
              heroTag: "right3",
              onPressed: () => setState(
                () {
                  videoTimerSlide3.cancel();
                  videoButton = true;
                  seconds = Global.slider;

                  if (isLastIndex[0]) {
                    openDialog(false);
                  }

                  if (!redLine &&
                      indexVisibilitySlide3 < 11 &&
                      contentVisibility[0] == true) {
                    indexVisibilitySlide3++;
                    if (indexVisibilitySlide3 >= 0) {
                      isLastIndex[1] = false;
                    }
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide3 + 1).toString();
                    if (indexVisibilitySlide3 == 11) {
                      isLastIndex[0] = true;
                    }
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    if (indexVisibilitySlide3 == 0) redLine = true;
                  }

                  if (indexVisibilitySlide3 == 0 &&
                      contentVisibility[0] == true) {
                    contentVisibility[indexVisibilitySlide3] = false;
                    lineTimer = Timer(
                      Duration(seconds: 1),
                      () {
                        setState(
                          () {
                            lineColor[0] = Colors.green;
                            contentVisibility[indexVisibilitySlide3] = true;
                            redLine = false;
                            greenLine = true;
                          },
                        );
                      },
                    );
                    seconds = 1;
                  }
                  if (indexVisibilitySlide3 == 1) {
                    whiteMessageOpacity = 1.0;
                  } else if (indexVisibilitySlide3 == 2) {
                    leftCipherTimer = Timer(
                      Duration(seconds: 1),
                      () {
                        setState(
                          () {
                            cipherVisibility[0] = true;
                          },
                        );
                      },
                    );

                    whiteMessagePosition[0] = 0.74;
                    whiteMessagePosition[1] = 0.15;
                  } else if (indexVisibilitySlide3 == 3) {
                    whiteMessagePosition[0] = 0.23;
                    whiteMessagePosition[1] = 0.15;
                  } else if (indexVisibilitySlide3 == 4) {
                    rightCipherTimer = Timer(
                      Duration(seconds: 1),
                      () {
                        setState(
                          () {
                            cipherVisibility[1] = true;
                          },
                        );
                      },
                    );
                    whiteMessagePosition[0] = 0.09;
                    whiteMessagePosition[1] = 0.01;
                  } else if (indexVisibilitySlide3 == 5) {
                    whiteMessageOpacity = 0.0;
                    messageOpacity = 1.0;
                  } else if (indexVisibilitySlide3 == 6) {
                    messagePosition[0] = 0.28;
                    messagePosition[1] = 0.41;
                  } else if (indexVisibilitySlide3 == 7) {
                    messagePosition[0] = 0.64;
                    messagePosition[1] = 0.52;
                  } else if (indexVisibilitySlide3 == 8) {
                    messagePosition[0] = 0.74;
                    messagePosition[1] = 0.15;
                  } else if (indexVisibilitySlide3 == 9) {
                    messagePosition[0] = 0.875;
                    messagePosition[1] = 0.01;
                  } else if (indexVisibilitySlide3 == 10) {
                    messageOpacity = 0.0;
                  } else if (indexVisibilitySlide3 == 11) {
                    malloryAndTargetVisibility[6] = false;
                    malloryAndTargetVisibility[8] = false;
                    cipherVisibility[0] = false;
                    cipherVisibility[1] = false;
                  }
                  // if (indexVisibilitySlide3 >= 0) {
                  //   if (Languages.selectedLanguage)
                  //     text = DescList.slide3Desc[indexVisibilitySlide3];
                  //   else
                  //     text = DescListEnglish.slide3Desc[indexVisibilitySlide3];
                  // }
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
              heroTag: "left3",
              onPressed: () => setState(
                () {
                  videoTimerSlide3.cancel();
                  videoButton = true;

                  seconds = Global.slider;
                  isLastIndex[0] = false;
                  if (isLastIndex[1]) {
                    openDialog(true);
                  }

                  if (indexVisibilitySlide3 == 0 && greenLine) {
                    greenLine = false;

                    contentVisibility[indexVisibilitySlide3] = false;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    lineTimer = Timer(
                      Duration(seconds: 1),
                      () {
                        setState(
                          () {
                            lineColor[0] = Colors.red;
                            contentVisibility[indexVisibilitySlide3] = true;
                            redLine = false;
                            indexVisibilitySlide3--;
                            pageController1 = TextEditingController()
                              ..text = (indexVisibilitySlide3 + 1).toString();

                            isLastIndex[1] = true;
                          },
                        );
                      },
                    );
                    seconds = 1;
                  }
                  if (indexVisibilitySlide3 == 1) {
                    whiteMessageOpacity = 0.0;
                  } else if (indexVisibilitySlide3 == 2) {
                    leftCipherTimer = Timer(Duration(seconds: 1), () {
                      setState(() {
                        cipherVisibility[0] = false;
                      });
                    });
                    whiteMessagePosition[0] = 0.875;
                    whiteMessagePosition[1] = 0.01;
                  } else if (indexVisibilitySlide3 == 3) {
                    whiteMessagePosition[0] = 0.74;
                    whiteMessagePosition[1] = 0.15;
                  } else if (indexVisibilitySlide3 == 4) {
                    rightCipherTimer = Timer(Duration(seconds: 1), () {
                      setState(() {
                        cipherVisibility[1] = false;
                      });
                    });
                    whiteMessagePosition[0] = 0.23;
                    whiteMessagePosition[1] = 0.15;
                  } else if (indexVisibilitySlide3 == 5) {
                    whiteMessageOpacity = 1.0;
                    messageOpacity = 0.0;
                  } else if (indexVisibilitySlide3 == 6) {
                    messagePosition[0] = 0.09;
                    messagePosition[1] = 0.01;
                  } else if (indexVisibilitySlide3 == 7) {
                    messagePosition[0] = 0.28;
                    messagePosition[1] = 0.41;
                  } else if (indexVisibilitySlide3 == 8) {
                    messagePosition[0] = 0.64;
                    messagePosition[1] = 0.52;
                  } else if (indexVisibilitySlide3 == 9) {
                    messagePosition[0] = 0.74;
                    messagePosition[1] = 0.15;
                  } else if (indexVisibilitySlide3 == 10) {
                    messageOpacity = 1.0;
                  } else if (indexVisibilitySlide3 == 11) {
                    malloryAndTargetVisibility[6] = true;
                    malloryAndTargetVisibility[8] = true;
                    cipherVisibility[0] = true;
                    cipherVisibility[1] = true;
                  }
                  if (!redLine && indexVisibilitySlide3 > 0) {
                    if (indexVisibilitySlide3 == 0) {
                      redLine = true;
                    }
                    indexVisibilitySlide3--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide3 + 1).toString();
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    // if (Languages.selectedLanguage) {
                    //   text = DescList.slide3Desc[indexVisibilitySlide3];
                    // } else {
                    //   text = DescListEnglish.slide3Desc[indexVisibilitySlide3];
                    // }
                  }
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
              heroTag: "middle3",
              onPressed: () => setState(
                () {
                  isPressedUp = 1;
                  isPressedDown = 2;

                  dropButton = !dropButton;
                  containerSeconds = 2;
                  desc = !desc;
                  timerSlide3 = Timer(
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
                                              videoTimerSlide3.cancel();
                                              videoTimerSlide3 =
                                                  videoTimerProblem();
                                            }
                                          } else if (Global.val == 3) {
                                            Global.slider = Global.val - 2;
                                            if (!videoButton) {
                                              videoTimerSlide3.cancel();
                                              videoTimerSlide3 =
                                                  videoTimerProblem();
                                            }
                                          } else {
                                            Global.slider = Global.val;
                                            if (!videoButton) {
                                              videoTimerSlide3.cancel();
                                              videoTimerSlide3 =
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
              heroTag: "stop3",
              backgroundColor: Colors.red,
              onPressed: () => setState(
                () {
                  videoTimerSlide3.cancel();
                  timerSlide3.cancel();
                  leftCipherTimer.cancel();
                  rightCipherTimer.cancel();
                  // lineTimer.cancel();
                  leftCipherVideoTimer.cancel();
                  rightCipherVideoTimer.cancel();
                  lineVideoTimer.cancel();
                  pageNumberTimer.cancel();
                  finishTimer.cancel();
                  pageController1 = TextEditingController()
                    ..text = (0).toString();
                  isLastIndex = [false, true];
                  // contentVisibility[0] = true;
                  contentVisibility[0] = false;
                  for (var i = 0; i < 6; i++) {
                    lineColor[i] = Colors.red;
                  }
                  lineTimer = Timer(
                    const Duration(milliseconds: 50),
                    () {
                      setState(
                        () {
                          contentVisibility[0] = true;
                          lineColor[0] = Colors.red;
                          lineColor[1] = Colors.red;
                          lineColor[2] = Colors.red;
                          lineColor[3] = Colors.red;
                          lineColor[4] = Colors.red;
                          lineColor[5] = Colors.red;
                          lineTimer.cancel();
                        },
                      );
                    },
                  );

                  videoButton = true;
                  malloryAndTargetVisibility[6] = true;
                  malloryAndTargetVisibility[8] = true;
                  cipherVisibility[0] = false;
                  cipherVisibility[1] = false;
                  stepsVisibility = [true, false];
                  whiteMessagePosition[0] = 0.875;
                  whiteMessagePosition[1] = 0.01;
                  whiteMessageOpacity = 0.0;
                  messagePosition[0] = 0.09;
                  messagePosition[1] = 0.01;
                  indexVisibilitySlide3 = -1;
                  messageOpacity = 0.0;
                  seconds = 0;
                  text = '';
                  desc = true;
                  descVisbility = desc;
                  containerSeconds = 0;
                  descIndex = -1;
                  dropButton = false;
                  timerProblem = 0;
                  messageLastIndexProblem = 0;
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
              heroTag: "play3",
              backgroundColor: Colors.green,
              onPressed: () => setState(
                () {
                  desc = true;
                  descVisbility = desc;
                  dropButton = false;
                  videoButton = !videoButton;
                  if (!videoButton) {
                    videoTimerSlide3 = videoTimerProblem();
                  } else
                    videoTimerSlide3.cancel();
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
              heroTag: "more3",
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

                  timerSlide3 = Timer(
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
                    '${indexVisibilitySlide3 + 1} / 12',
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
                  videoTimerSlide3.cancel();
                }
                videoButton = true;
                seconds = Global.slider;
              });
              if ((int.parse(pageController1.text) > 12) ||
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
                if (indexVisibilitySlide3 != -1) {
                  pageController1 = TextEditingController()
                    ..text = (indexVisibilitySlide3).toString();
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

  stopFunction() {
    setState(() {
      videoTimerSlide3.cancel();
      timerSlide3.cancel();
      leftCipherTimer.cancel();
      rightCipherTimer.cancel();
      // lineTimer.cancel();
      leftCipherVideoTimer.cancel();
      rightCipherVideoTimer.cancel();
      lineVideoTimer.cancel();
      pageNumberTimer.cancel();
      // finishTimer.cancel();

      // switchOldValue = false;
      // scaleEnabledOldVal = false;
      // sliderOldValue = 0;
      // valOldValue = 0;
      // languageOldValue = true;
      // locale = 'de';
      isLastIndex = [false, true];
      // contentVisibility[0] = true;
      contentVisibility[0] = false;
      for (var i = 0; i < 6; i++) {
        lineColor[i] = Colors.red;
      }
      lineTimer = Timer(
        const Duration(milliseconds: 50),
        () {
          setState(
            () {
              contentVisibility[0] = true;
              lineColor[0] = Colors.red;
              lineColor[1] = Colors.red;
              lineColor[2] = Colors.red;
              lineColor[3] = Colors.red;
              lineColor[4] = Colors.red;
              lineColor[5] = Colors.red;
              lineTimer.cancel();
            },
          );
        },
      );

      videoButton = true;
      malloryAndTargetVisibility[6] = true;
      malloryAndTargetVisibility[8] = true;
      cipherVisibility[0] = false;
      cipherVisibility[1] = false;
      stepsVisibility = [true, false];
      whiteMessagePosition[0] = 0.875;
      whiteMessagePosition[1] = 0.01;
      whiteMessageOpacity = 0.0;
      messagePosition[0] = 0.09;
      messagePosition[1] = 0.01;
      indexVisibilitySlide3 = -1;
      messageOpacity = 0.0;
      seconds = 0;
      text = '';
      desc = true;
      descVisbility = desc;
      containerSeconds = 0;
      descIndex = -1;
      dropButton = false;
      timerProblem = 0;
      messageLastIndexProblem = 0;
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
