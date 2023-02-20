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

class Slide8 extends StatefulWidget {
  const Slide8({super.key});

  @override
  Slide8State createState() => Slide8State();
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
bool greyMessageVisibility = true;
bool certificateVisibility = true;
String dropdownValue = 'Deutsch';
var settingsVideoButton = 0.13;
var settingsStopButton = 0.13;
var advancedSettingsButton = 0.13;
var backToZero = 0;
var checkSettingsDuration = 0;
var isSettingsPressed = 0;
var settingsButtonDuration = 0;
bool redLine = false;
bool greenLine = false;
bool delay = true;
bool resetVisibility = true;
var malloryOpacity = 1.0;
var greyMessageOpacity = 0.0;
var envelopeOpacity = 0.0;
/*
 * priority between the both servers at the bottom
 */
List priority = [true, true];
int descIndex = -1;
int containerSeconds = 0;
int isPressedUp = 0;
int isPressedDown = 0;
var greenServerPath = 'assets/green_server.jpeg';
bool notificationVisibility = false;
List cipherPaths = [
  'assets/top-left-cipher.jpeg',
  'assets/top-right-cipher.jpeg',
  'assets/bottom-left-cipher.jpeg',
  'assets/bottom-right-cipher.jpeg'
];
List cipherVisibility = [true, false, false];
List cipherOpacity = [1.0, 0.0, 0.0];
int checkVisibility = 0;
List stepsVisibility = [true, false];
var timerProblem = 0;
var seconds = Global.slider;
List greyMessagePosition = [0.09, 0.01];
List whiteMessagePosition = [0.875, 0.001];
List certificatePosition = [0.1, 0.04];
List envelopePosition = [0.088, 0.08];
var indexVisibilitySlide8 = -1;
List contentVisibility = [];
List malloryAndTargetVisibility = [];
List lineColor = [];
double certificateOpacity = 0.0;
bool dropButton = false;
bool desc = true;
bool descVisbility = desc;
String text = '';
bool videoButton = true;
bool settingButton = true;
var timerSeconds = 3;
Timer greenServerTimer = Timer(Duration(seconds: 1), () {});
Timer greenServerVideoTimer = Timer(Duration(seconds: 1), () {});
Timer videoTimerVariable = Timer(Duration(seconds: 1), () {});
Timer timerSlide8 = Timer(Duration(seconds: 1), () {});
Timer envelopTimer = Timer(Duration(seconds: 1), () {});
Timer videoTimerSlide8 =
    Timer.periodic(Duration(seconds: Global.slider), (videoTimer) {});
String notificationPath = 'assets/notification.jpeg';
//---------------
TextEditingController pageController1 = TextEditingController()
  ..text = (indexVisibilitySlide8 + 1).toString();
Timer pageNumberTimer = Timer(Duration(seconds: seconds), () {});
Timer finishTimer =
    Timer.periodic(Duration(seconds: Global.slider), (finish) {});

class Slide8State extends State<Slide8> with SingleTickerProviderStateMixin {
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
      lineColor.add(Colors.green);
    }
  }

  @override
  // ignore: must_call_super
  void dispose() {
    greenServerTimer.cancel();
    greenServerVideoTimer.cancel();
    videoTimerSlide8.cancel();
    timerSlide8.cancel();
    videoTimerVariable.cancel();
    videoTimerSlide8.cancel();
    envelopTimer.cancel();
    pageNumberTimer.cancel();
    finishTimer.cancel();
    contentVisibility.clear();
    malloryAndTargetVisibility.clear();
    lineColor.clear();
    switchOldValue = false;
    scaleEnabledOldVal = false;
    sliderOldValue = 0;
    valOldValue = 0;
    languageOldValue = true;
    isLastIndex = [false, true];
    pageController1 = TextEditingController()..text = (0).toString();
    resetVisibility = true;
    greyMessageVisibility = true;
    certificateVisibility = true;
    stepsVisibility = [true, false];
    settingsVideoButton = 0.13;
    settingsStopButton = 0.13;
    advancedSettingsButton = 0.13;
    backToZero = 0;
    checkSettingsDuration = 0;
    isSettingsPressed = 0;
    settingsButtonDuration = 0;
    redLine = false;
    greenLine = false;
    delay = true;
    malloryOpacity = 1.0;
    greyMessageOpacity = 0.0;
    envelopeOpacity = 0.0;
    priority = [true, true];
    descIndex = -1;
    containerSeconds = 0;
    isPressedUp = 0;
    isPressedDown = 0;
    notificationVisibility = false;
    cipherVisibility = [true, false, false];
    cipherOpacity = [1.0, 0.0, 0.0];
    checkVisibility = 0;
    timerProblem = 0;
    greyMessagePosition = [0.09, 0.01];
    whiteMessagePosition = [0.875, 0.001];
    certificatePosition = [0.1, 0.04];
    envelopePosition = [0.088, 0.08];
    indexVisibilitySlide8 = -1;
    certificateOpacity = 0.0;
    dropButton = false;
    desc = true;
    descVisbility = desc;
    text = '';
    videoButton = true;
    settingButton = true;
    timerSeconds = 3;

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
            if (indexVisibilitySlide8 == a) {
              pageNumberTimer.cancel();
            } else {
              if (indexVisibilitySlide8 < 10 &&
                  contentVisibility[0] == true &&
                  delay) {
                indexVisibilitySlide8++;
                pageController1 = TextEditingController()
                  ..text = (indexVisibilitySlide8 + 1).toString();
                stepsVisibility[0] = !stepsVisibility[0];
                stepsVisibility[1] = !stepsVisibility[1];
                if (indexVisibilitySlide8 == 10) {
                  isLastIndex[0] = true;
                }
              }
              if (indexVisibilitySlide8 > -1) {
                isLastIndex[1] = false;
              }
              if (indexVisibilitySlide8 == 0) {
                greyMessageOpacity = 1.0;
              } else if (indexVisibilitySlide8 == 1) {
                certificateOpacity = 1.0;
              } else if (indexVisibilitySlide8 == 2) {
                envelopeOpacity = 1.0;
              } else if (indexVisibilitySlide8 == 3 && delay) {
                greyMessagePosition[1] = envelopePosition[1];
                certificatePosition[1] = 0.11;
                delay = false;
                envelopTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide8 == 4) {
                greyMessageVisibility = false;
                certificateVisibility = false;
                envelopePosition[0] = 0.28;
                envelopePosition[1] = 0.41;
                cipherVisibility[2] = true;
                cipherOpacity[2] = 1.0;
              } else if (indexVisibilitySlide8 == 5) {
                envelopePosition[0] = 0.64;
                envelopePosition[1] = 0.52;
                cipherVisibility[1] = true;
                cipherOpacity[1] = 1.0;
              } else if (indexVisibilitySlide8 == 6) {
                envelopePosition[0] = 0.74;
                envelopePosition[1] = 0.15;
              } else if (indexVisibilitySlide8 == 7 && delay) {
                envelopePosition[0] = 0.8725;
                envelopePosition[1] = 0.08;
                greyMessagePosition[0] = 0.875;
                greyMessagePosition[1] = 0.08;
                certificatePosition[0] = 0.885;
                certificatePosition[1] = 0.11;
                delay = false;
                envelopTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    greyMessageVisibility = true;
                    certificateVisibility = true;
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide8 == 8 && delay) {
                greyMessagePosition[0] = 0.875;
                greyMessagePosition[1] = 0.001;
                certificatePosition[0] = 0.885;
                certificatePosition[1] = 0.03;

                delay = false;
                envelopTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    envelopeOpacity = 0.0;
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide8 == 9) {
                malloryAndTargetVisibility[0] = false;
                malloryOpacity = 0.0;
                for (int i = 0; i <= 2; i++) {
                  cipherVisibility[i] = false;
                }

                for (int i = 0; i <= 2; i++) {
                  cipherOpacity[i] = 0.0;
                }
              } else if (indexVisibilitySlide8 == 10) {
                greyMessageOpacity = 0.0;
                certificateOpacity = 0.0;
              }
            }
          },
        );
      },
    );
    return pageNumberTimer;
  }

  Timer videoTimerProblem() {
    videoTimerVariable = Timer.periodic(
      Duration(seconds: Global.slider),
      (Timer videoTimerVariable) {
        setState(
          () {
            seconds = Global.slider;
            if (isLastIndex[0]) {
              openDialog(false);
            }
            if (indexVisibilitySlide8 < 10 &&
                contentVisibility[0] == true &&
                delay) {
              indexVisibilitySlide8++;
              pageController1 = TextEditingController()
                ..text = (indexVisibilitySlide8 + 1).toString();
              stepsVisibility[0] = !stepsVisibility[0];
              stepsVisibility[1] = !stepsVisibility[1];
              if (indexVisibilitySlide8 == 10) {
                isLastIndex[0] = true;
              }
            }
            if (indexVisibilitySlide8 > -1) {
              isLastIndex[1] = false;
            }
            if (indexVisibilitySlide8 == 0) {
              greyMessageOpacity = 1.0;
            } else if (indexVisibilitySlide8 == 1) {
              certificateOpacity = 1.0;
            } else if (indexVisibilitySlide8 == 2) {
              envelopeOpacity = 1.0;
            } else if (indexVisibilitySlide8 == 3 && delay) {
              greyMessagePosition[1] = envelopePosition[1];
              certificatePosition[1] = 0.11;
              delay = false;
              envelopTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide8 == 4) {
              greyMessageVisibility = false;
              certificateVisibility = false;
              envelopePosition[0] = 0.28;
              envelopePosition[1] = 0.41;
              cipherVisibility[2] = true;
              cipherOpacity[2] = 1.0;
            } else if (indexVisibilitySlide8 == 5) {
              envelopePosition[0] = 0.64;
              envelopePosition[1] = 0.52;
              cipherVisibility[1] = true;
              cipherOpacity[1] = 1.0;
            } else if (indexVisibilitySlide8 == 6) {
              envelopePosition[0] = 0.74;
              envelopePosition[1] = 0.15;
            } else if (indexVisibilitySlide8 == 7 && delay) {
              envelopePosition[0] = 0.8725;
              envelopePosition[1] = 0.08;
              greyMessagePosition[0] = 0.875;
              greyMessagePosition[1] = 0.08;
              certificatePosition[0] = 0.885;
              certificatePosition[1] = 0.11;
              delay = false;
              envelopTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  greyMessageVisibility = true;
                  certificateVisibility = true;
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide8 == 8 && delay) {
              greyMessagePosition[0] = 0.875;
              greyMessagePosition[1] = 0.001;
              certificatePosition[0] = 0.885;
              certificatePosition[1] = 0.03;

              delay = false;
              envelopTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  envelopeOpacity = 0.0;
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide8 == 9) {
              malloryAndTargetVisibility[0] = false;
              malloryOpacity = 0.0;
              for (int i = 0; i <= 2; i++) {
                cipherVisibility[i] = false;
              }

              for (int i = 0; i <= 2; i++) {
                cipherOpacity[i] = 0.0;
              }
            } else if (indexVisibilitySlide8 == 10) {
              greyMessageOpacity = 0.0;
              certificateOpacity = 0.0;
            }
            // if (Languages.selectedLanguage) {
            //   text = DescList.slide8Desc[indexVisibilitySlide8];
            // } else {
            //   text = DescListEnglish.slide8Desc[indexVisibilitySlide8];
            // }
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
            contentVisibility[0],
            greenServerPath,
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
            contentVisibility[0],
            greenServerPath,
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
            contentVisibility[0],
            greenServerPath,
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
            contentVisibility[0],
            greenServerPath,
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // Line between top-left and middle-left
          MyLine(true, 0.08, 0.14, 0.198, 0.28, seconds, Colors.green),

          // Line between middle-left and middle-right
          MyLine(true, 0.28, 0.28, 0.72, 0.28, seconds, Colors.green),

          // Line between top-right and middle right
          MyLine(true, 0.78, 0.229, 0.92, 0.14, seconds, Colors.green),

          // Line between top-right and bottom-right
          MyLine(true, 0.72, 0.5, 0.92, 0.14, seconds, Colors.green),

          // Line between down-left and bottom-right
          MyLine(true, 0.36, 0.65, 0.67, 0.55, seconds, Colors.green),

          // Line between middle-left and bottom-left
          MyLine(true, 0.25, 0.34, 0.31, 0.6, seconds, Colors.green),

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
            malloryAndTargetVisibility[0],
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
            malloryAndTargetVisibility[0],
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
            malloryAndTargetVisibility[0],
            'assets/mallory.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            malloryOpacity,
          ),

          // Top-Left-Cipher

          MyPositioned(
            true,
            false,
            false,
            false,
            0.013,
            0.62,
            0.0,
            0.0,
            0.1,
            0.15,
            cipherVisibility[0],
            cipherPaths[0],
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            cipherOpacity[0],
          ),
          // Top-Right-Cipher
          MyPositioned(
            false,
            true,
            false,
            false,
            0.025,
            0.0,
            0.0,
            0.585,
            0.1,
            0.15,
            cipherVisibility[0],
            cipherPaths[1],
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            cipherOpacity[0],
          ),
          // Bottom-Left-Cipher
          Visibility(
            visible: resetVisibility,
            child: MyPositioned(
              true,
              false,
              false,
              false,
              0.45,
              0.77,
              0.0,
              0.0,
              0.1,
              0.15,
              cipherVisibility[1],
              cipherPaths[2],
              BoxFit.fill,
              seconds,
              HomePageE2EEState.returnAppBar[1],
              cipherOpacity[1],
            ),
          ),
          // Bottom-Right-Cipher
          Visibility(
            visible: resetVisibility,
            child: MyPositioned(
              false,
              true,
              false,
              false,
              0.3,
              0.0,
              0.0,
              0.55,
              0.13,
              0.18,
              cipherVisibility[2],
              cipherPaths[3],
              BoxFit.fill,
              seconds,
              HomePageE2EEState.returnAppBar[1],
              cipherOpacity[2],
            ),
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
            false,
            'assets/mallory.jpeg',
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
                      'test',
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
                      'test',
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
                      'test',
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
                      'test',
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
                      'test',
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
          Visibility(
            visible: greyMessageVisibility,
            child: AnimatedPositioned(
              top: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  greyMessagePosition[1],
              right: MediaQuery.of(context).size.width * greyMessagePosition[0],
              width: MediaQuery.of(context).size.width * 0.04,
              height: MediaQuery.of(context).size.height * 0.1,
              duration: Duration(seconds: seconds),
              child: AnimatedOpacity(
                opacity: greyMessageOpacity,
                duration: Duration(seconds: seconds == 0 ? 0 : 1),
                child: Image.asset('assets/message.jpeg'),
              ),
            ),
          ),

          //Certification
          Visibility(
            visible: certificateVisibility,
            child: AnimatedPositioned(
              top: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  certificatePosition[1],
              right: MediaQuery.of(context).size.width * certificatePosition[0],
              width: MediaQuery.of(context).size.width * 0.02,
              height: MediaQuery.of(context).size.height * 0.05,
              duration: Duration(seconds: seconds),
              child: AnimatedOpacity(
                opacity: certificateOpacity,
                duration: Duration(seconds: seconds == 0 ? 0 : 1),
                child: Image.asset('assets/certificate.jpeg'),
              ),
            ),
          ),

          //Envelope
          AnimatedPositioned(
            top: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                envelopePosition[1],
            right: MediaQuery.of(context).size.width * envelopePosition[0],
            width: MediaQuery.of(context).size.width * 0.045,
            height: MediaQuery.of(context).size.height * 0.1,
            duration: Duration(seconds: seconds),
            child: AnimatedOpacity(
              opacity: envelopeOpacity,
              duration: Duration(seconds: seconds == 0 ? 0 : 1),
              child: Image.asset('assets/envelope.jpeg'),
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
              heroTag: "right8",
              onPressed: () => setState(
                () {
                  videoTimerSlide8.cancel();
                  if (videoButton == false) {
                    videoTimerSlide8.cancel();
                    envelopTimer.cancel();
                    delay = true;
                  }
                  videoButton = true;
                  seconds = Global.slider;

                  if (isLastIndex[0]) {
                    openDialog(false);
                  }
                  if (indexVisibilitySlide8 < 10 &&
                      contentVisibility[0] == true &&
                      delay) {
                    indexVisibilitySlide8++;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide8 + 1).toString();
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    if (indexVisibilitySlide8 == 10) {
                      isLastIndex[0] = true;
                    }
                  }
                  if (indexVisibilitySlide8 > -1) {
                    isLastIndex[1] = false;
                  }
                  if (indexVisibilitySlide8 == 0) {
                    greyMessageOpacity = 1.0;
                  } else if (indexVisibilitySlide8 == 1) {
                    certificateOpacity = 1.0;
                  } else if (indexVisibilitySlide8 == 2) {
                    envelopeOpacity = 1.0;
                  } else if (indexVisibilitySlide8 == 3 && delay) {
                    greyMessagePosition[1] = envelopePosition[1];
                    certificatePosition[1] = 0.11;
                    delay = false;
                    envelopTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide8 == 4) {
                    greyMessageVisibility = false;
                    certificateVisibility = false;
                    envelopePosition[0] = 0.28;
                    envelopePosition[1] = 0.41;
                    cipherVisibility[2] = true;
                    cipherOpacity[2] = 1.0;
                  } else if (indexVisibilitySlide8 == 5) {
                    envelopePosition[0] = 0.64;
                    envelopePosition[1] = 0.52;
                    cipherVisibility[1] = true;
                    cipherOpacity[1] = 1.0;
                  } else if (indexVisibilitySlide8 == 6) {
                    envelopePosition[0] = 0.74;
                    envelopePosition[1] = 0.15;
                  } else if (indexVisibilitySlide8 == 7 && delay) {
                    envelopePosition[0] = 0.8725;
                    envelopePosition[1] = 0.08;
                    greyMessagePosition[0] = 0.875;
                    greyMessagePosition[1] = 0.08;
                    certificatePosition[0] = 0.885;
                    certificatePosition[1] = 0.11;
                    delay = false;
                    envelopTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        greyMessageVisibility = true;
                        certificateVisibility = true;
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide8 == 8 && delay) {
                    greyMessagePosition[0] = 0.875;
                    greyMessagePosition[1] = 0.001;
                    certificatePosition[0] = 0.885;
                    certificatePosition[1] = 0.03;

                    delay = false;
                    envelopTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        envelopeOpacity = 0.0;
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide8 == 9) {
                    malloryAndTargetVisibility[0] = false;
                    malloryOpacity = 0.0;
                    for (int i = 0; i <= 2; i++) {
                      cipherVisibility[i] = false;
                    }

                    for (int i = 0; i <= 2; i++) {
                      cipherOpacity[i] = 0.0;
                    }
                  } else if (indexVisibilitySlide8 == 10) {
                    greyMessageOpacity = 0.0;
                    certificateOpacity = 0.0;
                  }
                  // if (Languages.selectedLanguage) {
                  //   text = DescList.slide8Desc[indexVisibilitySlide8];
                  // } else {
                  //   text = DescListEnglish.slide8Desc[indexVisibilitySlide8];
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
              heroTag: "left8",
              onPressed: () => setState(
                () {
                  if (videoButton == false) {
                    videoTimerSlide8.cancel();
                    envelopTimer.cancel();
                    delay = true;
                  }
                  videoButton = true;
                  seconds = Global.slider;
                  if (isLastIndex[1]) {
                    openDialog(true);
                  }
                  if (indexVisibilitySlide8 == 0) {
                    greyMessageOpacity = 0.0;
                    indexVisibilitySlide8--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide8 + 1).toString();
                    isLastIndex[1] = true;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                  } else if (indexVisibilitySlide8 == 1) {
                    certificateOpacity = 0.0;
                  } else if (indexVisibilitySlide8 == 2 && delay) {
                    envelopeOpacity = 0.0;
                  } else if (indexVisibilitySlide8 == 3 && delay) {
                    greyMessagePosition[1] = 0.001;
                    certificatePosition[1] = 0.03;
                    delay = false;
                    indexVisibilitySlide8--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide8 + 1).toString();
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    // if (Languages.selectedLanguage)
                    //   text = DescList.slide8Desc[indexVisibilitySlide8];
                    // else
                    //   text = DescListEnglish.slide8Desc[indexVisibilitySlide8];
                    envelopTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide8 == 4 && delay) {
                    delay = false;
                    indexVisibilitySlide8--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide8 + 1).toString();
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    if (Global.selectedLanguage)
                      //   text = DescList.slide8Desc[indexVisibilitySlide8];
                      // else
                      //   text = DescListEnglish.slide8Desc[indexVisibilitySlide8];
                      envelopTimer = Timer(Duration(seconds: seconds), () {
                        setState(() {
                          greyMessageVisibility = true;
                          certificateVisibility = true;
                          delay = true;
                        });
                      });
                    envelopePosition[0] = 0.088;
                    envelopePosition[1] = 0.08;
                    cipherVisibility[2] = false;
                    cipherOpacity[2] = 0.0;
                  } else if (indexVisibilitySlide8 == 5) {
                    cipherVisibility[1] = false;
                    cipherOpacity[1] = 0.0;
                    envelopePosition[0] = 0.28;
                    envelopePosition[1] = 0.41;
                  } else if (indexVisibilitySlide8 == 6) {
                    envelopePosition[0] = 0.64;
                    envelopePosition[1] = 0.52;
                  } else if (indexVisibilitySlide8 == 7 && delay) {
                    envelopePosition[0] = 0.74;
                    envelopePosition[1] = 0.15;
                    greyMessagePosition[0] = 0.09;
                    greyMessagePosition[1] = 0.08;
                    certificatePosition[0] = 0.1;
                    certificatePosition[1] = 0.11;
                    greyMessageVisibility = false;
                    certificateVisibility = false;
                  } else if (indexVisibilitySlide8 == 8 && delay) {
                    envelopeOpacity = 1.0;
                    greyMessagePosition[0] = 0.875;
                    greyMessagePosition[1] = 0.08;
                    certificatePosition[0] = 0.885;
                    certificatePosition[1] = 0.11;
                    delay = false;
                    indexVisibilitySlide8--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide8 + 1).toString();
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    // if (Languages.selectedLanguage)
                    //   text = DescList.slide8Desc[indexVisibilitySlide8];
                    // else
                    //   text = DescListEnglish.slide8Desc[indexVisibilitySlide8];
                    envelopTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide8 == 9) {
                    malloryAndTargetVisibility[0] = true;
                    malloryOpacity = 1.0;
                    for (int i = 0; i <= 2; i++) {
                      cipherVisibility[i] = true;
                    }

                    for (int i = 0; i <= 2; i++) {
                      cipherOpacity[i] = 1.0;
                    }
                  } else if (indexVisibilitySlide8 == 10) {
                    greyMessageOpacity = 1.0;
                    certificateOpacity = 1.0;
                  }
                  if (!redLine && indexVisibilitySlide8 > 0 && delay) {
                    if (indexVisibilitySlide8 == 0) {
                      redLine = true;
                      delay = false;
                    }
                    indexVisibilitySlide8--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide8 + 1).toString();
                    isLastIndex[0] = false;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    // if (Languages.selectedLanguage)
                    //   text = DescList.slide8Desc[indexVisibilitySlide8];
                    // else
                    //   text = DescListEnglish.slide8Desc[indexVisibilitySlide8];
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
              heroTag: "middle8",
              onPressed: () => setState(
                () {
                  isPressedUp = 1;
                  isPressedDown = 2;

                  dropButton = !dropButton;
                  containerSeconds = 2;
                  desc = !desc;
                  timerSlide8 = Timer(
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
                                              videoTimerSlide8.cancel();
                                              videoTimerSlide8 =
                                                  videoTimerProblem();
                                            }
                                          } else if (Global.val == 3) {
                                            Global.slider = Global.val - 2;
                                            if (!videoButton) {
                                              videoTimerSlide8.cancel();
                                              videoTimerSlide8 =
                                                  videoTimerProblem();
                                            }
                                          } else {
                                            Global.slider = Global.val;
                                            if (!videoButton) {
                                              videoTimerSlide8.cancel();
                                              videoTimerSlide8 =
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
              heroTag: "stop8",
              backgroundColor: Colors.red,
              onPressed: () => setState(
                () {
                  Global.replacedSliderValue = Global.slider;
                  greenServerTimer.cancel();
                  greenServerVideoTimer.cancel();
                  videoTimerSlide8.cancel();
                  timerSlide8.cancel();
                  videoTimerVariable.cancel();
                  videoTimerSlide8.cancel();
                  envelopTimer.cancel();
                  pageNumberTimer.cancel();
                  finishTimer.cancel();
                  switchOldValue = false;
                  scaleEnabledOldVal = false;
                  sliderOldValue = 0;
                  valOldValue = 0;
                  languageOldValue = true;
                  isLastIndex = [false, true];
                  pageController1 = TextEditingController()
                    ..text = (0).toString();
                  malloryAndTargetVisibility[0] = true;
                  greyMessageVisibility = false;
                  certificateVisibility = false;
                  stepsVisibility = [true, false];
                  backToZero = 0;
                  checkSettingsDuration = 0;
                  isSettingsPressed = 0;
                  settingsButtonDuration = 0;
                  redLine = false;
                  greenLine = false;
                  delay = true;
                  malloryOpacity = 1.0;
                  greyMessageOpacity = 0.0;
                  envelopeOpacity = 0.0;
                  priority = [true, true];
                  descIndex = -1;
                  containerSeconds = 0;
                  isPressedUp = 0;
                  isPressedDown = 0;
                  notificationVisibility = false;
                  cipherVisibility = [true, false, false];
                  cipherOpacity = [1.0, 0.0, 0.0];
                  checkVisibility = 0;
                  timerProblem = 0;
                  Global.slider = 0;
                  seconds = Global.slider;
                  greyMessagePosition = [0.09, 0.01];
                  whiteMessagePosition = [0.875, 0.001];
                  certificatePosition = [0.1, 0.04];
                  envelopePosition = [0.088, 0.08];
                  indexVisibilitySlide8 = -1;
                  certificateOpacity = 0.0;
                  dropButton = false;
                  desc = true;
                  descVisbility = desc;
                  text = '';
                  videoButton = true;
                  timerSeconds = 3;

                  envelopTimer = Timer(Duration(milliseconds: 50), () {
                    setState(() {
                      greyMessageVisibility = true;
                      certificateVisibility = true;
                      resetVisibility = true;
                      Global.slider = Global.replacedSliderValue;
                      seconds = Global.slider;
                      envelopTimer.cancel();
                    });
                  });
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
              heroTag: "play8",
              backgroundColor: Colors.green,
              onPressed: () => setState(
                () {
                  desc = true;
                  descVisbility = desc;
                  dropButton = false;
                  videoButton = !videoButton;
                  if (!videoButton) {
                    videoTimerSlide8 = videoTimerProblem();
                  } else
                    videoTimerSlide8.cancel();
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
              heroTag: "more8",
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

                  timerSlide8 = Timer(
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
                    '${indexVisibilitySlide8 + 1} / 11',
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
                  videoTimerSlide8.cancel();
                }
                videoButton = true;
                seconds = Global.slider;
              });
              if ((int.parse(pageController1.text) > 11) ||
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
                if (indexVisibilitySlide8 != -1) {
                  pageController1 = TextEditingController()
                    ..text = (indexVisibilitySlide8).toString();
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
      Global.replacedSliderValue = Global.slider;
      greenServerTimer.cancel();
      greenServerVideoTimer.cancel();
      videoTimerSlide8.cancel();
      timerSlide8.cancel();
      videoTimerVariable.cancel();
      videoTimerSlide8.cancel();
      envelopTimer.cancel();
      switchOldValue = false;
      scaleEnabledOldVal = false;
      sliderOldValue = 0;
      valOldValue = 0;
      languageOldValue = true;
      isLastIndex = [false, true];
      malloryAndTargetVisibility[0] = true;
      greyMessageVisibility = false;
      certificateVisibility = false;
      stepsVisibility = [true, false];
      backToZero = 0;
      checkSettingsDuration = 0;
      isSettingsPressed = 0;
      settingsButtonDuration = 0;
      redLine = false;
      greenLine = false;
      delay = true;
      malloryOpacity = 1.0;
      greyMessageOpacity = 0.0;
      envelopeOpacity = 0.0;
      priority = [true, true];
      descIndex = -1;
      containerSeconds = 0;
      isPressedUp = 0;
      isPressedDown = 0;
      notificationVisibility = false;
      cipherVisibility = [true, false, false];
      cipherOpacity = [1.0, 0.0, 0.0];
      checkVisibility = 0;
      timerProblem = 0;
      Global.slider = 0;
      seconds = Global.slider;
      greyMessagePosition = [0.09, 0.01];
      whiteMessagePosition = [0.875, 0.001];
      certificatePosition = [0.1, 0.04];
      envelopePosition = [0.088, 0.08];
      indexVisibilitySlide8 = -1;
      certificateOpacity = 0.0;
      dropButton = false;
      desc = true;
      descVisbility = desc;
      text = '';
      videoButton = true;
      timerSeconds = 3;

      envelopTimer = Timer(Duration(milliseconds: 50), () {
        setState(() {
          greyMessageVisibility = true;
          certificateVisibility = true;
          resetVisibility = true;
          Global.slider = Global.replacedSliderValue;
          seconds = Global.slider;
          envelopTimer.cancel();
        });
      });
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
