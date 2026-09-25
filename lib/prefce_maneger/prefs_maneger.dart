import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class prefsManager {
  static late SharedPreferences prefs;
  
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveTheme(ThemeMode currentTheme) async {
    String theme = currentTheme == ThemeMode.dark ? "dark" : "light";
    await prefs.setString("current theme", theme);
  }

  static ThemeMode getSavedTheme() {
    String? savedTheme = prefs.getString("current theme");
    if (savedTheme == "dark") {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  static Future<void> saveLang(String lang) async {
    await prefs.setString("lang", lang);
  }

  static String getSavedLang() {
    return prefs.getString("lang") ?? "en";
  }
}
