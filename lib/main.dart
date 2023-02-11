import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Main/intro.dart';
import 'Main/language-provider.dart';
import 'dart:async';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Main/splash.dart';

void main() {
  runApp(const E2EEVis());
}

class E2EEVis extends StatefulWidget {
  const E2EEVis({Key? key}) : super(key: key);

  @override
  State<E2EEVis> createState() => _E2EEVisState();

  // ignore: library_private_types_in_public_api
  static _E2EEVisState? of(BuildContext context) =>
      context.findAncestorStateOfType<_E2EEVisState>();
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double endVal = 0;
  @override
  void initState() {
    super.initState();
    endVal = 2;
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const MyHomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/splash2.jpeg',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.17,
            left: MediaQuery.of(context).size.width * 0.42,
            child: TweenAnimationBuilder<double>(
              tween: Tween(
                begin: 0,
                end: endVal,
              ),
              duration: const Duration(seconds: 1),
              builder: (_, val, child) => Transform.scale(
                scale: val,
                child: child,
              ),
              child: Text(
                'DHKE Visualization',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _E2EEVisState extends State<E2EEVis> {
  Locale locale = const Locale.fromSubtags(languageCode: 'de');
  void setLocale(Locale value) {
    setState(() {
      locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageProvider>(
      create: (context) => LanguageProvider(),
      child: MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: locale,
        debugShowCheckedModeBanner: false,
        home: const SplashWidget(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Intro();
  }
}
