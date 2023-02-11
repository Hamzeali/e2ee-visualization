import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Main/global.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => AboutState();
}

class AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('End-to-End Encryption'),
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
                // children: [
                //   Container(
                //     margin: const EdgeInsets.all(20),
                //     child: Text(
                //       AppLocalizations.of(context)!.about0,
                //       // 'What is DHKE?',
                //       style: const TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 30,
                //       ),
                //     ),
                //   ),
                //   Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Container(
                //         margin: const EdgeInsets.only(left: 20),
                //         child: Text(
                //           AppLocalizations.of(context)!.about1,
                //           style: const TextStyle(
                //             fontSize: 25,
                //             color: Colors.red,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 20),
                //         child: Text(
                //           AppLocalizations.of(context)!.about2,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 20,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 20),
                //         child: Text(
                //           AppLocalizations.of(context)!.about3,
                //           style: const TextStyle(
                //             fontSize: 25,
                //             color: Colors.red,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 20),
                //         child: Text(
                //           AppLocalizations.of(context)!.about4,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 20),
                //         child: Text(
                //           AppLocalizations.of(context)!.about5,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 20),
                //         child: Text(
                //           AppLocalizations.of(context)!.about6,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 20),
                //         child: Text(
                //           AppLocalizations.of(context)!.about7,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 20),
                //         child: Text(
                //           AppLocalizations.of(context)!.about8,
                //           style: const TextStyle(
                //             fontSize: 25,
                //             color: Colors.black,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 20),
                //         child: Text(
                //           AppLocalizations.of(context)!.about9,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 30),
                //         child: Text(
                //           AppLocalizations.of(context)!.about10,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 30),
                //         child: Text(
                //           AppLocalizations.of(context)!.about11,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 30),
                //         child: Text(
                //           AppLocalizations.of(context)!.about12,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 50),
                //         child: Text(
                //           AppLocalizations.of(context)!.about13,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 30),
                //         child: Text(
                //           AppLocalizations.of(context)!.about14,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 50),
                //         child: Text(
                //           AppLocalizations.of(context)!.about15,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 30),
                //         child: Text(
                //           AppLocalizations.of(context)!.about16,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 50),
                //         child: Text(
                //           AppLocalizations.of(context)!.about17,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 50),
                //         child: Text(
                //           AppLocalizations.of(context)!.about18,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 30),
                //         child: Text(
                //           AppLocalizations.of(context)!.about19,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 20,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 20),
                //         child: Text(
                //           AppLocalizations.of(context)!.about20,
                //           style: const TextStyle(
                //             fontSize: 25,
                //             color: Colors.red,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 14,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(left: 30),
                //         child: Text(
                //           AppLocalizations.of(context)!.about21,
                //           style: const TextStyle(
                //             fontSize: 20,
                //             height: 1.8,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ],
                ),
          ),
        ),
      ),
    );
  }
}
