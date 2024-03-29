// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';

import 'about.dart';
import 'aboutApp.dart';
import 'slide1.dart';
import 'slide10.dart';
import 'slide11.dart';
import 'slide12.dart';
import 'slide13.dart';
import 'slide2.dart';
import 'slide3..dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'slide4.dart';
import 'slide5.dart';
import 'slide6.dart';
import 'slide7.dart';
import 'slide8.dart';
import 'slide9.dart';

class HomePageE2EE extends StatefulWidget {
  const HomePageE2EE({Key? key}) : super(key: key);

  @override
  HomePageE2EEState createState() => HomePageE2EEState();
}

class HomePageE2EEState extends State<HomePageE2EE>
    with SingleTickerProviderStateMixin {
  GlobalKey<Slide1State> slide1Key = GlobalKey<Slide1State>();
  GlobalKey<Slide2State> slide2Key = GlobalKey<Slide2State>();
  GlobalKey<Slide3State> slide3Key = GlobalKey<Slide3State>();
  GlobalKey<Slide4State> slide4Key = GlobalKey<Slide4State>();
  GlobalKey<Slide5State> slide5Key = GlobalKey<Slide5State>();
  GlobalKey<Slide6State> slide6Key = GlobalKey<Slide6State>();
  GlobalKey<Slide7State> slide7Key = GlobalKey<Slide7State>();
  GlobalKey<Slide8State> slide8Key = GlobalKey<Slide8State>();
  GlobalKey<Slide9State> slide9Key = GlobalKey<Slide9State>();
  GlobalKey<Slide10State> slide10Key = GlobalKey<Slide10State>();
  GlobalKey<Slide11State> slide11Key = GlobalKey<Slide11State>();
  GlobalKey<Slide12State> slide12Key = GlobalKey<Slide12State>();
  GlobalKey<Slide13State> slide13Key = GlobalKey<Slide13State>();
  press() {
    slide1Key.currentState!.pressMoreBtn();
  }

  resetBtnSize() {
    slide1Key.currentState!.finishShowCase();
  }

  static List returnAppBar = [AppBar(), 5.0];
  final List<Tab> tabs = <Tab>[
    for (var i = 0; i < 13; i++)
      Tab(
        text: (i + 1).toString(),
        height: 20,
      ),
  ];
  static late TabController controller;
  var tabIndex = 0;

  @override
  void initState() {
    controller = TabController(vsync: this, length: tabs.length);
    controller.addListener(() {
      setState(() {
        tabIndex = controller.index;
      });
    });
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    controller.dispose();

    super.dispose();
  }

  List appBarFunction(BuildContext context, TabController controller) {
    AppBar appBar = AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: MediaQuery.of(context).size.height * 0.0456,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Showcase(
          showArrow: false,
          key: menuKey,
          // description: AppLocalizations.of(context)!.readDHKE,
          description: 'What is E2EE',
          descTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          tooltipBackgroundColor: Colors.blue,
          child: PopupMenuButton(
            icon: Icon(
              Icons.menu,
              size: MediaQuery.of(context).size.height * 0.035,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(AppLocalizations.of(context)!.e2ee),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(AppLocalizations.of(context)!.aboutApp),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const About()));
              } else {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AboutApp()));
              }
            },
          ),
        ),
      ],
      toolbarHeight: MediaQuery.of(context).size.height * 0.06,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(bottom: 35.0),
        child: Center(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              tabIndex == 0
                  ? AppLocalizations.of(context)!.slide1
                  : tabIndex == 1
                      ? AppLocalizations.of(context)!.slide2
                      : tabIndex == 2
                          ? AppLocalizations.of(context)!.slide3
                          : tabIndex == 3
                              ? AppLocalizations.of(context)!.slide4
                              : tabIndex == 4
                                  ? AppLocalizations.of(context)!.slide5
                                  : tabIndex == 5
                                      ? AppLocalizations.of(context)!.slide6
                                      : tabIndex == 6
                                          ? AppLocalizations.of(context)!.slide7
                                          : tabIndex == 7
                                              ? AppLocalizations.of(context)!
                                                  .slide8
                                              : tabIndex == 8
                                                  ? AppLocalizations.of(
                                                          context)!
                                                      .slide9
                                                  : tabIndex == 9
                                                      ? AppLocalizations.of(
                                                              context)!
                                                          .slide10
                                                      : tabIndex == 10
                                                          ? AppLocalizations.of(
                                                                  context)!
                                                              .slide11
                                                          : tabIndex == 11
                                                              ? AppLocalizations
                                                                      .of(
                                                                          context)!
                                                                  .slide12
                                                              : AppLocalizations
                                                                      .of(context)!
                                                                  .slide3,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      bottom: TabBar(
        tabs: tabs,
        controller: controller,
        isScrollable: true,
        unselectedLabelColor: Colors.white.withOpacity(0.3),
        indicatorColor: Colors.white,
      ),
    );
    double appBarHeight = appBar.preferredSize.height;
    returnAppBar[0] = appBar;
    returnAppBar[1] = appBarHeight;
    return returnAppBar;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: appBarFunction(context, controller)[0],
        body: Builder(builder: (context) {
          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              Slide1(key: slide1Key),
              Slide2(key: slide2Key),
              Slide3(key: slide3Key),
              Slide4(key: slide4Key),
              Slide5(key: slide5Key),
              Slide6(key: slide6Key),
              Slide7(key: slide7Key),
              Slide8(key: slide8Key),
              Slide9(key: slide9Key),
              Slide10(key: slide10Key),
              Slide11(key: slide11Key),
              Slide12(key: slide12Key),
              Slide13(key: slide13Key),
            ],
          );
        }),
      ),
    );
  }
}
