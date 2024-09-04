import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  AppConfigProvider() {
    _loadSettings();
  }

  // Load theme and language settings from SharedPreferences
  void _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appLanguage = prefs.getString('appLanguage') ?? 'en';
    appTheme = ThemeMode.values[prefs.getInt('appTheme') ?? 0];
    notifyListeners();
  }

  // Save language setting to SharedPreferences
  void changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('appLanguage', newLanguage);
    notifyListeners();
  }

  // Save theme setting to SharedPreferences
  void changeTheme(ThemeMode newMode) async {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('appTheme', newMode.index);
    notifyListeners();
  }

  final prefs = SharedPreferences.getInstance();
}
