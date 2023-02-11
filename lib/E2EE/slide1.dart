// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

import '../Painters/arrow-painter.dart';
import '../Painters/circle-container.dart';
import '../Painters/line-positioned-widget.dart';
import '../main.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'home-page-E2EE.dart';
import 'description-widget.dart';
import 'positioned-widget.dart';
import 'package:flutter/material.dart';
import '../Main/language-provider.dart';
import '../Main/global.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Slide1 extends StatefulWidget {
  const Slide1({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  Slide1State createState() => Slide1State();
}

bool isShowCaseFinished = false;
final menuKey = GlobalKey();
final leftBtnKey = GlobalKey();
final righBtnKey = GlobalKey();
final middleBtnKey = GlobalKey();
final moreBtnKey = GlobalKey();
final playBtnKey = GlobalKey();
final resetBtnKey = GlobalKey();
final settingsBtnKey = GlobalKey();
final pageNumberKey = GlobalKey();
final scrollController = ScrollController();
List isLastIndex = [false, true];
bool scaleEnabledOldVal = false;
bool switchOldValue = false;
bool firstBuild = true;
double screenHeight = 0;
double screenWidth = 0;
var bigHeight = screenHeight * 1.5;
var bigWidth = screenWidth * 1.5;
double containerHeight = screenHeight;
double containerWidth = screenWidth;
var height = 378;
var width = 982;

bool isResizing = false;
String locale = 'de';
var sliderOldValue = 0;
var valOldValue = 0;
bool languageOldValue = true;
// var indexVisibilitySlide1DH = -1;
int checkVisibility = 0;
bool delay = true;
String dropdownValue = 'Deutsch';
var settingsVideoButton = 0.13;
var settingsStopButton = 0.13;
var advancedSettingsButton = 0.13;
var backToZero = 0;
var checkSettingsDuration = 0;
var isSettingsPressed = 0;
var settingsButtonDuration = 0;
// int descIndex = -1;
int containerSeconds = 0;
int isPressedUp = 0;
int isPressedDown = 0;
var timerProblem = 0;
List stepsVisibility = [true, false];
// double turquoisePosition = 0.61;
// double redPosition = 0.6;
var seconds = Global.slider;
bool dropButton = false;
bool desc = true;
bool descVisbility = desc;
String text = '';
bool videoButton = true;
bool settingButton = true;
var timerSeconds = 3;
Timer delayTimer = Timer(Duration(seconds: seconds), () {});
Timer delayTimer2 = Timer(Duration(seconds: seconds), () {});
Timer videoTimerVariable = Timer(Duration(seconds: seconds), () {});
Timer pageNumberTimer = Timer(Duration(seconds: seconds), () {});
Timer timerSlide1DH = Timer(Duration(seconds: seconds), () {});
Timer videoTimerSlide1DH =
    Timer.periodic(Duration(seconds: Global.slider), (videoTimer) {});

TextEditingController pageController1 = TextEditingController()
  ..text = (indexVisibilitySilde1).toString();

// List colorsVisibility = [true, true, true, true];
List contentOpacity = [
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0
];

bool b = true;
bool test = true;
// double orangeRightPosition = 0.021;
// double blueLeftPosition = 0.169;

List<GlobalKey<State<StatefulWidget>>> keys = [
  menuKey,
  leftBtnKey,
  righBtnKey,
  Description.descBoxKey,
  middleBtnKey,
  moreBtnKey,
  playBtnKey,
  resetBtnKey,
  settingsBtnKey,
  pageNumberKey,
];

/* Start Of E2EE */

List contentVisibility = [];
List messagePosition = [0.09, 0.01];
bool messageVisibility = false;
double messageOpacity = 0.0;
var indexVisibilitySilde1 = 0;
var messageLastIndexProblem = 0;
bool priority2 = true;
List priority = [true, true];

Timer timerSlide1 = Timer(Duration(seconds: seconds), () {});
Timer videoTimerVariableSlide1 = Timer(Duration(seconds: seconds), () {});
Timer videoTimerSlide1 =
    Timer.periodic(Duration(seconds: seconds), (videoTimer) {});

/* End Of E2EE */

class Slide1State extends State<Slide1>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  finishShowCase() {
    setState(() {
      isShowCaseFinished = true;
    });
  }

  pressMoreBtn() {
    setState(
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

        timerSlide1DH = Timer(
          const Duration(milliseconds: 100),
          () {
            setState(
              () {
                checkSettingsDuration = 1;
              },
            );
          },
        );
      },
    );
  }

  setFirstLunch(bool firstLunch) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isFirstLunch", firstLunch);
  }

  getFirstLunch() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var isFirstRun = pref.getBool("isFirstLunch");
    if (isFirstRun == null) {
      startShowCase();
    }
  }

  startShowCase() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ShowCaseWidget.of(context).startShowCase(
          keys,
        );
      },
    );
  }

  setLanguage(String language) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("appLanguage", language);
  }

  getLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var appLang = pref.getString("appLanguage");
    if (appLang != null) {
      Global.locale = appLang;
    }

    if (appLang == "en") {
      Global.selectedLanguage = false;
      E2EEVis.of(context)!
          .setLocale(const Locale.fromSubtags(languageCode: 'en'));
      Global.locale = 'en';
    } else {
      Global.selectedLanguage = true;
      E2EEVis.of(context)!
          .setLocale(const Locale.fromSubtags(languageCode: 'de'));
      Global.locale = 'de';
    }
  }

  @override
  void initState() {
    getFirstLunch();
    setFirstLunch(true);
    getLanguage();

    for (var i = 0; i < 18; i++) {
      contentVisibility.add(false);
    }

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  // ignore: must_call_super
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    videoTimerVariable.cancel();
    videoTimerProblem().cancel();
    pageNumberTimer.cancel();
    selectPageNumber(0, 0).cancel();
    videoButton = true;
    for (var i = 0; i < 18; i++) {
      contentVisibility[i] = false;
    }
    messagePosition[0] = 0.09;
    messagePosition[1] = 0.01;
    indexVisibilitySilde1 = 0;
    messageOpacity = 0.0;
    messageLastIndexProblem = 0;

    isLastIndex = [false, true];
    pageController1 = TextEditingController()..text = (0).toString();
    checkVisibility = 0;
    dropdownValue = 'Deutsch';
    backToZero = 0;
    checkSettingsDuration = 0;
    isSettingsPressed = 0;
    settingsButtonDuration = 0;
    containerSeconds = 0;
    isPressedUp = 0;
    isPressedDown = 0;
    timerProblem = 0;
    stepsVisibility = [true, false];
    seconds = 0;
    dropButton = false;
    desc = true;
    descVisbility = desc;
    text = '';
    videoButton = true;
    timerSeconds = 3;
    contentVisibility.clear();
    // isLastIndex = [false, true];
    // indexVisibilitySilde1 = 0;
    // pageController1 = TextEditingController()..text = (0).toString();
    // checkVisibility = 0;
    // delay = true;
    // dropdownValue = 'Deutsch';
    // settingsVideoButton = 0.13;
    // settingsStopButton = 0.13;
    // advancedSettingsButton = 0.13;
    // backToZero = 0;
    // checkSettingsDuration = 0;
    // isSettingsPressed = 0;
    // settingsButtonDuration = 0;
    // // descIndex = -1;
    // containerSeconds = 0;
    // isPressedUp = 0;
    // isPressedDown = 0;
    // timerProblem = 0;
    // stepsVisibility = [true, false];
    // // turquoisePosition = 0.61;
    // // redPosition = 0.6;
    // seconds = Global.slider;
    // dropButton = false;
    // desc = true;
    // descVisbility = desc;
    // text = '';
    // videoButton = true;
    // settingButton = true;
    // timerSeconds = 3;

    // // colorsVisibility = [true, true, true, true];
    // contentOpacity = [
    //   0.0,
    //   0.0,
    //   0.0,
    //   0.0,
    //   0.0,
    //   0.0,
    //   0.0,
    //   0.0,
    //   0.0,
    //   0.0,
    //   0.0,
    //   0.0
    // ];

    // b = true;
    // test = true;
    // // orangeRightPosition = 0.021;
    // // blueLeftPosition = 0.169;

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

  Positioned bulletPosition(
      double top, double left, double opacity, Color color, bool vis) {
    return Positioned(
      top: (MediaQuery.of(context).size.height -
              HomePageE2EEState.returnAppBar[1]) *
          top,
      left: MediaQuery.of(context).size.width * left,
      child: Visibility(
        visible: vis,
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: opacity,
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width * 0.01,
                MediaQuery.of(context).size.height * 0.02),
            painter: CirclePainter(color, PaintingStyle.fill),
          ),
        ),
      ),
    );
  }

  Timer selectPageNumber(int a, int sec) {
    pageNumberTimer = Timer.periodic(
      Duration(seconds: sec),
      (Timer pageNumberTimer) {
        setState(
          () {
            if (sec == 0) {
              delay = true;
            }
            seconds = 0;

            if (indexVisibilitySilde1 == a) {
              pageNumberTimer.cancel();
            }
            if (indexVisibilitySilde1 > 0) {
              isLastIndex[1] = false;
            }
            if (contentVisibility[7] == true) messageOpacity = 1.0;
            if (contentVisibility[10] == true) {
              messagePosition[0] = 0.28;
              messagePosition[1] = 0.41;
            }
            if (contentVisibility[12] == true) {
              messagePosition[0] = 0.64;
              messagePosition[1] = 0.52;
            }
            if (contentVisibility[14] == true) {
              messagePosition[0] = 0.74;
              messagePosition[1] = 0.15;
              timerProblem = 3;
            }
            if (contentVisibility[15] == true) {
              messagePosition[0] = 0.875;
              messagePosition[1] = 0.01;
            }
            if (contentVisibility[16] == true) {
              messageOpacity = 0.0;
              indexVisibilitySilde1++;
            }
            if (indexVisibilitySilde1 < a) {
              contentVisibility[indexVisibilitySilde1] = true;
              indexVisibilitySilde1++;
              stepsVisibility[0] = !stepsVisibility[0];
              stepsVisibility[1] = !stepsVisibility[1];
            }
            if (indexVisibilitySilde1 >= contentVisibility.length) {
              indexVisibilitySilde1 = 17;
              isLastIndex[0] = true;
            }
          },
        );
      },
    );
    return pageNumberTimer;
  }

  Timer videoTimerProblem() {
    videoTimerVariable = Timer.periodic(
      Duration(seconds: seconds),
      (Timer videoTimerVariable) {
        setState(
          () {
            messageLastIndexProblem = 0;
            seconds = Global.slider;

            contentVisibility[indexVisibilitySilde1] = true;
            if (indexVisibilitySilde1 == 0) {
              isLastIndex[1] = false;
            }
            if (contentVisibility[7] == true) messageOpacity = 1.0;
            if (contentVisibility[10] == true) {
              messagePosition[0] = 0.28;
              messagePosition[1] = 0.41;
            }
            if (contentVisibility[12] == true) {
              messagePosition[0] = 0.64;
              messagePosition[1] = 0.52;
            }
            if (contentVisibility[14] == true) {
              messagePosition[0] = 0.74;
              messagePosition[1] = 0.15;
              timerProblem = 3;
            }
            if (contentVisibility[15] == true) {
              messagePosition[0] = 0.875;
              messagePosition[1] = 0.01;
            }
            if (contentVisibility[16] == true) {
              messageOpacity = 0.0;
              indexVisibilitySilde1++;
            }
            if (indexVisibilitySilde1 <= 17) {
              indexVisibilitySilde1++;
              pageController1 = TextEditingController()
                ..text = (indexVisibilitySilde1).toString();
              stepsVisibility[0] = !stepsVisibility[0];
              stepsVisibility[1] = !stepsVisibility[1];
            }
            if (indexVisibilitySilde1 >= contentVisibility.length) {
              indexVisibilitySilde1 = 17;
              isLastIndex[0] = true;
            }
          },
        );
      },
    );
    return videoTimerVariable;
  }

  Positioned arrowPosition(
      {required double p1x,
      required double p1y,
      required double p2x,
      required double p2y,
      required double opacity}) {
    return Positioned(
      top: (MediaQuery.of(context).size.height -
              HomePageE2EEState.returnAppBar[1]) *
          0.1,
      left: MediaQuery.of(context).size.width * 0.535,
      child: AnimatedOpacity(
        opacity: opacity,
        duration: Duration(seconds: seconds),
        child: CustomPaint(
          size: Size(
              MediaQuery.of(context).size.width * 0.28,
              (MediaQuery.of(context).size.height -
                      HomePageE2EEState.returnAppBar[1]) *
                  0.47),
          painter: ArrowPainter(
            p1x: MediaQuery.of(context).size.width * p1x,
            p1y: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                p1y,
            p2x: MediaQuery.of(context).size.width * p2x,
            p2y: (MediaQuery.of(context).size.height -
                    HomePageE2EEState.returnAppBar[1]) *
                p2y,
            arrowSizeVal: MediaQuery.of(context).size.width * 0.015,
            arrowColor: Colors.black,
          ),
        ),
      ),
    );
  }

  bool stop = true;

  @override
  Widget build(BuildContext context) {
    screenHeight = ((MediaQuery.of(context).size.height) -
        (HomePageE2EEState.returnAppBar[1]));
    screenWidth = MediaQuery.of(context).size.width;
    if (firstBuild) {
      if (screenHeight <= height) {
        containerHeight = bigHeight;
      } else {
        containerHeight = screenHeight;
      }
      if (screenWidth <= width) {
        containerWidth = bigWidth;
      } else {
        containerWidth = screenWidth;
      }
      firstBuild = false;
    }

    text = translate(context, indexVisibilitySilde1);

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
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            SizedBox(
              height: containerHeight,
              width: containerWidth,
            ),

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
              'assets/server.jpeg',
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
              'assets/server.jpeg',
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
              'assets/server.jpeg',
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
              'assets/server.jpeg',
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
            MyLine(contentVisibility[2], 0.08, 0.14, 0.198, 0.28, seconds,
                Colors.black),

            // Line between middle-left and middle-right
            MyLine(contentVisibility[5], 0.28, 0.28, 0.72, 0.28, seconds,
                Colors.black),

            // Line between top-right and middle right
            MyLine(contentVisibility[6], 0.78, 0.229, 0.92, 0.14, seconds,
                Colors.black),

            // Line between top-right and bottom-right
            MyLine(contentVisibility[9], 0.72, 0.5, 0.92, 0.14, seconds,
                Colors.black),

            // Line between down-left and bottom-right
            MyLine(contentVisibility[12], 0.36, 0.65, 0.67, 0.55, seconds,
                Colors.black),

            // Line between middle-left and bottom-left
            MyLine(contentVisibility[14], 0.25, 0.34, 0.31, 0.6, seconds,
                Colors.black),

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
                        'Inbox Server',
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
                        'Inbox Server',
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
                        'Inbox Server',
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
                        'Inbox Server',
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
                        'Inbox Server',
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
                HomePageE2EEState.returnAppBar[1], true),

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
              child: Showcase(
                key: righBtnKey,
                description: AppLocalizations.of(context)!.showCase0,
                descTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                tooltipBackgroundColor: Colors.blue,
                targetShapeBorder: const CircleBorder(),
                child: FloatingActionButton(
                  backgroundColor: isLastIndex[0] ? Colors.grey : Colors.blue,
                  heroTag: "right9",
                  onPressed: () {
                    setState(
                      () {
                        videoTimerSlide1.cancel();
                        videoTimerVariableSlide1.cancel();
                        videoButton = true;
                        messageLastIndexProblem = 0;
                        seconds = Global.slider;
                        contentVisibility[indexVisibilitySilde1] = true;
                        if (isLastIndex[0]) {
                          openDialog(false);
                        }
                        if (indexVisibilitySilde1 == 0) {
                          isLastIndex[1] = false;
                        }
                        if (contentVisibility[7] == true) messageOpacity = 1.0;
                        if (contentVisibility[10] == true) {
                          messagePosition[0] = 0.28;
                          messagePosition[1] = 0.41;
                        }
                        if (contentVisibility[12] == true) {
                          messagePosition[0] = 0.64;
                          messagePosition[1] = 0.52;
                        }
                        if (contentVisibility[14] == true) {
                          messagePosition[0] = 0.74;
                          messagePosition[1] = 0.15;
                          timerProblem = 3;
                        }
                        if (contentVisibility[15] == true) {
                          messagePosition[0] = 0.875;
                          messagePosition[1] = 0.01;
                        }
                        if (contentVisibility[16] == true) {
                          messageOpacity = 0.0;
                          indexVisibilitySilde1++;
                        }
                        if (indexVisibilitySilde1 <= 17) {
                          indexVisibilitySilde1++;
                          pageController1 = TextEditingController()
                            ..text = (indexVisibilitySilde1).toString();
                          stepsVisibility[0] = !stepsVisibility[0];
                          stepsVisibility[1] = !stepsVisibility[1];
                        }
                        if (indexVisibilitySilde1 >= contentVisibility.length) {
                          indexVisibilitySilde1 = 17;
                          isLastIndex[0] = true;
                        }
                        // if (descIndex < 16) descIndex++;
                        // if (Languages.selectedLanguage)
                        //   text = DescList.descList[descIndex];
                        // else
                        //   text = DescListEnglish.descList[descIndex];

                        // if (videoButton == false) {
                        //   videoTimerSlide1DH.cancel();
                        // }
                        // videoButton = true;
                        // seconds = Global.slider;
                        // if (indexVisibilitySlide1DH == 6) {
                        //   openDialog(false);
                        // }

                        // if (indexVisibilitySlide1DH < 6 && delay) {
                        //   indexVisibilitySlide1DH++;
                        //   pageController1 = TextEditingController()
                        //     ..text = (indexVisibilitySlide1DH + 1).toString();
                        //   stepsVisibility[0] = !stepsVisibility[0];
                        //   stepsVisibility[1] = !stepsVisibility[1];
                        // }
                        // if (indexVisibilitySlide1DH == 0) {
                        //   isLastIndex[1] = false;
                        //   contentOpacity[0] = 1.0;
                        // } else if (indexVisibilitySlide1DH == 1 && delay) {
                        //   contentOpacity[1] = 1.0;
                        //   contentOpacity[2] = 1.0;
                        //   contentOpacity[3] = 1.0;
                        //   contentOpacity[4] = 1.0;
                        // } else if (indexVisibilitySlide1DH == 2 && delay) {
                        //   contentOpacity[1] = 0.0;
                        //   contentOpacity[2] = 0.0;
                        //   contentOpacity[5] = 1.0;
                        //   contentOpacity[6] = 1.0;
                        // } else if (indexVisibilitySlide1DH == 3 && delay) {
                        //   turquoisePosition = 0.47;
                        //   redPosition = 0.47;
                        //   contentOpacity[6] = 0.5;
                        //   contentOpacity[5] = 0.0;
                        //   delay = false;
                        //   delayTimer = Timer(Duration(seconds: seconds), () {
                        //     setState(() {
                        //       contentOpacity[0] = 0.0;
                        //       contentOpacity[4] = 0.0;
                        //       contentOpacity[6] = 0.0;
                        //       contentOpacity[7] = 1.0;
                        //     });
                        //   });
                        //   delayTimer2 =
                        //       Timer(Duration(seconds: seconds * 2), () {
                        //     setState(() {
                        //       colorsVisibility[2] = false;
                        //       turquoisePosition = 0.61;
                        //       redPosition = 0.6;
                        //       delay = true;
                        //     });
                        //   });
                        // } else if (indexVisibilitySlide1DH == 4 && delay) {
                        //   contentOpacity[2] = 1.0;
                        //   contentOpacity[8] = 1.0;
                        //   contentOpacity[11] = 1.0;
                        //   contentOpacity[9] = 1.0;
                        //   colorsVisibility[2] = true;
                        // } else if (indexVisibilitySlide1DH == 5 && delay) {
                        //   contentOpacity[8] = 0.0;
                        //   delay = false;
                        //   delayTimer = Timer(Duration(seconds: seconds), () {
                        //     setState(() {
                        //       contentOpacity[8] = 1.0;
                        //       blueLeftPosition = 0.09;
                        //       orangeRightPosition = 0.1;
                        //       delay = true;
                        //     });
                        //   });
                        //   contentOpacity[2] = 0.0;
                        //   contentOpacity[5] = 1.0;
                        //   contentOpacity[6] = 1.0;
                        //   contentOpacity[7] = 0.0;
                        //   contentOpacity[11] = 0.0;
                        // } else if (indexVisibilitySlide1DH == 6 && delay) {
                        //   isLastIndex[0] = true;
                        //   turquoisePosition = 0.47;
                        //   redPosition = 0.47;
                        //   contentOpacity[5] = 0.0;
                        //   delay = false;
                        //   delayTimer = Timer(Duration(seconds: seconds), () {
                        //     setState(() {
                        //       contentOpacity[6] = 0.0;
                        //       contentOpacity[8] = 0.0;
                        //       contentOpacity[10] = 1.0;
                        //       delay = true;
                        //     });
                        //   });
                        // }
                      },
                    );
                  },
                  child: Icon(Icons.arrow_forward,
                      size: MediaQuery.of(context).size.height * 0.06),
                ),
              ),
            ),

            // Left-Button
            Positioned(
              left: MediaQuery.of(context).size.width * 0.01,
              bottom: MediaQuery.of(context).size.height * 0.02,
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Showcase(
                key: leftBtnKey,
                description: AppLocalizations.of(context)!.showCase1,
                descTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                tooltipBackgroundColor: Colors.blue,
                tooltipPadding: const EdgeInsets.all(12),
                targetShapeBorder: const CircleBorder(),
                child: FloatingActionButton(
                  backgroundColor: isLastIndex[1] ? Colors.grey : Colors.blue,
                  heroTag: "left9",
                  onPressed: () {
                    setState(
                      () {
                        videoTimerSlide1.cancel();
                        videoTimerVariableSlide1.cancel();
                        videoButton = true;

                        seconds = Global.slider;
                        if (isLastIndex[1]) {
                          openDialog(true);
                        }
                        if (contentVisibility[16] == true) {
                          messageOpacity = 1.0;
                          messageLastIndexProblem++;
                        }
                        if (contentVisibility[17] == false) {
                          messageLastIndexProblem++;
                        }
                        contentVisibility[17] = false;
                        if (indexVisibilitySilde1 <= 17) {
                          indexVisibilitySilde1--;
                          pageController1 = TextEditingController()
                            ..text = (indexVisibilitySilde1).toString();
                          if (indexVisibilitySilde1 <= 16) {
                            isLastIndex[0] = false;
                          }
                          if (indexVisibilitySilde1 == 0) {
                            isLastIndex[1] = true;
                            text = '';
                          }
                          if (indexVisibilitySilde1 < 0) {
                            indexVisibilitySilde1 = 0;
                            pageController1 = TextEditingController()
                              ..text = (indexVisibilitySilde1).toString();
                          }
                        }

                        if (indexVisibilitySilde1 > 12) {
                          priority2 = false;
                        } else {
                          priority2 = true;
                        }
                        timerProblem = 0;
                        if (indexVisibilitySilde1 == 12) priority[0] = false;
                        if (indexVisibilitySilde1 == 10) priority[0] = true;

                        if (indexVisibilitySilde1 == 14) priority[1] = true;
                        if (indexVisibilitySilde1 == 15) priority[1] = false;

                        if (indexVisibilitySilde1 < 0) {
                          indexVisibilitySilde1 = 0;
                        }
                        contentVisibility[indexVisibilitySilde1] = false;
                        if (indexVisibilitySilde1 == 15) timerProblem = 1;
                        if (priority2) {
                          if (contentVisibility[10] == false &&
                              priority[0] == true) {
                            messagePosition[0] = 0.09;
                            messagePosition[1] = 0.01;
                          }
                          if (contentVisibility[12] == false &&
                              priority[0] == false) {
                            messagePosition[0] = 0.28;
                            messagePosition[1] = 0.41;
                          }
                        }

                        if (!priority2) {
                          if (contentVisibility[14] == false &&
                              priority[1] == true) {
                            messagePosition[0] = 0.64;
                            messagePosition[1] = 0.52;
                          }
                          if (contentVisibility[15] == false &&
                              priority[1] == false) {
                            seconds = 2;
                            messagePosition[0] = 0.74;
                            messagePosition[1] = 0.15;
                            messageLastIndexProblem = 0;
                          }
                        }

                        if (contentVisibility[7] == false) messageOpacity = 0.0;
                        // if (descIndex >= 0) {
                        //   descIndex--;
                        //   stepsVisibility[0] = !stepsVisibility[0];
                        //   stepsVisibility[1] = !stepsVisibility[1];
                        // }
                        // if (descIndex < 0) {
                        //   descIndex = -1;
                        //   text = '';
                        // }
                        // if (descIndex >= 0) {
                        //   if (Global.selectedLanguage)
                        //     text = DescList.descList[descIndex];
                        //   else
                        //     text = DescListEnglish.descList[descIndex];
                        // }

                        // if (videoButton == false) {
                        //   videoTimerSlide1DH.cancel();
                        // }
                        // videoButton = true;

                        // seconds = Global.slider;
                        // if (indexVisibilitySlide1DH == -1) {
                        //   openDialog(true);
                        // }
                        // if (indexVisibilitySlide1DH == 0) text = '';

                        // if (indexVisibilitySlide1DH == 0) {
                        //   indexVisibilitySlide1DH--;
                        //   pageController1 = TextEditingController()
                        //     ..text = (indexVisibilitySlide1DH + 1).toString();
                        //   contentOpacity[0] = 0.0;
                        //   stepsVisibility[0] = !stepsVisibility[0];
                        //   stepsVisibility[1] = !stepsVisibility[1];
                        //   isLastIndex[1] = true;
                        // } else if (indexVisibilitySlide1DH == 1 && delay) {
                        //   contentOpacity[1] = 0.0;
                        //   contentOpacity[2] = 0.0;
                        //   contentOpacity[3] = 0.0;
                        //   contentOpacity[4] = 0.0;
                        // } else if (indexVisibilitySlide1DH == 2 && delay) {
                        //   contentOpacity[1] = 1.0;
                        //   contentOpacity[2] = 1.0;
                        //   contentOpacity[5] = 0.0;
                        //   contentOpacity[6] = 0.0;
                        // } else if (indexVisibilitySlide1DH == 3 && delay) {
                        //   indexVisibilitySlide1DH--;
                        //   pageController1 = TextEditingController()
                        //     ..text = (indexVisibilitySlide1DH + 1).toString();
                        //   stepsVisibility[0] = !stepsVisibility[0];
                        //   stepsVisibility[1] = !stepsVisibility[1];
                        //   colorsVisibility[2] = true;
                        //   contentOpacity[5] = 1.0;
                        //   turquoisePosition = 0.47;
                        //   redPosition = 0.47;
                        //   delay = false;
                        //   delayTimer = Timer(Duration(seconds: seconds), () {
                        //     setState(() {
                        //       contentOpacity[0] = 1.0;
                        //       contentOpacity[4] = 1.0;
                        //       contentOpacity[6] = 1.0;
                        //       contentOpacity[7] = 0.0;
                        //       turquoisePosition = 0.61;
                        //       redPosition = 0.6;
                        //       delay = true;
                        //     });
                        //   });
                        // } else if (indexVisibilitySlide1DH == 4 && delay) {
                        //   contentOpacity[2] = 0.0;
                        //   contentOpacity[8] = 0.0;
                        //   contentOpacity[11] = 0.0;
                        //   contentOpacity[9] = 0.0;
                        //   colorsVisibility[2] = false;
                        // } else if (indexVisibilitySlide1DH == 5 && delay) {
                        //   indexVisibilitySlide1DH--;
                        //   pageController1 = TextEditingController()
                        //     ..text = (indexVisibilitySlide1DH + 1).toString();
                        //   contentOpacity[8] = 0.0;
                        //   stepsVisibility[0] = !stepsVisibility[0];
                        //   stepsVisibility[1] = !stepsVisibility[1];
                        //   delay = false;
                        //   delayTimer = Timer(Duration(seconds: seconds), () {
                        //     setState(() {
                        //       contentOpacity[8] = 1.0;
                        //       contentOpacity[7] = 1.0;
                        //       blueLeftPosition = 0.169;
                        //       orangeRightPosition = 0.021;
                        //       delay = true;
                        //     });
                        //   });
                        //   contentOpacity[2] = 1.0;
                        //   contentOpacity[5] = 0.0;
                        //   contentOpacity[6] = 0.0;
                        //   contentOpacity[11] = 1.0;
                        // } else if (indexVisibilitySlide1DH == 6 && delay) {
                        //   turquoisePosition = 0.61;
                        //   redPosition = 0.6;
                        //   contentOpacity[5] = 1.0;
                        //   contentOpacity[10] = 0.0;
                        //   contentOpacity[6] = 1.0;
                        //   contentOpacity[8] = 1.0;
                        // }
                        // if (indexVisibilitySlide1DH > 0 && delay) {
                        //   if (indexVisibilitySlide1DH == 0) {
                        //     delay = false;
                        //   }
                        //   indexVisibilitySlide1DH--;
                        //   pageController1 = TextEditingController()
                        //     ..text = (indexVisibilitySlide1DH + 1).toString();
                        //   stepsVisibility[0] = !stepsVisibility[0];
                        //   stepsVisibility[1] = !stepsVisibility[1];
                        //   isLastIndex[0] = false;
                        // }
                      },
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: MediaQuery.of(context).size.height * 0.06,
                  ),
                ),
              ),
            ),

            // Middle-Button
            Positioned(
              left: MediaQuery.of(context).size.width * 0.458,
              bottom: MediaQuery.of(context).size.height * 0.001,
              width: MediaQuery.of(context).size.width * 0.08,
              height: MediaQuery.of(context).size.height * 0.08,
              child: Showcase(
                key: middleBtnKey,
                description: AppLocalizations.of(context)!.showCase2,
                descTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                tooltipBackgroundColor: Colors.blue,
                tooltipPadding: const EdgeInsets.all(12),
                targetShapeBorder: const CircleBorder(),
                child: FloatingActionButton(
                  heroTag: "middle9",
                  onPressed: () => setState(
                    () {
                      isPressedUp = 1;
                      isPressedDown = 2;

                      dropButton = !dropButton;
                      containerSeconds = 2;
                      desc = !desc;
                      timerSlide1DH = Timer(
                        const Duration(seconds: 2),
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
            ),

            // Advanced-Setting-Button
            AnimatedPositioned(
              right: MediaQuery.of(context).size.width * 0.01,
              bottom:
                  MediaQuery.of(context).size.height * advancedSettingsButton,
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.1,
              duration: Duration(
                  milliseconds: settingsButtonDuration + 200 * backToZero),
              child: Showcase(
                key: settingsBtnKey,
                description: AppLocalizations.of(context)!.showCase3,
                descTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                tooltipBackgroundColor: Colors.blue,
                tooltipPadding: const EdgeInsets.all(12),
                targetShapeBorder: const CircleBorder(),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0))),
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
                                        void Function(void Function())
                                            setState) {
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
                                                  videoTimerSlide1DH.cancel();
                                                  videoTimerSlide1DH =
                                                      videoTimerProblem();
                                                }
                                              } else if (Global.val == 3) {
                                                Global.slider = Global.val - 2;
                                                if (!videoButton) {
                                                  videoTimerSlide1DH.cancel();
                                                  videoTimerSlide1DH =
                                                      videoTimerProblem();
                                                }
                                              } else {
                                                Global.slider = Global.val;
                                                if (!videoButton) {
                                                  videoTimerSlide1DH.cancel();
                                                  videoTimerSlide1DH =
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
                                          void Function(void Function())
                                              setState) {
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
                                                  Global.selectedLanguage =
                                                      false;
                                                  E2EEVis.of(context)!
                                                      .setLocale(const Locale
                                                              .fromSubtags(
                                                          languageCode: 'en'));
                                                  Global.locale = 'en';
                                                  setLanguage('en');
                                                } else {
                                                  Global.selectedLanguage =
                                                      true;
                                                  E2EEVis.of(context)!
                                                      .setLocale(const Locale
                                                              .fromSubtags(
                                                          languageCode: 'de'));
                                                  Global.locale = 'de';
                                                  setLanguage('de');
                                                }
                                              },
                                            );
                                            Provider.of<LanguageProvider>(
                                                    context,
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
                                        void Function(void Function())
                                            setState) {
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
            ),

            // Video-Stop-Button
            AnimatedPositioned(
              right: MediaQuery.of(context).size.width * 0.01,
              bottom: MediaQuery.of(context).size.height * settingsStopButton,
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.1,
              duration: Duration(
                  milliseconds: settingsButtonDuration + 100 * backToZero),
              child: Showcase(
                key: resetBtnKey,
                description: AppLocalizations.of(context)!.showCase4,
                descTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                tooltipBackgroundColor: Colors.blue,
                tooltipPadding: const EdgeInsets.all(12),
                targetShapeBorder: const CircleBorder(),
                child: FloatingActionButton(
                  heroTag: "stop9",
                  backgroundColor: Colors.red,
                  onPressed: () => setState(
                    () {
                      videoTimerSlide1.cancel();
                      videoTimerVariableSlide1.cancel();
                      timerSlide1.cancel();
                      videoTimerVariable.cancel();
                      videoButton = true;
                      for (var i = 0; i < 18; i++) {
                        contentVisibility[i] = false;
                      }
                      messagePosition[0] = 0.09;
                      messagePosition[1] = 0.01;
                      indexVisibilitySilde1 = 0;
                      messageOpacity = 0.0;
                      messageLastIndexProblem = 0;
                      Global.slider = 3;
                      Global.val = 1;
                      Global.replacedSliderValue = Global.slider;

                      isLastIndex = [false, true];
                      pageController1 = TextEditingController()
                        ..text = (0).toString();
                      checkVisibility = 0;
                      dropdownValue = 'Deutsch';
                      backToZero = 0;
                      checkSettingsDuration = 0;
                      isSettingsPressed = 0;
                      settingsButtonDuration = 0;
                      containerSeconds = 0;
                      isPressedUp = 0;
                      isPressedDown = 0;
                      timerProblem = 0;
                      stepsVisibility = [true, false];
                      seconds = 0;
                      dropButton = false;
                      desc = true;
                      descVisbility = desc;
                      text = '';
                      videoButton = true;
                      timerSeconds = 3;
                      contentOpacity = [
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0
                      ];

                      b = true;
                      test = true;
                      delayTimer = Timer(const Duration(milliseconds: 50), () {
                        setState(() {
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
            ),

            // Video-Play-Button
            AnimatedPositioned(
              right: MediaQuery.of(context).size.width * 0.01,
              bottom: MediaQuery.of(context).size.height * settingsVideoButton,
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.1,
              duration: Duration(milliseconds: settingsButtonDuration),
              child: Showcase(
                key: playBtnKey,
                description: AppLocalizations.of(context)!.showCase5,
                descTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                tooltipBackgroundColor: Colors.blue,
                tooltipPadding: const EdgeInsets.all(12),
                targetShapeBorder: const CircleBorder(),
                child: FloatingActionButton(
                  heroTag: "play9",
                  backgroundColor: Colors.green,
                  onPressed: () => setState(
                    () {
                      desc = true;
                      descVisbility = desc;
                      dropButton = false;
                      videoButton = !videoButton;
                      if (!videoButton) {
                        videoTimerSlide1DH = videoTimerProblem();
                      } else {
                        videoTimerSlide1DH.cancel();
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
            ),

            // More-Button
            Positioned(
              right: MediaQuery.of(context).size.width * 0.01,
              bottom: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Showcase(
                key: moreBtnKey,
                description: AppLocalizations.of(context)!.showCase6,
                descTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                tooltipBackgroundColor: Colors.blue,
                tooltipPadding: const EdgeInsets.all(12),
                targetShapeBorder: const CircleBorder(),
                child: FloatingActionButton(
                  heroTag: "more9",
                  onPressed: pressMoreBtn,
                  child: settingButton
                      ? Icon(Icons.more_vert,
                          size: MediaQuery.of(context).size.height * 0.05)
                      : Icon(Icons.close,
                          size: MediaQuery.of(context).size.height * 0.05),
                ),
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
                  child: Showcase(
                    key: pageNumberKey,
                    description: AppLocalizations.of(context)!.showCase7,
                    descTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    tooltipBackgroundColor: Colors.blue,
                    tooltipPadding: const EdgeInsets.all(12),
                    targetShapeBorder: const CircleBorder(),
                    child: TextButton(
                      onPressed: () {
                        numberPageDialog();
                      },
                      child: Text(
                        indexVisibilitySilde1 == 16 && messageOpacity == 0.0
                            ? '$indexVisibilitySilde1 / 17'
                            : '$indexVisibilitySilde1 / 17',
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
            ),
          ],
        ),
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
                    ? AppLocalizations.of(context)!.lastLeft
                    : AppLocalizations.of(context)!.lastRight,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        content: const SizedBox(
          height: 5,
          width: 300.0,
        ),
        actions: isLeft
            ? <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK'),
                ),
              ]
            : <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                    HomePageE2EEState.controller.animateTo(1);
                  },
                  child:
                      Text(isLeft ? 'OK' : AppLocalizations.of(context)!.yes),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                    setState(() {});
                  },
                  child: Text(AppLocalizations.of(context)!.no),
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
                  videoTimerSlide1DH.cancel();
                }
                videoButton = true;
                seconds = Global.slider;
              });
              if ((int.parse(pageController1.text) > 17) ||
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
                pageController1 = TextEditingController()
                  ..text = (indexVisibilitySilde1).toString();
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
    setState(() {
      stopFunction();
      selectPageNumber(int.parse(pageController1.text), 0);
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
      videoTimerSlide1.cancel();
      videoTimerVariableSlide1.cancel();
      timerSlide1.cancel();
      videoTimerVariable.cancel();
      videoButton = true;
      for (var i = 0; i < 18; i++) {
        contentVisibility[i] = false;
      }
      messagePosition[0] = 0.09;
      messagePosition[1] = 0.01;
      indexVisibilitySilde1 = 0;
      messageOpacity = 0.0;
      messageLastIndexProblem = 0;
      Global.slider = 3;
      Global.val = 1;
      Global.replacedSliderValue = Global.slider;

      isLastIndex = [false, true];
      checkVisibility = 0;
      backToZero = 0;
      checkSettingsDuration = 0;
      isSettingsPressed = 0;
      settingsButtonDuration = 0;
      containerSeconds = 0;
      isPressedUp = 0;
      isPressedDown = 0;
      timerProblem = 0;
      stepsVisibility = [true, false];
      seconds = 0;
      dropButton = false;
      desc = true;
      descVisbility = desc;
      text = '';
      videoButton = true;
      timerSeconds = 3;
      contentOpacity = [
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
        0.0
      ];

      b = true;
      test = true;
      delayTimer = Timer(const Duration(milliseconds: 50), () {
        setState(() {
          Global.slider = Global.replacedSliderValue;
          seconds = Global.slider;
          delayTimer.cancel();
        });
      });
    });
  }
}
