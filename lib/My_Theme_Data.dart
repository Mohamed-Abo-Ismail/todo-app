import 'package:flutter/material.dart';
import 'package:to_do_project/appColors.dart';

class MyThemeData {
  static final ThemeData LightTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.BackgroundlightColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.WhiteColor)));
  static final ThemeData DarkTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.BackgrounddarkColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.BlackColor)));
}
