// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

import '../E2EE/home-page-E2EE.dart';
import 'global.dart';
import 'language-provider.dart';
import '../main.dart';
import '../E2EE/my-container.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => IntroState();
}

bool isTyperFinished = false;
bool isTouchEnabled = false;
bool isScenarioBtnVisible = false;
double containerLeft = 0.0;
double containerWidth = 0.0;
int contaienrSec = 0;
double xShape = 0.0;
String messageText = '';

double globalOacity = 1.0;
bool isTextVisible = false;
String dropdownValue = 'Deutsch';
String locale = 'de';
bool languageOldValue = true;
bool b = true;
bool isResizing = false;
bool isClicked = false;
var sec = 0;
double aliceTop = 0.1;
double bobTop = -0.5;
double eveTop = -0.5;
double containerPosition = 1.5;
String path = 'assets/AliceDH.jpeg';
List introduction = [
  '',
  'And I am Bob.',
  'And here is Eve.',
  'In this app we will explain you how DHKE works.',
  'The application consists of 4 scenes',
  'The first scene will explain you the basic idea of DHKE using colors.',
  'The second one will give you some mathematical basic about what root of prime numbers.',
  'The third one will explain DHKE with numbers. Here you can use your own values :)',
  'The fourth one will show you how MitM-Attack on DHKE can be happened.',
  'So let\'s start the scenes...',
];
int cnt = 0;
Timer timer = Timer(const Duration(seconds: 1), () {});

class IntroState extends State<Intro> with WidgetsBindingObserver {
  GlobalKey<HomePageE2EEState> hoemPageDHKey = GlobalKey<HomePageE2EEState>();

  setFirstLunch(bool firstLunch) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isFirstLunch", firstLunch);
  }

  getFirstLunch() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var isFirstRun = pref.getBool("isFirstLunch");
    if (isFirstRun == null) {
      openLanguageDialog();
    }
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

  void openLanguageDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => SingleChildScrollView(
          child: AlertDialog(
            scrollable: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            title: Text(
              AppLocalizations.of(context)!.settings,
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.appLanguage,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 18.0),
                        child: StatefulBuilder(builder: (BuildContext context,
                            void Function(void Function()) setState) {
                          return DropdownButton<String>(
                            value: Global.selectedLanguage == true
                                ? Global.languages[0]
                                : Global.languages[1],
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (newValue) {
                              setState(
                                () {
                                  dropdownValue = newValue!;
                                  if (dropdownValue == Global.languages[1]) {
                                    Global.selectedLanguage = false;
                                    E2EEVis.of(context)!.setLocale(
                                        const Locale.fromSubtags(
                                            languageCode: 'en'));
                                    Global.locale = 'en';
                                    setLanguage('en');
                                  } else {
                                    Global.selectedLanguage = true;
                                    E2EEVis.of(context)!.setLocale(
                                        const Locale.fromSubtags(
                                            languageCode: 'de'));
                                    Global.locale = 'de';
                                    setLanguage('de');
                                  }
                                },
                              );
                              Provider.of<LanguageProvider>(context,
                                      listen: false)
                                  .changeLanguage(1);
                            },
                            items:
                                Global.languages.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                },
                child: const Text('OK'),
              ),
              // Text(AppLocalizations.of(context)!.cancel),
            ],
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    setFirstLunch(true);
    getFirstLunch();
    getLanguage();
    isTouchEnabled = false;
    isScenarioBtnVisible = false;
    containerLeft = 0.0;
    containerWidth = 0.0;
    contaienrSec = 0;
    xShape = 0.0;
    messageText = '';

    globalOacity = 1.0;
    isTextVisible = false;
    languageOldValue = true;
    b = true;
    isResizing = false;
    isClicked = false;
    sec = 0;
    aliceTop = 0.1;
    bobTop = -0.5;
    eveTop = -0.5;
    containerPosition = 1.5;
    cnt = 0;
    isResizing = false;
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }

  @override
  // ignore: must_call_super
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    timer.cancel();
    isTouchEnabled = false;
    isScenarioBtnVisible = false;
    containerLeft = 0.0;
    containerWidth = 0.0;
    contaienrSec = 0;
    xShape = 0.0;
    messageText = '';
    globalOacity = 1.0;
    isTextVisible = false;
    languageOldValue = true;
    b = true;
    isResizing = false;
    isClicked = false;
    sec = 0;
    aliceTop = 0.1;
    bobTop = -0.5;
    eveTop = -0.5;
    containerPosition = 1.5;
    cnt = 0;

    super.dispose();
  }

  @override
  void didChangeMetrics() {
    isResizing = true;

    timer = Timer(const Duration(milliseconds: 100), () {
      setState(() {
        if (isClicked) {
          if (MediaQuery.of(context).size.height < 350) {
            containerPosition = 0.5;
          } else {
            containerPosition = 0.4;
          }
        }

        isResizing = false;
        timer.cancel();
      });
    });
  }

  AnimatedPositioned textContainer(
    double top,
    double left,
    double width,
    int seconds,
    double xShape,
    String text,
    bool textVisibility,
  ) {
    return AnimatedPositioned(
      top: MediaQuery.of(context).size.height * top,
      left: MediaQuery.of(context).size.width * left,
      width: MediaQuery.of(context).size.width * width,
      duration: Duration(milliseconds: seconds),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: TooltipShippingFeeBorder(
            MediaQuery.of(context).size.width * xShape,
            MediaQuery.of(context).size.width * 0.2 / 6,
            MediaQuery.of(context).size.width * -0.08,
            MediaQuery.of(context).size.width * -0.08,
            MediaQuery.of(context).size.width * 0.2,
            MediaQuery.of(context).size.width * 0.2 / 3,
          ),
          shadows: const [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 4.0,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Visibility(
          visible: textVisibility,
          child: Container(
            margin: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedTextKit(
                  onFinished: () {
                    setState(() {
                      isTyperFinished = true;
                    });
                  },
                  key: ValueKey<int>(cnt),
                  animatedTexts: [
                    TypewriterAnimatedText(
                      text,
                      speed: Duration(milliseconds: sec),
                      textAlign: TextAlign.start,
                      textStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.02,
                        color: Colors.black,
                      ),
                    ),
                  ],
                  isRepeatingAnimation: false,
                  displayFullTextOnTap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isResizing) sec = 0;
    return Scaffold(
      body: isResizing
          ? Container()
          : InkWell(
              onTap: () {
                if (isTouchEnabled) {
                  setState(
                    () {
                      cnt++;
                      isClicked = true;

                      // Bob
                      if (cnt == 2) {
                        containerLeft = 0.37;
                        containerWidth = 0.55;
                        contaienrSec = 1000;
                        xShape = 0.17;
                        // messageText = AppLocalizations.of(context)!.bobIntro;
                        messageText = 'test';
                      }
                      // Eve
                      else if (cnt == 3) {
                        containerLeft = 0.25;
                        containerWidth = 0.55;
                        contaienrSec = 1000;
                        xShape = -0.02;
                        // messageText = AppLocalizations.of(context)!.eveIntro;
                        messageText = 'test';
                      } else if (cnt == 4) {
                        containerLeft = 0.37;
                        containerWidth = 0.55;
                        contaienrSec = 1000;
                        xShape = 0.17;
                        // messageText = AppLocalizations.of(context)!.appDesc0;
                        messageText = 'test';
                      }
                      // Alice
                      else if (cnt == 5) {
                        containerLeft = 0.07;
                        containerWidth = 0.6;
                        contaienrSec = 1000;
                        xShape = -0.22;
                        // messageText = AppLocalizations.of(context)!.appDesc1;
                        messageText = 'test';
                      } else if (cnt == 6) {
                        containerLeft = 0.37;
                        containerWidth = 0.55;
                        contaienrSec = 1000;
                        xShape = 0.17;
                        // messageText = AppLocalizations.of(context)!.appDesc2;
                        messageText = 'test';
                      } else if (cnt == 7) {
                        containerLeft = 0.07;
                        containerWidth = 0.6;
                        contaienrSec = 1000;
                        xShape = -0.22;
                        // messageText = AppLocalizations.of(context)!.firstScene;
                        messageText = 'test';
                      } else if (cnt == 8) {
                        containerLeft = 0.25;
                        containerWidth = 0.55;
                        contaienrSec = 1000;
                        xShape = -0.02;
                        // messageText = AppLocalizations.of(context)!.secondScene;
                        messageText = 'test';
                      } else if (cnt == 9) {
                        containerLeft = 0.07;
                        containerWidth = 0.6;
                        contaienrSec = 1000;
                        xShape = -0.22;
                        // messageText = AppLocalizations.of(context)!.thirdScene;
                        messageText = 'test';
                      } else if (cnt == 10) {
                        containerLeft = 0.37;
                        containerWidth = 0.55;
                        contaienrSec = 1000;
                        xShape = 0.17;
                        // messageText = AppLocalizations.of(context)!.fourthScene;
                        messageText = 'test';
                      } else if (cnt == 11) {
                        isTouchEnabled = false;
                        containerLeft = 0.25;
                        containerWidth = 0.55;
                        contaienrSec = 1000;
                        xShape = -0.02;
                        // messageText = AppLocalizations.of(context)!.sceneStart1;
                        messageText = 'test';
                        timer = Timer(const Duration(seconds: 6), () {
                          setState(() {
                            isTextVisible = false;
                            isScenarioBtnVisible = true;
                          });
                        });
                      }
                    },
                  );
                  timerMethod(cnt);
                }
              },
              mouseCursor: SystemMouseCursors.basic,
              child: AnimatedOpacity(
                opacity: globalOacity,
                duration: const Duration(seconds: 1),
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height < 300
                              ? MediaQuery.of(context).size.height * 1.5
                              : MediaQuery.of(context).size.height,
                        ),
                        AnimatedPositioned(
                          top: MediaQuery.of(context).size.height * aliceTop,
                          left: MediaQuery.of(context).size.width * 0.1,
                          width: MediaQuery.of(context).size.width * 0.13,
                          height: MediaQuery.of(context).size.height * 0.23,
                          duration: const Duration(seconds: 2),
                          child: AnimatedOpacity(
                            opacity: 1.0,
                            duration: const Duration(microseconds: 1),
                            child: Image.asset(
                              path,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: MediaQuery.of(context).size.height * bobTop,
                          right: MediaQuery.of(context).size.width * 0.1,
                          width: MediaQuery.of(context).size.width * 0.13,
                          height: MediaQuery.of(context).size.height * 0.23,
                          duration: const Duration(seconds: 1),
                          child: AnimatedOpacity(
                            opacity: 1.0,
                            duration: const Duration(microseconds: 1),
                            child: Image.asset(
                              'assets/BobDH.jpeg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: MediaQuery.of(context).size.height * eveTop,
                          left: MediaQuery.of(context).size.width * 0.45,
                          width: MediaQuery.of(context).size.width * 0.13,
                          height: MediaQuery.of(context).size.height * 0.23,
                          duration: const Duration(seconds: 1),
                          child: AnimatedOpacity(
                            opacity: 1.0,
                            duration: const Duration(microseconds: 1),
                            child: Image.asset(
                              'assets/EveDH.jpeg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: cnt == 0 ? true : false,
                          child: AnimatedPositioned(
                            top: MediaQuery.of(context).size.height * 0.7,
                            left: MediaQuery.of(context).size.width * 0.4,
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                            duration: const Duration(seconds: 1),
                            child: AnimatedOpacity(
                              opacity: 1.0,
                              duration: const Duration(microseconds: 1),
                              child: SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        isTouchEnabled = true;
                                        isTextVisible = true;
                                        sec = 150;
                                        cnt++;
                                        if (cnt == 1) {
                                          containerLeft = 0.07;
                                          containerWidth = 0.6;
                                          contaienrSec = 500;
                                          xShape = -0.22;
                                          // messageText =
                                          //     AppLocalizations.of(context)!
                                          //         .aliceIntro;
                                          messageText = 'test';
                                        }
                                        isClicked = true;
                                      },
                                    );
                                    timerMethod(cnt);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: FittedBox(
                                    child: Text(
                                      // AppLocalizations.of(context)!.introStart,
                                      'test',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isScenarioBtnVisible,
                          child: AnimatedPositioned(
                            top: MediaQuery.of(context).size.height * 0.7,
                            left: MediaQuery.of(context).size.width * 0.4,
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                            duration: const Duration(seconds: 1),
                            child: AnimatedOpacity(
                              opacity: 1.0,
                              duration: const Duration(microseconds: 1),
                              child: SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ShowCaseWidget(
                                            builder: Builder(
                                              builder: (_) {
                                                return HomePageE2EE(
                                                    key: hoemPageDHKey);
                                              },
                                            ),
                                            onComplete: (p0, p1) {
                                              if (p0 == 5) {
                                                hoemPageDHKey.currentState!
                                                    .press();
                                              }
                                            },
                                            onFinish: () {
                                              hoemPageDHKey.currentState!
                                                  .press();
                                              hoemPageDHKey.currentState!
                                                  .resetBtnSize();
                                            },
                                          );
                                        },
                                      ),
                                    );
                                    setState(() {
                                      timer.cancel();
                                      isTouchEnabled = false;
                                      isScenarioBtnVisible = false;
                                      containerLeft = 0.0;
                                      containerWidth = 0.0;
                                      contaienrSec = 0;
                                      xShape = 0.0;
                                      messageText = '';
                                      globalOacity = 1.0;
                                      isTextVisible = false;
                                      languageOldValue = true;
                                      b = true;
                                      isResizing = false;
                                      isClicked = false;
                                      sec = 0;
                                      aliceTop = 0.1;
                                      bobTop = -0.5;
                                      eveTop = -0.5;
                                      containerPosition = 1.5;
                                      cnt = 0;
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: FittedBox(
                                    child: Text(
                                      // AppLocalizations.of(context)!.sceneStart2,
                                      'test',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: isTextVisible,
                            child: AnimatedPositioned(
                              top: MediaQuery.of(context).size.height *
                                  containerPosition,
                              left: MediaQuery.of(context).size.width *
                                  containerLeft,
                              width: MediaQuery.of(context).size.width *
                                  containerWidth,
                              duration: Duration(milliseconds: contaienrSec),
                              child: Container(
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: TooltipShippingFeeBorder(
                                    MediaQuery.of(context).size.width * xShape,
                                    MediaQuery.of(context).size.width * 0.2 / 6,
                                    MediaQuery.of(context).size.width * -0.08,
                                    MediaQuery.of(context).size.width * -0.08,
                                    MediaQuery.of(context).size.width * 0.2,
                                    MediaQuery.of(context).size.width * 0.2 / 3,
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Colors.blue,
                                      blurRadius: 4.0,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Visibility(
                                  visible: isClicked,
                                  child: Container(
                                    margin: const EdgeInsets.all(30.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedTextKit(
                                          onFinished: () {
                                            setState(() {
                                              isTyperFinished = true;
                                            });
                                          },
                                          key: ValueKey<int>(cnt),
                                          animatedTexts: [
                                            TypewriterAnimatedText(
                                              messageText,
                                              speed:
                                                  Duration(milliseconds: sec),
                                              textAlign: TextAlign.start,
                                              textStyle: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                          isRepeatingAnimation: false,
                                          displayFullTextOnTap: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        Visibility(
                          visible: isTouchEnabled,
                          child: Positioned(
                            top: MediaQuery.of(context).size.height * 0.8,
                            left: MediaQuery.of(context).size.width * 0.45,
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Animator<double>(
                              duration: const Duration(milliseconds: 1000),
                              cycles: 0,
                              curve: Curves.easeInOut,
                              tween: Tween<double>(begin: 15.0, end: 25.0),
                              builder: ((context, animatorState, child) => Icon(
                                    Icons.touch_app,
                                    size: animatorState.value * 2,
                                    color: Colors.blueGrey,
                                  )),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: cnt >= 10 ? false : true,
                          child: Positioned(
                            right: MediaQuery.of(context).size.width * 0.01,
                            top: MediaQuery.of(context).size.height * 0.01,
                            width: MediaQuery.of(context).size.width * 0.125,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: FittedBox(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ShowCaseWidget(
                                          builder: Builder(
                                            builder: (_) {
                                              return HomePageE2EE(
                                                  key: hoemPageDHKey);
                                            },
                                          ),
                                          onComplete: (p0, p1) {
                                            if (p0 == 5) {
                                              hoemPageDHKey.currentState!
                                                  .press();
                                            }
                                          },
                                          onFinish: () {
                                            hoemPageDHKey.currentState!.press();
                                            hoemPageDHKey.currentState!
                                                .resetBtnSize();
                                          },
                                        );
                                      },
                                    ),
                                  );
                                  setState(() {
                                    timer.cancel();
                                    isTouchEnabled = false;
                                    isScenarioBtnVisible = false;
                                    containerLeft = 0.0;
                                    containerWidth = 0.0;
                                    contaienrSec = 0;
                                    xShape = 0.0;
                                    messageText = '';

                                    globalOacity = 1.0;
                                    isTextVisible = false;
                                    languageOldValue = true;
                                    b = true;
                                    isResizing = false;
                                    isClicked = false;
                                    sec = 0;
                                    aliceTop = 0.1;
                                    bobTop = -0.5;
                                    eveTop = -0.5;
                                    containerPosition = 1.5;
                                    cnt = 0;
                                  });
                                },
                                child: Text(
                                  '${AppLocalizations.of(context)!.skip} >',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: true,
                          child: Positioned(
                            left: MediaQuery.of(context).size.width * 0.01,
                            top: MediaQuery.of(context).size.height * 0.01,
                            width: MediaQuery.of(context).size.width * 0.125,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: FittedBox(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    timer.cancel();
                                    isTouchEnabled = false;
                                    isScenarioBtnVisible = false;
                                    containerLeft = 0.0;
                                    containerWidth = 0.0;
                                    contaienrSec = 0;
                                    xShape = 0.0;
                                    messageText = '';

                                    globalOacity = 1.0;
                                    isTextVisible = false;
                                    languageOldValue = true;
                                    b = true;
                                    isResizing = false;
                                    isClicked = false;
                                    sec = 0;
                                    aliceTop = 0.1;
                                    bobTop = -0.5;
                                    eveTop = -0.5;
                                    containerPosition = 1.5;
                                    cnt = 0;
                                  });
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.reset,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  void timerMethod(int cnt) {
    timer = Timer(const Duration(milliseconds: 100), () {
      setState(() {
        if (cnt == 1) {
          aliceTop = 0.1;
        } else if (cnt == 2) {
          bobTop = 0.1;
        } else if (cnt == 3) {
          eveTop = 0.1;
        }
        if (b) {
          containerPosition = 0.5;
          b = false;
        }

        isResizing = false;
        timer.cancel();
      });
    });
  }
}
