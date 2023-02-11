// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  bool selectedLanguage = true;
  bool settings = true;
  bool animationSpeed = true;
  bool language = true;
  bool secretBob = true;
  bool secretAlice = true;
  bool cancel = true;
  bool isClicked = false;
  bool isMorePressed = false;

  void changeLanguage(int languageIndex) {
    if (languageIndex == 0) {
      selectedLanguage = true;
      selectedLanguage = true;
      settings = true;
      animationSpeed = true;
      language = true;
      secretBob = true;
      secretAlice = true;
      cancel = true;
    } else {
      selectedLanguage = false;
      selectedLanguage = false;
      settings = false;
      animationSpeed = false;
      language = false;
      secretBob = false;
      secretAlice = false;
      cancel = false;
    }
    notifyListeners();
  }

  void changeIsMorePressed(bool b) {
    isMorePressed = b;
    notifyListeners();
  }
}
