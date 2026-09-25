import 'package:enntly/core/Theme_maneger.dart';
import 'package:flutter/material.dart';
import '../prefce_maneger/prefs_maneger.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = prefsManager.getSavedTheme();
  String currentLanguage = prefsManager.getSavedLang();

  void changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    prefsManager.saveTheme(currentTheme);
    notifyListeners();
  }

  void changeLanguage(String newLang) {
    if (currentLanguage == newLang) return;
    currentLanguage = newLang;
    prefsManager.saveLang(currentLanguage);
    notifyListeners();
  }
}
