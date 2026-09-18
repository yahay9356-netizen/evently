import 'package:enntly/core/Colors/colors_maneger_dark.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:enntly/core/Colors/colors_maneger_light.dart';

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
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManegerLightMode.backGround,
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.poppins(
        color: ColorsManegerLightMode.darkBlue,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: Colors.black,
        fontWeight: FontWeight.w100,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: ColorsManegerLightMode.mainText,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: GoogleFonts.poppins(color: ColorsManegerLightMode.mainText),
      titleSmall: GoogleFonts.poppins(
        color: ColorsManegerLightMode.input,
        fontWeight: FontWeight.w100,
      ),
      titleMedium: GoogleFonts.poppins(color: ColorsManegerLightMode.darkBlue),
      headlineMedium: GoogleFonts.poppins(
        color: ColorsManegerLightMode.mainText,
        fontSize: 16,
        fontWeight: FontWeight.w200,
      ),
      labelMedium: GoogleFonts.poppins(
        color: ColorsManegerLightMode.mainText,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: GoogleFonts.poppins(
        color: ColorsManegerLightMode.mainText,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: GoogleFonts.poppins(
        color: ColorsManegerDark.mainColor,
        fontWeight: FontWeight.w300,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManegerLightMode.mainText,
      hintStyle: TextStyle(
        color: ColorsManegerLightMode.storke,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: ColorsManegerLightMode.storke, width: 2),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: ColorsManegerLightMode.storke, width: 2),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManegerLightMode.backGround,
      selectedItemColor: ColorsManegerLightMode.darkBlue,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: ColorsManegerLightMode.secText,
    ),
    // cardTheme: CardThemeData(color: ColorsManegerLightMode.darkBlue),
    dividerTheme: DividerThemeData(color: ColorsManegerLightMode.input),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManegerDark.mainBackground,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(color: ColorsManegerDark.input),
      bodyLarge: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: GoogleFonts.poppins(color: ColorsManegerDark.input),
      titleSmall: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontWeight: FontWeight.w100,
      ),
      titleMedium: GoogleFonts.poppins(color: ColorsManegerDark.input),
      headlineMedium: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontSize: 16,
        fontWeight: FontWeight.w200,
      ),
      displayMedium: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontWeight: FontWeight.w300,
      ),
    ),
    appBarTheme: AppBarTheme(backgroundColor: ColorsManegerDark.mainBackground),
    cardColor: ColorsManegerLightMode.input,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManegerLightMode.storke,
      hintStyle: TextStyle(
        color: ColorsManegerLightMode.secText,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(
          color: ColorsManegerDark.mainBackground,
          width: 2,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(
          color: ColorsManegerDark.mainBackground,
          width: 2,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManegerDark.mainBackground,
      selectedItemColor: ColorsManegerLightMode.darkBlue,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: ColorsManegerLightMode.secText,
    ),
    cardTheme: CardThemeData(color: ColorsManegerDark.mainColor),
    dividerTheme: DividerThemeData(color: ColorsManegerDark.mainBackground),
  );
}
