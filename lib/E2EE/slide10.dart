import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Main/global.dart';
import '../Main/language-provider.dart';
import '../main.dart';
import 'description-widget.dart';
import 'home-page-E2EE.dart';
import 'positioned-widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Slide10 extends StatefulWidget {
  const Slide10({super.key});

  @override
  Slide10State createState() => Slide10State();
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
var indexVisibilitySlide10 = -1;
Color containerBorder = Colors.black;
Color containerbackground = Colors.transparent;
int checkVisibility = 0;
bool delay = true;
bool aliceOrangeKeyVisibility = false;
List aliceOrangeKeyPosition = [0.45, 0.08]; // top-left
List aliceGreenKeyPosition = [0.35, 0.08]; // top-left
List bobOrangeKeyPosition = [0.45, 0.09]; // top-right
List bobGreenKeyPosition = [0.35, 0.09]; // top-right
List messagePosition = [0.6, 0.23];
List bobMessagePosition = [0.6, 0.67]; // top-left
List cloudsOpacity = [0.0, 0.0];
List pointsOpacity = [0.0, 0.0]; // Alice index 0, Bob index 1
List aliceKeysOpacity = [0.0, 0.0]; // orange index 0, green index 1
List bobKeysOpacity = [0.0, 0.0]; // orange index 0, green index 1
bool greyMessageVisibility = true;
bool certificateVisibility = true;
bool resetVisibility = true;
String dropdownValue = 'Deutsch';
var settingsVideoButton = 0.13;
var settingsStopButton = 0.13;
var advancedSettingsButton = 0.13;
var backToZero = 0;
var checkSettingsDuration = 0;
var isSettingsPressed = 0;
var settingsButtonDuration = 0;
int descIndex = -1;
int containerSeconds = 0;
int isPressedUp = 0;
int isPressedDown = 0;
var timerProblem = 0;
List stepsVisibility = [true, false];
var seconds = Global.slider;
bool dropButton = false;
bool desc = true;
bool descVisbility = desc;
String text = '';
bool videoButton = true;
bool settingButton = true;
var timerSeconds = 3;
Timer delayTimer = Timer(Duration(seconds: 1), () {});
Timer videoTimerVariable = Timer(Duration(seconds: 1), () {});
Timer timerSlide10 = Timer(Duration(seconds: 1), () {});
Timer videoTimerSlide10 =
    Timer.periodic(Duration(seconds: Global.slider), (videoTimer) {});
//---------------
TextEditingController pageController1 = TextEditingController()
  ..text = (indexVisibilitySlide10 + 1).toString();
Timer pageNumberTimer = Timer(Duration(seconds: seconds), () {});
Timer finishTimer =
    Timer.periodic(Duration(seconds: Global.slider), (finish) {});

class Slide10State extends State<Slide10> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  // ignore: must_call_super
  void dispose() {
    delayTimer.cancel();
    videoTimerVariable.cancel();
    timerSlide10.cancel();
    videoTimerSlide10.cancel();
    pageNumberTimer.cancel();
    finishTimer.cancel();
    switchOldValue = false;
    scaleEnabledOldVal = false;
    sliderOldValue = 0;
    valOldValue = 0;
    languageOldValue = true;
    isLastIndex = [false, true];
    pageController1 = TextEditingController()..text = (0).toString();
    indexVisibilitySlide10 = -1;
    containerBorder = Colors.black;
    containerbackground = Colors.transparent;
    checkVisibility = 0;
    delay = true;
    resetVisibility = true;
    aliceOrangeKeyVisibility = false;
    aliceOrangeKeyPosition = [0.45, 0.08];
    aliceGreenKeyPosition = [0.35, 0.08];
    bobOrangeKeyPosition = [0.45, 0.09];
    bobGreenKeyPosition = [0.35, 0.09];
    messagePosition = [0.6, 0.23];
    bobMessagePosition = [0.6, 0.67];
    cloudsOpacity = [0.0, 0.0];
    pointsOpacity = [0.0, 0.0];
    aliceKeysOpacity = [0.0, 0.0];
    bobKeysOpacity = [0.0, 0.0];
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
    descIndex = -1;
    containerSeconds = 0;
    isPressedUp = 0;
    isPressedDown = 0;
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
            if (indexVisibilitySlide10 == a) {
              pageNumberTimer.cancel();
            } else {
              if (indexVisibilitySlide10 < a && delay) {
                indexVisibilitySlide10++;
                stepsVisibility[0] = !stepsVisibility[0];
                stepsVisibility[1] = !stepsVisibility[1];
                pageController1 = TextEditingController()
                  ..text = (indexVisibilitySlide10 + 1).toString();
                if (indexVisibilitySlide10 == 10) {
                  isLastIndex[0] = true;
                }
              }
              if (indexVisibilitySlide10 > -1) {
                isLastIndex[1] = false;
              }
              if (indexVisibilitySlide10 == 0) {
                cloudsOpacity[0] = 1.0;
                pointsOpacity[0] = 1.0;
              } else if (indexVisibilitySlide10 == 1 && delay) {
                aliceKeysOpacity[0] = 1.0;
                aliceOrangeKeyPosition[1] = 0.23;
                delay = false;
                delayTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide10 == 2 && delay) {
                aliceOrangeKeyPosition[0] = 0.6;
                delayTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    aliceKeysOpacity[0] = 0.0;
                    containerBorder = Colors.orange;
                  });
                });
                delay = false;
                delayTimer = Timer(Duration(seconds: 0), () {
                  setState(() {
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide10 == 3 && delay) {
                bobKeysOpacity[1] = 1.0;
                bobGreenKeyPosition[1] = 0.67;
                delay = false;
                delayTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide10 == 4 && delay) {
                bobGreenKeyPosition[0] = 0.6;
                delay = false;
                delayTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    bobKeysOpacity[1] = 0.0;
                    containerbackground = Colors.green;
                  });
                });
                delayTimer = Timer(Duration(seconds: 0), () {
                  setState(() {
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide10 == 5 && delay) {
                messagePosition[1] = 0.67;
                cloudsOpacity[0] = 0.0;
                pointsOpacity[0] = 0.0;
                delay = false;
                delayTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    cloudsOpacity[1] = 1.0;
                    pointsOpacity[1] = 1.0;
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide10 == 6 && delay) {
                bobKeysOpacity[0] = 1.0;
                bobOrangeKeyPosition[1] = 0.23;
                delay = false;
                delayTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    aliceKeysOpacity[1] = 0.0;
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide10 == 7 && delay) {
                bobOrangeKeyPosition[0] = 0.6;
                delay = false;
                delayTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    bobKeysOpacity[0] = 0.0;
                    containerbackground = Colors.transparent;
                  });
                });
                delayTimer = Timer(Duration(seconds: 0), () {
                  setState(() {
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide10 == 8 && delay) {
                aliceKeysOpacity[1] = 1.0;
                aliceGreenKeyPosition[1] = 0.67;
                delay = false;

                delayTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide10 == 9 && delay) {
                aliceGreenKeyPosition[0] = 0.6;
                delay = false;
                delayTimer = Timer(Duration(seconds: seconds), () {
                  setState(() {
                    aliceKeysOpacity[1] = 0.0;
                    containerBorder = Colors.black;
                  });
                });
                delayTimer = Timer(Duration(seconds: 0), () {
                  setState(() {
                    delay = true;
                  });
                });
              } else if (indexVisibilitySlide10 == 10) {
                pointsOpacity[1] = 0.0;
                cloudsOpacity[1] = 0.0;
              }
              // if (Languages.selectedLanguage) {
              //   text = DescList.slide10Desc[indexVisibilitySlide10];
              // } else {
              //   text = DescListEnglish.slide10Desc[indexVisibilitySlide10];
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

            if (indexVisibilitySlide10 < 10 && delay) {
              indexVisibilitySlide10++;
              stepsVisibility[0] = !stepsVisibility[0];
              stepsVisibility[1] = !stepsVisibility[1];
              pageController1 = TextEditingController()
                ..text = (indexVisibilitySlide10 + 1).toString();
              if (indexVisibilitySlide10 == 10) {
                isLastIndex[0] = true;
              }
            }
            if (indexVisibilitySlide10 > -1) {
              isLastIndex[1] = false;
            }
            if (indexVisibilitySlide10 == 0) {
              cloudsOpacity[0] = 1.0;
              pointsOpacity[0] = 1.0;
            } else if (indexVisibilitySlide10 == 1 && delay) {
              aliceKeysOpacity[0] = 1.0;
              aliceOrangeKeyPosition[1] = 0.23;
              delay = false;
              delayTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide10 == 2 && delay) {
              aliceOrangeKeyPosition[0] = 0.6;
              delayTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  aliceKeysOpacity[0] = 0.0;
                  containerBorder = Colors.orange;
                });
              });
              delay = false;
              delayTimer = Timer(Duration(seconds: seconds + 1), () {
                setState(() {
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide10 == 3 && delay) {
              bobKeysOpacity[1] = 1.0;
              bobGreenKeyPosition[1] = 0.67;
              delay = false;
              delayTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide10 == 4 && delay) {
              bobGreenKeyPosition[0] = 0.6;
              delay = false;
              delayTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  bobKeysOpacity[1] = 0.0;
                  containerbackground = Colors.green;
                });
              });
              delayTimer = Timer(Duration(seconds: seconds + 1), () {
                setState(() {
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide10 == 5 && delay) {
              messagePosition[1] = 0.67;
              cloudsOpacity[0] = 0.0;
              pointsOpacity[0] = 0.0;
              delay = false;
              delayTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  cloudsOpacity[1] = 1.0;
                  pointsOpacity[1] = 1.0;
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide10 == 6 && delay) {
              bobKeysOpacity[0] = 1.0;
              bobOrangeKeyPosition[1] = 0.23;
              delay = false;
              delayTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  aliceKeysOpacity[1] = 0.0;
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide10 == 7 && delay) {
              bobOrangeKeyPosition[0] = 0.6;
              delay = false;
              delayTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  bobKeysOpacity[0] = 0.0;
                  containerbackground = Colors.transparent;
                });
              });
              delayTimer = Timer(Duration(seconds: seconds + 1), () {
                setState(() {
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide10 == 8 && delay) {
              aliceKeysOpacity[1] = 1.0;
              aliceGreenKeyPosition[1] = 0.67;
              delay = false;

              delayTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide10 == 9 && delay) {
              aliceGreenKeyPosition[0] = 0.6;
              delay = false;
              delayTimer = Timer(Duration(seconds: seconds), () {
                setState(() {
                  aliceKeysOpacity[1] = 0.0;
                  containerBorder = Colors.black;
                });
              });
              delayTimer = Timer(Duration(seconds: seconds + 1), () {
                setState(() {
                  delay = true;
                });
              });
            } else if (indexVisibilitySlide10 == 10) {
              pointsOpacity[1] = 0.0;
              cloudsOpacity[1] = 0.0;
            }
            // if (Languages.selectedLanguage) {
            //   text = DescList.slide10Desc[indexVisibilitySlide10];
            // } else {
            //   text = DescListEnglish.slide10Desc[indexVisibilitySlide10];
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
          // ALice-Image Position
          MyPositioned(
            false,
            true,
            false,
            false,
            0.55,
            0.0,
            0.0,
            0.08,
            0.1,
            0.2,
            true,
            'assets/alice9.jpeg',
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
            0.55,
            0.1,
            0.0,
            0.0,
            0.08,
            0.2,
            true,
            'assets/bob9.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // Alice-Orange-Key
          MyPositioned(
            false,
            true,
            false,
            false,
            0.45,
            0.0,
            0.0,
            0.08,
            0.1,
            0.1,
            true,
            'assets/alice-orange-key.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
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
              width: MediaQuery.of(context).size.width * 0.1,
              height: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  0.1,
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

          // Alice-Green-Key
          MyPositioned(
            false,
            true,
            false,
            false,
            0.35,
            0.0,
            0.0,
            0.08,
            0.1,
            0.1,
            true,
            'assets/alice-green-key.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // Alice-Green-Key-Animated
          Visibility(
            visible: resetVisibility,
            child: AnimatedPositioned(
              top: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  aliceGreenKeyPosition[0],
              left:
                  MediaQuery.of(context).size.width * aliceGreenKeyPosition[1],
              width: MediaQuery.of(context).size.width * 0.1,
              height: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  0.1,
              duration: Duration(seconds: seconds),
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

          // Bob-Orange-Key
          MyPositioned(
            true,
            false,
            false,
            false,
            0.45,
            0.09,
            0.0,
            0.0,
            0.1,
            0.1,
            true,
            'assets/bob-orange-key.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // Bob-Green-Key
          MyPositioned(
            true,
            false,
            false,
            false,
            0.35,
            0.09,
            0.0,
            0.0,
            0.1,
            0.1,
            true,
            'assets/bob-green-key.jpeg',
            BoxFit.fill,
            seconds,
            HomePageE2EEState.returnAppBar[1],
            1.0,
          ),

          // Bob-Green-Key-Animated
          Visibility(
            visible: resetVisibility,
            child: AnimatedPositioned(
              top: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  bobGreenKeyPosition[0],
              right: MediaQuery.of(context).size.width * bobGreenKeyPosition[1],
              width: MediaQuery.of(context).size.width * 0.1,
              height: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  0.1,
              duration: Duration(seconds: seconds),
              child: Container(
                child: AnimatedOpacity(
                  opacity: bobKeysOpacity[1],
                  duration: Duration(seconds: seconds == 0 ? 0 : 1),
                  child: Image.asset(
                    'assets/bob-green-key.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),

          // Nachricht-Container
          AnimatedPositioned(
            top: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                messagePosition[0],
            left: MediaQuery.of(context).size.width * messagePosition[1],
            duration: Duration(seconds: seconds),
            child: AnimatedContainer(
              duration: Duration(seconds: seconds == 0 ? 0 : 1),
              width: MediaQuery.of(context).size.width * 0.1,
              height: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  0.1,
              decoration: BoxDecoration(
                color: containerbackground,
                border: Border.all(
                  color: containerBorder,
                ),
              ),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'test',
                    // context.watch<LanguageProvider>().selectedLanguage == true
                    //     ? 'Nachricht'
                    //     : 'Message',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bob-Orange-Key-Animated
          Visibility(
            visible: resetVisibility,
            child: AnimatedPositioned(
              top: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  bobOrangeKeyPosition[0],
              right:
                  MediaQuery.of(context).size.width * bobOrangeKeyPosition[1],
              width: MediaQuery.of(context).size.width * 0.1,
              height: (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  0.1,
              duration: Duration(seconds: seconds),
              child: Container(
                child: AnimatedOpacity(
                  opacity: bobKeysOpacity[0],
                  duration: Duration(seconds: seconds == 0 ? 0 : 1),
                  child: Image.asset(
                    'assets/bob-orange-key.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),

          // Alice-Cloud-Text1
          Visibility(
            visible: resetVisibility,
            child: MyPositioned(
              false,
              true,
              false,
              false,
              0.05,
              0.0,
              0.0,
              0.18,
              0.3,
              0.3,
              true,
              'assets/alice-cloud-english.jpeg',
              // context.watch<LanguageProvider>().selectedLanguage == true
              //     ? 'assets/alice-cloud.jpeg'
              //     : 'assets/alice-cloud-english.jpeg',
              BoxFit.fill,
              seconds,
              HomePageE2EEState.returnAppBar[1],
              cloudsOpacity[0],
            ),
          ),

          // Alice-Cloud-Points
          Visibility(
            visible: resetVisibility,
            child: MyPositioned(
              false,
              true,
              false,
              false,
              0.33,
              0.0,
              0.0,
              0.1,
              0.2,
              0.2,
              true,
              'assets/alice-points.jpeg',
              BoxFit.fill,
              seconds,
              HomePageE2EEState.returnAppBar[1],
              pointsOpacity[0],
            ),
          ),

          // Bob-Cloud-Text1
          Visibility(
            visible: resetVisibility,
            child: MyPositioned(
              false,
              true,
              false,
              false,
              0.05,
              0.0,
              0.0,
              0.55,
              0.3,
              0.3,
              true,
              'assets/bob-cloud-english.jpeg',
              // context.watch<LanguageProvider>().selectedLanguage == true
              //     ? 'assets/bob-cloud.jpeg'
              //     : 'assets/bob-cloud-english.jpeg',
              BoxFit.fill,
              seconds,
              HomePageE2EEState.returnAppBar[1],
              cloudsOpacity[1],
            ),
          ),

          // Bob-Cloud-Points
          Visibility(
            visible: resetVisibility,
            child: MyPositioned(
              true,
              false,
              false,
              false,
              0.35,
              0.2,
              0.0,
              0.0,
              0.2,
              0.2,
              true,
              'assets/bob-points.jpeg',
              BoxFit.fill,
              seconds,
              HomePageE2EEState.returnAppBar[1],
              pointsOpacity[1],
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

          // description
          Description(desc, text, descVisbility, containerSeconds,
              HomePageE2EEState.returnAppBar[1], false),

          // Right-Button
          Positioned(
            right: MediaQuery.of(context).size.width * 0.01,
            bottom: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            child: FloatingActionButton(
              backgroundColor: isLastIndex[0] ? Colors.grey : Colors.blue,
              heroTag: "right10",
              onPressed: () => setState(
                () {
                  if (videoButton == false) {
                    videoTimerSlide10.cancel();
                  }
                  videoButton = true;
                  seconds = Global.slider;

                  if (isLastIndex[0]) {
                    openDialog(false);
                  }

                  if (indexVisibilitySlide10 < 10 && delay) {
                    indexVisibilitySlide10++;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide10 + 1).toString();
                    if (indexVisibilitySlide10 == 10) {
                      isLastIndex[0] = true;
                    }
                  }
                  if (indexVisibilitySlide10 > -1) {
                    isLastIndex[1] = false;
                  }
                  if (indexVisibilitySlide10 == 0) {
                    cloudsOpacity[0] = 1.0;
                    pointsOpacity[0] = 1.0;
                  } else if (indexVisibilitySlide10 == 1 && delay) {
                    aliceKeysOpacity[0] = 1.0;
                    aliceOrangeKeyPosition[1] = 0.23;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 2 && delay) {
                    aliceOrangeKeyPosition[0] = 0.6;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        aliceKeysOpacity[0] = 0.0;
                        containerBorder = Colors.orange;
                      });
                    });
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds + 1), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 3 && delay) {
                    bobKeysOpacity[1] = 1.0;
                    bobGreenKeyPosition[1] = 0.67;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 4 && delay) {
                    bobGreenKeyPosition[0] = 0.6;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        bobKeysOpacity[1] = 0.0;
                        containerbackground = Colors.green;
                      });
                    });
                    delayTimer = Timer(Duration(seconds: seconds + 1), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 5 && delay) {
                    messagePosition[1] = 0.67;
                    cloudsOpacity[0] = 0.0;
                    pointsOpacity[0] = 0.0;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        cloudsOpacity[1] = 1.0;
                        pointsOpacity[1] = 1.0;
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 6 && delay) {
                    bobKeysOpacity[0] = 1.0;
                    bobOrangeKeyPosition[1] = 0.23;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        aliceKeysOpacity[1] = 0.0;
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 7 && delay) {
                    bobOrangeKeyPosition[0] = 0.6;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        bobKeysOpacity[0] = 0.0;
                        containerbackground = Colors.transparent;
                      });
                    });
                    delayTimer = Timer(Duration(seconds: seconds + 1), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 8 && delay) {
                    aliceKeysOpacity[1] = 1.0;
                    aliceGreenKeyPosition[1] = 0.67;
                    delay = false;

                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 9 && delay) {
                    aliceGreenKeyPosition[0] = 0.6;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        aliceKeysOpacity[1] = 0.0;
                        containerBorder = Colors.black;
                      });
                    });
                    delayTimer = Timer(Duration(seconds: seconds + 1), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 10) {
                    pointsOpacity[1] = 0.0;
                    cloudsOpacity[1] = 0.0;
                  }
                  // if (Languages.selectedLanguage) {
                  //   text = DescList.slide10Desc[indexVisibilitySlide10];
                  // } else {
                  //   text = DescListEnglish.slide10Desc[indexVisibilitySlide10];
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
              heroTag: "left10",
              onPressed: () => setState(
                () {
                  if (videoButton == false) {
                    videoTimerSlide10.cancel();
                  }
                  videoButton = true;

                  seconds = Global.slider;
                  if (isLastIndex[1]) {
                    openDialog(true);
                  }

                  if (indexVisibilitySlide10 == 0) {
                    cloudsOpacity[0] = 0.0;
                    pointsOpacity[0] = 0.0;
                    indexVisibilitySlide10--;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide10 + 1).toString();
                    isLastIndex[1] = true;
                  } else if (indexVisibilitySlide10 == 1 && delay) {
                    aliceOrangeKeyPosition[1] = 0.08;

                    delay = false;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        indexVisibilitySlide10--;
                        pageController1 = TextEditingController()
                          ..text = (indexVisibilitySlide10 + 1).toString();
                        // if (Languages.selectedLanguage)
                        //   text = DescList.slide10Desc[indexVisibilitySlide10];
                        // else
                        //   text = DescListEnglish
                        //       .slide10Desc[indexVisibilitySlide10];
                        aliceKeysOpacity[0] = 0.0;
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 2 && delay) {
                    containerBorder = Colors.black;
                    aliceKeysOpacity[0] = 1.0;
                    aliceOrangeKeyPosition[0] = 0.45;
                    delay = false;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        indexVisibilitySlide10--;
                        pageController1 = TextEditingController()
                          ..text = (indexVisibilitySlide10 + 1).toString();
                        // if (Languages.selectedLanguage)
                        //   text = DescList.slide10Desc[indexVisibilitySlide10];
                        // else
                        //   text = DescListEnglish
                        //       .slide10Desc[indexVisibilitySlide10];
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 3 && delay) {
                    indexVisibilitySlide10--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide10 + 1).toString();
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    // if (Languages.selectedLanguage)
                    //   text = DescList.slide10Desc[indexVisibilitySlide10];
                    // else
                    //   text =
                    //       DescListEnglish.slide10Desc[indexVisibilitySlide10];
                    bobGreenKeyPosition[1] = 0.09;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        bobKeysOpacity[1] = 0.0;
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 4 && delay) {
                    indexVisibilitySlide10--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide10 + 1).toString();
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    // if (Languages.selectedLanguage)
                    //   text = DescList.slide10Desc[indexVisibilitySlide10];
                    // else
                    //   text =
                    //       DescListEnglish.slide10Desc[indexVisibilitySlide10];
                    containerbackground = Colors.transparent;
                    bobKeysOpacity[1] = 1.0;
                    bobGreenKeyPosition[0] = 0.35;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 5 && delay) {
                    indexVisibilitySlide10--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide10 + 1).toString();
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    // if (Languages.selectedLanguage)
                    //   text = DescList.slide10Desc[indexVisibilitySlide10];
                    // else
                    //   text =
                    //       DescListEnglish.slide10Desc[indexVisibilitySlide10];
                    pointsOpacity[1] = 0.0;
                    cloudsOpacity[1] = 0.0;
                    messagePosition[1] = 0.23;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        pointsOpacity[0] = 1.0;
                        cloudsOpacity[0] = 1.0;
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 6 && delay) {
                    indexVisibilitySlide10--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide10 + 1).toString();
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    // if (Languages.selectedLanguage)
                    //   text = DescList.slide10Desc[indexVisibilitySlide10];
                    // else
                    //   text =
                    //       DescListEnglish.slide10Desc[indexVisibilitySlide10];
                    bobOrangeKeyPosition[1] = 0.09;

                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        bobKeysOpacity[0] = 0.0;
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 7 && delay) {
                    indexVisibilitySlide10--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide10 + 1).toString();
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    // if (Languages.selectedLanguage)
                    //   text = DescList.slide10Desc[indexVisibilitySlide10];
                    // else
                    //   text =
                    //       DescListEnglish.slide10Desc[indexVisibilitySlide10];
                    containerbackground = Colors.green;
                    bobOrangeKeyPosition[0] = 0.45;
                    bobKeysOpacity[0] = 1.0;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 8 && delay) {
                    indexVisibilitySlide10--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide10 + 1).toString();
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    // if (Languages.selectedLanguage)
                    //   text = DescList.slide10Desc[indexVisibilitySlide10];
                    // else
                    //   text = DescListEnglish.descList[indexVisibilitySlide10];
                    aliceGreenKeyPosition[1] = 0.08;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        aliceKeysOpacity[1] = 0.0;
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 9 && delay) {
                    indexVisibilitySlide10--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide10 + 1).toString();
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    // if (Languages.selectedLanguage)
                    //   text = DescList.slide10Desc[indexVisibilitySlide10];
                    // else
                    //   text =
                    //       DescListEnglish.slide10Desc[indexVisibilitySlide10];
                    containerBorder = Colors.orange;
                    aliceKeysOpacity[1] = 1.0;
                    aliceGreenKeyPosition[0] = 0.35;
                    delay = false;
                    delayTimer = Timer(Duration(seconds: seconds), () {
                      setState(() {
                        delay = true;
                      });
                    });
                  } else if (indexVisibilitySlide10 == 10) {
                    pointsOpacity[1] = 1.0;
                    cloudsOpacity[1] = 1.0;
                  }
                  if (indexVisibilitySlide10 > 0 && delay) {
                    if (indexVisibilitySlide10 == 0) {
                      delay = false;
                    }
                    indexVisibilitySlide10--;
                    pageController1 = TextEditingController()
                      ..text = (indexVisibilitySlide10 + 1).toString();
                    isLastIndex[0] = false;
                    stepsVisibility[0] = !stepsVisibility[0];
                    stepsVisibility[1] = !stepsVisibility[1];
                    // if (Languages.selectedLanguage)
                    //   text = DescList.slide10Desc[indexVisibilitySlide10];
                    // else
                    //   text =
                    //       DescListEnglish.slide10Desc[indexVisibilitySlide10];
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
              heroTag: "middle10",
              onPressed: () => setState(
                () {
                  isPressedUp = 1;
                  isPressedDown = 2;

                  dropButton = !dropButton;
                  containerSeconds = 2;
                  desc = !desc;
                  timerSlide10 = Timer(
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
                                              videoTimerSlide10.cancel();
                                              videoTimerSlide10 =
                                                  videoTimerProblem();
                                            }
                                          } else if (Global.val == 3) {
                                            Global.slider = Global.val - 2;
                                            if (!videoButton) {
                                              videoTimerSlide10.cancel();
                                              videoTimerSlide10 =
                                                  videoTimerProblem();
                                            }
                                          } else {
                                            Global.slider = Global.val;
                                            if (!videoButton) {
                                              videoTimerSlide10.cancel();
                                              videoTimerSlide10 =
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
              heroTag: "stop10",
              backgroundColor: Colors.red,
              onPressed: () => setState(
                () {
                  Global.replacedSliderValue = Global.slider;
                  delayTimer.cancel();
                  videoTimerVariable.cancel();
                  timerSlide10.cancel();
                  videoTimerSlide10.cancel();
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
                  indexVisibilitySlide10 = -1;
                  containerBorder = Colors.black;
                  containerbackground = Colors.transparent;
                  checkVisibility = 0;
                  delay = true;
                  aliceOrangeKeyVisibility = false;
                  resetVisibility = false;
                  stepsVisibility = [true, false];
                  aliceOrangeKeyPosition = [0.45, 0.08];
                  aliceGreenKeyPosition = [0.35, 0.08];
                  bobOrangeKeyPosition = [0.45, 0.09];
                  bobGreenKeyPosition = [0.35, 0.09];
                  messagePosition = [0.6, 0.23];
                  bobMessagePosition = [0.6, 0.67];
                  cloudsOpacity = [0.0, 0.0];
                  pointsOpacity = [0.0, 0.0];
                  aliceKeysOpacity = [0.0, 0.0];
                  bobKeysOpacity = [0.0, 0.0];
                  backToZero = 0;
                  checkSettingsDuration = 0;
                  isSettingsPressed = 0;
                  settingsButtonDuration = 0;
                  descIndex = -1;
                  containerSeconds = 0;
                  isPressedUp = 0;
                  isPressedDown = 0;
                  timerProblem = 0;
                  // val = 1;
                  Global.slider = 0;
                  seconds = Global.slider;
                  dropButton = false;
                  desc = true;
                  descVisbility = desc;
                  text = '';
                  videoButton = true;
                  timerSeconds = 3;

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
              heroTag: "play10",
              backgroundColor: Colors.green,
              onPressed: () => setState(
                () {
                  desc = true;
                  descVisbility = desc;
                  dropButton = false;
                  videoButton = !videoButton;
                  if (!videoButton) {
                    videoTimerSlide10 = videoTimerProblem();
                  } else
                    videoTimerSlide10.cancel();
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
              heroTag: "more10",
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

                  timerSlide10 = Timer(
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
                    '${indexVisibilitySlide10 + 1} / 11',
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
                  videoTimerSlide10.cancel();
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
                if (indexVisibilitySlide10 != -1) {
                  pageController1 = TextEditingController()
                    ..text = (indexVisibilitySlide10).toString();
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
      delayTimer.cancel();
      videoTimerVariable.cancel();
      timerSlide10.cancel();
      videoTimerSlide10.cancel();
      switchOldValue = false;
      scaleEnabledOldVal = false;
      sliderOldValue = 0;
      valOldValue = 0;
      languageOldValue = true;
      isLastIndex = [false, true];
      indexVisibilitySlide10 = -1;
      containerBorder = Colors.black;
      containerbackground = Colors.transparent;
      checkVisibility = 0;
      delay = true;
      aliceOrangeKeyVisibility = false;
      resetVisibility = false;
      stepsVisibility = [true, false];
      aliceOrangeKeyPosition = [0.45, 0.08];
      aliceGreenKeyPosition = [0.35, 0.08];
      bobOrangeKeyPosition = [0.45, 0.09];
      bobGreenKeyPosition = [0.35, 0.09];
      messagePosition = [0.6, 0.23];
      bobMessagePosition = [0.6, 0.67];
      cloudsOpacity = [0.0, 0.0];
      pointsOpacity = [0.0, 0.0];
      aliceKeysOpacity = [0.0, 0.0];
      bobKeysOpacity = [0.0, 0.0];
      backToZero = 0;
      checkSettingsDuration = 0;
      isSettingsPressed = 0;
      settingsButtonDuration = 0;
      descIndex = -1;
      containerSeconds = 0;
      isPressedUp = 0;
      isPressedDown = 0;
      timerProblem = 0;
      // val = 1;
      Global.slider = 0;
      seconds = Global.slider;
      dropButton = false;
      desc = true;
      descVisbility = desc;
      text = '';
      videoButton = true;
      timerSeconds = 3;

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
