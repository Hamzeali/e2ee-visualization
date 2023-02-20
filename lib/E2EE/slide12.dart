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
import 'positioned-widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Slide12 extends StatefulWidget {
  const Slide12({super.key});

  @override
  Slide12State createState() => Slide12State();
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
// New Variables
var indexVisibilitySlide12 = -1;
List keysOpacity = [0.0, 0.0];
List containerOpacity = [0.0, 0.0];
List aliceOrangeKeyPosition = [0.046, 0.003];
List aliceGreenKeyPosition = [0.008, 0.003];
List aliceKeysOpacity = [0.0, 0.0];
List certificatePosition = [0.885, 0.033];
List whiteMessagePosition = [0.875, 0.001];
double certificateOpacity = 0.0;
bool delay = true;
bool messageReplacement = false;
List componentsVisibility = [false, false];
bool resetVisibility = true;
bool isPressed = false;
Timer delayTimer = Timer(Duration(seconds: 1), () {});
String dropdownValue = 'Deutsch';
var settingsVideoButton = 0.13;
var settingsStopButton = 0.13;
var advancedSettingsButton = 0.13;
var backToZero = 0;
var checkSettingsDuration = 0;
var isSettingsPressed = 0;
var settingsButtonDuration = 0;
var whiteMessageOpacity = 0.0;
var timerProblem = 0;
int descIndex = -1;
int containerSeconds = 0;
int isPressedUp = 0;
int isPressedDown = 0;
int checkVisibility = 0;
List stepsVisibility = [true, false];
var seconds = Global.slider;
List contentVisibility = [];
List lineColor = [];
bool dropButton = false;
bool desc = true;
bool descVisbility = desc;
String text = '';
bool videoButton = true;
bool settingButton = true;
var timerSeconds = 3;
Timer videoTimerVariable = Timer(Duration(seconds: 1), () {});
Timer isPressedTimer = Timer(Duration(seconds: 1), () {});
Timer timerSlide12 = Timer(Duration(seconds: 1), () {});
Timer videoTimerSlide12 =
    Timer.periodic(Duration(seconds: Global.slider), (videoTimer) {});
List serverPath = [
  'assets/server.jpeg',
  'assets/server.jpeg',
  'assets/server.jpeg',
  'assets/server.jpeg'
];
//---------------
TextEditingController pageController1 = TextEditingController()
  ..text = (indexVisibilitySlide12 + 1).toString();
Timer pageNumberTimer = Timer(Duration(seconds: seconds), () {});
Timer finishTimer =
    Timer.periodic(Duration(seconds: Global.slider), (finish) {});

class Slide12State extends State<Slide12> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 17; i++) {
      contentVisibility.add(true);
    }
    for (var i = 0; i < 6; i++) {
      lineColor.add(Colors.black);
    }
  }

  @override
  // ignore: must_call_super
  void dispose() {
    isPressedTimer.cancel();
    delayTimer.cancel();
    videoTimerVariable.cancel();
    timerSlide12.cancel();
    videoTimerSlide12.cancel();
    pageNumberTimer.cancel();
    finishTimer.cancel();
    switchOldValue = false;
    scaleEnabledOldVal = false;
    sliderOldValue = 0;
    valOldValue = 0;
    languageOldValue = true;
    isLastIndex = [false, true];
    pageController1 = TextEditingController()..text = (0).toString();
    indexVisibilitySlide12 = -1;
    keysOpacity = [0.0, 0.0];
    containerOpacity = [0.0, 0.0];
    aliceOrangeKeyPosition = [0.046, 0.003];
    aliceGreenKeyPosition = [0.008, 0.003];
    aliceKeysOpacity = [0.0, 0.0];
    certificatePosition = [0.885, 0.033];
    whiteMessagePosition = [0.875, 0.001];
    certificateOpacity = 0.0;
    delay = true;
    isPressed = false;
    messageReplacement = false;
    componentsVisibility = [false, false];
    resetVisibility = true;
    stepsVisibility = [true, false];
    settingsVideoButton = 0.13;
    settingsStopButton = 0.13;
    advancedSettingsButton = 0.13;
    backToZero = 0;
    checkSettingsDuration = 0;
    isSettingsPressed = 0;
    settingsButtonDuration = 0;
    whiteMessageOpacity = 0.0;
    descIndex = -1;
    containerSeconds = 0;
    isPressedUp = 0;
    isPressedDown = 0;
    checkVisibility = 0;
    timerProblem = 0;
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
            if (indexVisibilitySlide12 == a) {
              pageNumberTimer.cancel();
            } else {
              if (indexVisibilitySlide12 < a && delay) {
                indexVisibilitySlide12++;
                stepsVisibility[0] = !stepsVisibility[0];
                stepsVisibility[1] = !stepsVisibility[1];
                pageController1 = TextEditingController()
                  ..text = (indexVisibilitySlide12 + 1).toString();
                if (indexVisibilitySlide12 == 10) {
                  isLastIndex[0] = true;
                }
              }

              if (indexVisibilitySlide12 > -1) {
                isLastIndex[1] = false;
              }

              if (indexVisibilitySlide12 == 0) {
                componentsVisibility = [true, true];
                keysOpacity[0] = 1.0;
              } else if (indexVisibilitySlide12 == 1) {
                containerOpacity[0] = 1.0;
              } else if (indexVisibilitySlide12 == 2) {
                keysOpacity[1] = 1.0;
                containerOpacity[1] = 1.0;
              } else if (indexVisibilitySlide12 == 3) {
                whiteMessageOpacity = 1.0;
              } else if (indexVisibilitySlide12 == 4 && delay) {
                aliceKeysOpacity[0] = 1.0;
                aliceOrangeKeyPosition = [0.04, 0.085];
                delay = false;
                delayTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    aliceKeysOpacity[0] = 0.0;
                    certificateOpacity = 1.0;
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide12 == 5 && delay) {
                aliceKeysOpacity[1] = 1.0;
                aliceGreenKeyPosition = [0.04, 0.085];
                delay = false;
                delayTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide12 == 6 && delay) {
                messageReplacement = true;
                componentsVisibility = [false, false];
                aliceKeysOpacity[1] = 0.0;
                certificateOpacity = 0.0;
                whiteMessagePosition = [0.74, 0.15];
              } else if (indexVisibilitySlide12 == 7) {
                whiteMessagePosition = [0.23, 0.15];
              } else if (indexVisibilitySlide12 == 8 && delay) {
                whiteMessagePosition = [0.09, 0.01];
                aliceGreenKeyPosition = [0.0475, 0.87];
                certificatePosition = [0.1, 0.043];
                delay = false;
                delayTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    messageReplacement = false;
                    componentsVisibility = [true, true];
                    aliceKeysOpacity[1] = 1.0;
                    certificateOpacity = 1.0;
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide12 == 9 && delay) {
                aliceGreenKeyPosition = [0.215, 0.94];
                messageReplacement = true;
                componentsVisibility[0] = false;
                certificateOpacity = 0.0;
                delay = false;
                delayTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    whiteMessageOpacity = 0.0;
                    delay = true;
                  });
                });
              }

              // if (Languages.selectedLanguage) {
              //   text = DescList.slide12Desc[indexVisibilitySlide12];
              // } else {
              //   text = DescListEnglish.slide12Desc[indexVisibilitySlide12];
              // }
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

            if (indexVisibilitySlide12 < 11 && delay) {
              indexVisibilitySlide12++;
              stepsVisibility[0] = !stepsVisibility[0];
              stepsVisibility[1] = !stepsVisibility[1];
              pageController1 = TextEditingController()
                ..text = (indexVisibilitySlide12 + 1).toString();
              if (indexVisibilitySlide12 == 10) {
                isLastIndex[0] = true;
              }
            }

            if (indexVisibilitySlide12 > -1) {
              isLastIndex[1] = false;
            }

            if (indexVisibilitySlide12 == 0) {
              componentsVisibility = [true, true];
              keysOpacity[0] = 1.0;
            } else if (indexVisibilitySlide12 == 1) {
              containerOpacity[0] = 1.0;
            } else if (indexVisibilitySlide12 == 2) {
              keysOpacity[1] = 1.0;
              containerOpacity[1] = 1.0;
            } else if (indexVisibilitySlide12 == 3) {
              whiteMessageOpacity = 1.0;
            } else if (indexVisibilitySlide12 == 4 && delay) {
              aliceKeysOpacity[0] = 1.0;
              aliceOrangeKeyPosition = [0.04, 0.085];
              delay = false;
              delayTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  aliceKeysOpacity[0] = 0.0;
                  certificateOpacity = 1.0;
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide12 == 5 && delay) {
              aliceKeysOpacity[1] = 1.0;
              aliceGreenKeyPosition = [0.04, 0.085];
              delay = false;
              delayTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide12 == 6 && delay) {
              messageReplacement = true;
              componentsVisibility = [false, false];
              aliceKeysOpacity[1] = 0.0;
              certificateOpacity = 0.0;
              whiteMessagePosition = [0.74, 0.15];
            } else if (indexVisibilitySlide12 == 7) {
              whiteMessagePosition = [0.23, 0.15];
            } else if (indexVisibilitySlide12 == 8 && delay) {
              whiteMessagePosition = [0.09, 0.01];
              aliceGreenKeyPosition = [0.0475, 0.87];
              certificatePosition = [0.1, 0.043];
              delay = false;
              delayTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  messageReplacement = false;
                  componentsVisibility = [true, true];
                  aliceKeysOpacity[1] = 1.0;
                  certificateOpacity = 1.0;
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide12 == 9 && delay) {
              aliceGreenKeyPosition = [0.215, 0.94];
              messageReplacement = true;
              componentsVisibility[0] = false;
              certificateOpacity = 0.0;
              delay = false;
              delayTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  whiteMessageOpacity = 0.0;
                  delay = true;
                });
              });
            }

            // if (Languages.selectedLanguage) {
            //   text = DescList.slide12Desc[indexVisibilitySlide12];
            // } else {
            //   text = DescListEnglish.slide12Desc[indexVisibilitySlide12];
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
            true,
            serverPath[0],
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

          // Alice-Green-Key
          Visibility(
            visible: resetVisibility,
            child: MyPositioned(
              false,
              true,
              false,
              false,
              0.008,
              0.0,
              0.0,
              0.003,
              0.04,
              0.04,
              true,
              'assets/alice-green-key.jpeg',
              BoxFit.fill,
              seconds,
              HomePageE2EEState.returnAppBar[1],
              keysOpacity[0],
            ),
          ),

          // Alice-orange-Key
          Visibility(
            visible: resetVisibility,
            child: MyPositioned(
              false,
              true,
              false,
              false,
              0.046,
              0.0,
              0.0,
              0.003,
              0.04,
              0.04,
              true,
              'assets/alice-orange-key.jpeg',
              BoxFit.fill,
              seconds,
              HomePageE2EEState.returnAppBar[1],
              keysOpacity[0],
            ),
          ),

          // Bob-Green-Key
          Visibility(
            visible: resetVisibility,
            child: MyPositioned(
              true,
              false,
              false,
              false,
              0.008,
              0.003,
              0.0,
              0.0,
              0.04,
              0.04,
              true,
              'assets/alice-green-key.jpeg',
              BoxFit.fill,
              seconds,
              HomePageE2EEState.returnAppBar[1],
              keysOpacity[1],
            ),
          ),

          // Bob-orange-Key
          Visibility(
            visible: resetVisibility,
            child: MyPositioned(
              true,
              false,
              false,
              false,
              0.046,
              0.003,
              0.0,
              0.0,
              0.04,
              0.04,
              true,
              'assets/alice-orange-key.jpeg',
              BoxFit.fill,
              seconds,
              HomePageE2EEState.returnAppBar[1],
              keysOpacity[1],
            ),
          ),

          // Alice-Container
          Visibility(
            visible: resetVisibility,
            child: MyPositioned(
              false,
              true,
              false,
              false,
              0.2,
              0.0,
              0.0,
              0.01,
              0.1,
              0.3,
              true,
              'assets/alice-container.jpeg',
              BoxFit.fill,
              seconds,
              HomePageE2EEState.returnAppBar[1],
              containerOpacity[0],
            ),
          ),

          // Bob-Container
          Visibility(
            visible: resetVisibility,
            child: MyPositioned(
              true,
              false,
              false,
              false,
              0.2,
              0.01,
              0.0,
              0.0,
              0.1,
              0.3,
              true,
              'assets/bob-container.jpeg',
              BoxFit.fill,
              seconds,
              HomePageE2EEState.returnAppBar[1],
              containerOpacity[1],
            ),
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
          MyLine(true, 0.08, 0.14, 0.198, 0.28, seconds, Colors.black),

          // Line between middle-left and middle-right
          MyLine(contentVisibility[0], 0.28, 0.28, 0.72, 0.28, seconds,
              lineColor[1]),

          // Line between top-right and middle right
          MyLine(true, 0.78, 0.229, 0.92, 0.14, seconds, Colors.black),

          // Line between top-right and bottom-right
          MyLine(true, 0.72, 0.5, 0.92, 0.14, seconds, Colors.black),

          // Line between down-left and bottom-right
          MyLine(contentVisibility[0], 0.36, 0.65, 0.67, 0.55, seconds,
              lineColor[1]),

          // Line between middle-left and bottom-left
          MyLine(contentVisibility[0], 0.25, 0.34, 0.31, 0.6, seconds,
              lineColor[1]),

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

          // The White Message
          Visibility(
            visible: resetVisibility,
            child: AnimatedPositioned(
              top: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  whiteMessagePosition[1],
              right:
                  MediaQuery.of(context).size.width * whiteMessagePosition[0],
              width: MediaQuery.of(context).size.width * 0.04,
              height: MediaQuery.of(context).size.height * 0.1,
              duration: Duration(seconds: seconds),
              child: AnimatedOpacity(
                opacity: whiteMessageOpacity,
                duration: Duration(seconds: seconds == 0 ? 0 : 1),
                child: messageReplacement == false
                    ? Image.asset('assets/white-message.jpeg')
                    : Image.asset('assets/message-key.jpeg'),
              ),
            ),
          ),

          // Alice-Orange-Key-Animated
          Visibility(
            visible: resetVisibility,
            child: AnimatedPositioned(
              top: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  aliceOrangeKeyPosition[0],
              left:
                  MediaQuery.of(context).size.width * aliceOrangeKeyPosition[1],
              width: MediaQuery.of(context).size.width * 0.04,
              height: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  0.04,
              duration: Duration(seconds: seconds),
              child: Container(
                child: AnimatedOpacity(
                  opacity: aliceKeysOpacity[0],
                  duration: Duration(seconds: seconds == 0 ? 0 : 1),
                  child: Image.asset(
                    'assets/alice-orange-key.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),

          //Certification
          Visibility(
            visible: componentsVisibility[0],
            child: AnimatedPositioned(
              top: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  certificatePosition[1],
              right: MediaQuery.of(context).size.width * certificatePosition[0],
              width: MediaQuery.of(context).size.width * 0.02,
              height: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  0.05,
              duration: Duration(seconds: seconds),
              child: AnimatedOpacity(
                opacity: certificateOpacity,
                duration: Duration(seconds: seconds == 0 ? 0 : 1),
                child: Image.asset('assets/certificate.jpeg'),
              ),
            ),
          ),

          // Alice-Green-Key-Animated
          Visibility(
            visible: componentsVisibility[1],
            child: AnimatedPositioned(
              top: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  aliceGreenKeyPosition[0],
              left:
                  MediaQuery.of(context).size.width * aliceGreenKeyPosition[1],
              width: MediaQuery.of(context).size.width * 0.04,
              height: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  0.04,
              duration: Duration(seconds: isPressed == true ? seconds : 0),
              child: Container(
                child: AnimatedOpacity(
                  opacity: aliceKeysOpacity[1],
                  duration: Duration(seconds: seconds == 0 ? 0 : 1),
                  child: Image.asset(
                    'assets/alice-green-key.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
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
              heroTag: "right12",
              onPressed: () => setState(
                () {
                  videoTimerSlide12.cancel();
                  videoButton = true;
                  seconds = Global.slider;
                  isPressedTimer.cancel();
                  isPressed = true;
                  isPressedTimer = Timer(Duration(seconds: seconds), () {
                    setState(() {
                      isPressed = false;
                    });
                  });

                  if (isLastIndex[0]) {
                    openDialog(false);
                  }

                  if (indexVisibilitySlide12 < 11 && delay) {
                    indexVisibilitySlide12++;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide12 + 1).toString();
                    if (indexVisibilitySlide12 == 10) {
                      isLastIndex[0] = true;
                    }
                  }

                  if (indexVisibilitySlide12 > -1) {
                    isLastIndex[1] = false;
                  }

                  if (indexVisibilitySlide12 == 0) {
                    componentsVisibility = [true, true];
                    keysOpacity[0] = 1.0;
                  } else if (indexVisibilitySlide12 == 1) {
                    containerOpacity[0] = 1.0;
                  } else if (indexVisibilitySlide12 == 2) {
                    keysOpacity[1] = 1.0;
                    containerOpacity[1] = 1.0;
                  } else if (indexVisibilitySlide12 == 3) {
                    whiteMessageOpacity = 1.0;
                  } else if (indexVisibilitySlide12 == 4 && delay) {
                    aliceKeysOpacity[0] = 1.0;
                    aliceOrangeKeyPosition = [0.04, 0.085];
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        aliceKeysOpacity[0] = 0.0;
                        certificateOpacity = 1.0;
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide12 == 5 && delay) {
                    aliceKeysOpacity[1] = 1.0;
                    aliceGreenKeyPosition = [0.04, 0.085];
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide12 == 6 && delay) {
                    messageReplacement = true;
                    componentsVisibility = [false, false];
                    aliceKeysOpacity[1] = 0.0;
                    certificateOpacity = 0.0;
                    whiteMessagePosition = [0.74, 0.15];
                  } else if (indexVisibilitySlide12 == 7) {
                    whiteMessagePosition = [0.23, 0.15];
                  } else if (indexVisibilitySlide12 == 8 && delay) {
                    whiteMessagePosition = [0.09, 0.01];
                    aliceGreenKeyPosition = [0.0475, 0.87];
                    certificatePosition = [0.1, 0.043];
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        messageReplacement = false;
                        componentsVisibility = [true, true];
                        aliceKeysOpacity[1] = 1.0;
                        certificateOpacity = 1.0;
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide12 == 9 && delay) {
                    aliceGreenKeyPosition = [0.215, 0.94];
                    messageReplacement = true;
                    componentsVisibility[0] = false;
                    certificateOpacity = 0.0;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        whiteMessageOpacity = 0.0;
                        delay = true;
                      });
                    });
                  }

                  // if (Languages.selectedLanguage) {
                  //   text = DescList.slide12Desc[indexVisibilitySlide12];
                  // } else {
                  //   text = DescListEnglish.slide12Desc[indexVisibilitySlide12];
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
              heroTag: "left12",
              onPressed: () => setState(
                () {
                  isPressed = true;

                  videoTimerSlide12.cancel();
                  videoButton = true;

                  seconds = Global.slider;
                  isPressedTimer.cancel();

                  isPressedTimer = Timer(Duration(seconds: seconds), () {
                    setState(() {
                      isPressed = false;
                    });
                  });
                  if (isLastIndex[1]) {
                    openDialog(true);
                  }
                  if (indexVisibilitySlide12 == 0) {
                    keysOpacity[0] = 0.0;
                    indexVisibilitySlide12--;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide12 + 1).toString();
                    isLastIndex[1] = true;
                  } else if (indexVisibilitySlide12 == 1) {
                    containerOpacity[0] = 0.0;
                  } else if (indexVisibilitySlide12 == 2) {
                    keysOpacity[1] = 0.0;
                    containerOpacity[1] = 0.0;
                  } else if (indexVisibilitySlide12 == 3) {
                    whiteMessageOpacity = 0.0;
                  } else if (indexVisibilitySlide12 == 4 && delay) {
                    certificateOpacity = 0.0;
                    aliceKeysOpacity[0] = 1.0;
                    aliceOrangeKeyPosition = [0.046, 0.003];
                    delay = false;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        indexVisibilitySlide12--;
                        pageController1 = TextEditingController()
                          ..text = (indexVisibilitySlide12 + 1).toString();
                        // if (Languages.selectedLanguage)
                        //   text = DescList.slide12Desc[indexVisibilitySlide12];
                        // else
                        //   text = DescListEnglish
                        //       .slide12Desc[indexVisibilitySlide12];
                        aliceKeysOpacity[0] = 0.0;

                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide12 == 5 && delay) {
                    aliceGreenKeyPosition = [0.008, 0.003];
                    delay = false;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        indexVisibilitySlide12--;
                        pageController1 = TextEditingController()
                          ..text = (indexVisibilitySlide12 + 1).toString();
                        // if (Languages.selectedLanguage)
                        //   text = DescList.slide12Desc[indexVisibilitySlide12];
                        // else
                        //   text = DescListEnglish
                        //       .slide12Desc[indexVisibilitySlide12];
                        aliceKeysOpacity[1] = 0.0;
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide12 == 6 && delay) {
                    whiteMessagePosition = [0.875, 0.001];
                    delay = false;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        indexVisibilitySlide12--;
                        pageController1 = TextEditingController()
                          ..text = (indexVisibilitySlide12 + 1).toString();
                        // if (Languages.selectedLanguage)
                        //   text = DescList.slide12Desc[indexVisibilitySlide12];
                        // else
                        //   text = DescListEnglish
                        //       .slide12Desc[indexVisibilitySlide12];
                        messageReplacement = false;
                        componentsVisibility = [true, true];
                        aliceKeysOpacity[1] = 1.0;
                        certificateOpacity = 1.0;
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide12 == 7) {
                    whiteMessagePosition = [0.74, 0.15];
                  } else if (indexVisibilitySlide12 == 8 && delay) {
                    whiteMessagePosition = [0.23, 0.15];
                    componentsVisibility = [false, false];
                    messageReplacement = true;
                    aliceKeysOpacity[1] = 0.0;
                    certificateOpacity = 0.0;
                    aliceGreenKeyPosition = [0.04, 0.085];
                    certificatePosition = [0.885, 0.033];
                    delay = false;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        indexVisibilitySlide12--;
                        pageController1 = TextEditingController()
                          ..text = (indexVisibilitySlide12 + 1).toString();

                        // if (Languages.selectedLanguage)
                        //   text = DescList.slide12Desc[indexVisibilitySlide12];
                        // else
                        //   text = DescListEnglish
                        //       .slide12Desc[indexVisibilitySlide12];
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide12 == 9 && delay) {
                    whiteMessageOpacity = 1.0;
                    aliceGreenKeyPosition = [0.0475, 0.87];
                    messageReplacement = true;
                    componentsVisibility[0] = false;
                    certificateOpacity = 0.0;
                    delay = false;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        indexVisibilitySlide12--;
                        pageController1 = TextEditingController()
                          ..text = (indexVisibilitySlide12 + 1).toString();
                        // if (Languages.selectedLanguage)
                        //   text = DescList.slide12Desc[indexVisibilitySlide12];
                        // else
                        //   text = DescListEnglish
                        //       .slide12Desc[indexVisibilitySlide12];

                        delay = true;
                      });
                    });
                  }

                  if (indexVisibilitySlide12 > 0 && delay) {
                    if (indexVisibilitySlide12 == 0) {
                      delay = false;
                    }
                    indexVisibilitySlide12--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide12 + 1).toString();
                    isLastIndex[0] = false;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    // if (Languages.selectedLanguage)
                    //   text = DescList.slide12Desc[indexVisibilitySlide12];
                    // else
                    //   text =
                    //       DescListEnglish.slide12Desc[indexVisibilitySlide12];
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
              heroTag: "middle12",
              onPressed: () => setState(
                () {
                  isPressedUp = 1;
                  isPressedDown = 2;

                  dropButton = !dropButton;
                  containerSeconds = 2;
                  desc = !desc;
                  timerSlide12 = Timer(
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
                                              videoTimerSlide12.cancel();
                                              videoTimerSlide12 =
                                                  videoTimerProblem();
                                            }
                                          } else if (Global.val == 3) {
                                            Global.slider = Global.val - 2;
                                            if (!videoButton) {
                                              videoTimerSlide12.cancel();
                                              videoTimerSlide12 =
                                                  videoTimerProblem();
                                            }
                                          } else {
                                            Global.slider = Global.val;
                                            if (!videoButton) {
                                              videoTimerSlide12.cancel();
                                              videoTimerSlide12 =
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
              heroTag: "stop12",
              backgroundColor: Colors.red,
              onPressed: () => setState(
                () {
                  Global.replacedSliderValue = Global.slider;
                  isPressedTimer.cancel();
                  delayTimer.cancel();
                  videoTimerVariable.cancel();
                  timerSlide12.cancel();
                  videoTimerSlide12.cancel();
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
                  indexVisibilitySlide12 = -1;
                  keysOpacity = [0.0, 0.0];
                  containerOpacity = [0.0, 0.0];
                  aliceOrangeKeyPosition = [0.046, 0.003];
                  aliceGreenKeyPosition = [0.008, 0.003];
                  aliceKeysOpacity = [0.0, 0.0];
                  certificatePosition = [0.885, 0.033];
                  whiteMessagePosition = [0.875, 0.001];
                  certificateOpacity = 0.0;
                  delay = true;
                  isPressed = false;
                  messageReplacement = false;
                  componentsVisibility = [false, false];
                  resetVisibility = false;
                  stepsVisibility = [true, false];
                  backToZero = 0;
                  checkSettingsDuration = 0;
                  isSettingsPressed = 0;
                  settingsButtonDuration = 0;
                  whiteMessageOpacity = 0.0;
                  descIndex = -1;
                  containerSeconds = 0;
                  isPressedUp = 0;
                  isPressedDown = 0;
                  checkVisibility = 0;
                  timerProblem = 0;
                  Global.slider = 0;
                  seconds = Global.slider;
                  dropButton = false;
                  desc = true;
                  descVisbility = desc;
                  text = '';
                  videoButton = true;
                  timerSeconds = 3;
                  if (indexVisibilitySlide12 == -1)
                    delayTimer = Timer(Duration(milliseconds: 50), () {
                      setState(() {
                        resetVisibility = true;
                        Global.slider = Global.replacedSliderValue;
                        seconds = Global.slider;
                        delayTimer.cancel();
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
              heroTag: "play12",
              backgroundColor: Colors.green,
              onPressed: () => setState(
                () {
                  isPressed = true;
                  desc = true;
                  descVisbility = desc;
                  dropButton = false;
                  videoButton = !videoButton;
                  if (!videoButton) {
                    videoTimerSlide12 = videoTimerProblem();
                  } else
                    videoTimerSlide12.cancel();
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
              heroTag: "more12",
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

                  timerSlide12 = Timer(
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
                    '${indexVisibilitySlide12 + 1} / 11',
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
                  videoTimerSlide12.cancel();
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
                if (indexVisibilitySlide12 != -1) {
                  pageController1 = TextEditingController()
                    ..text = (indexVisibilitySlide12).toString();
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
      finishTimer = Timer.periodic(const Duration(milliseconds: 51), (finish) {
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
      isPressedTimer.cancel();
      delayTimer.cancel();
      videoTimerVariable.cancel();
      timerSlide12.cancel();
      videoTimerSlide12.cancel();
      switchOldValue = false;
      scaleEnabledOldVal = false;
      sliderOldValue = 0;
      valOldValue = 0;
      languageOldValue = true;
      isLastIndex = [false, true];
      indexVisibilitySlide12 = -1;
      keysOpacity = [0.0, 0.0];
      containerOpacity = [0.0, 0.0];
      aliceOrangeKeyPosition = [0.046, 0.003];
      aliceGreenKeyPosition = [0.008, 0.003];
      aliceKeysOpacity = [0.0, 0.0];
      certificatePosition = [0.885, 0.033];
      whiteMessagePosition = [0.875, 0.001];
      certificateOpacity = 0.0;
      delay = true;
      isPressed = false;
      messageReplacement = false;
      componentsVisibility = [false, false];
      resetVisibility = false;
      stepsVisibility = [true, false];
      backToZero = 0;
      checkSettingsDuration = 0;
      isSettingsPressed = 0;
      settingsButtonDuration = 0;
      whiteMessageOpacity = 0.0;
      descIndex = -1;
      containerSeconds = 0;
      isPressedUp = 0;
      isPressedDown = 0;
      checkVisibility = 0;
      timerProblem = 0;
      Global.slider = 0;
      seconds = Global.slider;
      dropButton = false;
      desc = true;
      descVisbility = desc;
      text = '';
      videoButton = true;
      timerSeconds = 3;
      if (indexVisibilitySlide12 == -1)
        delayTimer = Timer(Duration(milliseconds: 50), () {
          setState(() {
            resetVisibility = true;
            Global.slider = Global.replacedSliderValue;
            seconds = Global.slider;
            delayTimer.cancel();
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
