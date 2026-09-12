import 'package:enntly/core/colors_maneger_light.dart';
import 'package:enntly/core/colors_maneger_dark.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManeger {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManegerLightMode.backGround,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(vertical: 14),
        backgroundColor: ColorsManegerLightMode.darkBlue,
        textStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(
        color: ColorsManegerLightMode.darkBlue,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManegerDark.MainColor,
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: ColorsManegerDark.input),
    ),
  );
}
