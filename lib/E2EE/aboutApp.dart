// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Main/global.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => AboutAppState();
}

class AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SelectableText(AppLocalizations.of(context)!.aboutApp),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: InteractiveViewer(
        panEnabled: true,
        scaleEnabled: Global.scaleEnabled,
        maxScale: 4,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppLocalizations.of(context)!.aboutApp1,
                              style: const TextStyle(
                                fontSize: 20,
                                height: 1.8,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'Hamze Ali',
                              style: const TextStyle(
                                fontSize: 20,
                                height: 1.8,
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch(AppLocalizations.of(context)!.ali);
                                },
                            ),
                            TextSpan(
                              text: AppLocalizations.of(context)!.aboutApp2,
                              style: const TextStyle(
                                fontSize: 20,
                                height: 1.8,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppLocalizations.of(context)!.aboutApp3,
                              style: const TextStyle(
                                fontSize: 20,
                                height: 1.8,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: AppLocalizations.of(context)!.aboutApp4,
                              // text: 'Wikipedia',
                              style: const TextStyle(
                                fontSize: 20,
                                height: 1.8,
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch(
                                      AppLocalizations.of(context)!.aboutApp4);
                                },
                            ),
                            const TextSpan(
                              text: ')',
                              style: TextStyle(
                                fontSize: 20,
                                height: 1.8,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: SelectableText(
                        AppLocalizations.of(context)!.aboutApp5,
                        style: const TextStyle(
                          fontSize: 20,
                          height: 1.8,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
