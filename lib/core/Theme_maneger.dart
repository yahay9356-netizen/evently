import 'package:enntly/core/Colors/colors_maneger_dark.dart';
import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:enntly/core/Colors/colors_maneger_light.dart';

class ThemeManeger {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorsManegerLightMode.backGround,
    primaryColor: ColorsManegerLightMode.darkBlue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        backgroundColor: ColorsManegerLightMode.darkBlue,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManegerLightMode.backGround,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: ColorsManegerLightMode.mainText),
      titleTextStyle: GoogleFonts.poppins(
        color: ColorsManegerLightMode.darkBlue,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(color: ColorsManegerLightMode.mainText),
      displayMedium: GoogleFonts.poppins(
        color: ColorsManegerLightMode.mainText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: GoogleFonts.poppins(
        color: ColorsManegerLightMode.mainText,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: GoogleFonts.poppins(color: ColorsManegerLightMode.mainText),
      headlineMedium: GoogleFonts.poppins(
        color: ColorsManegerLightMode.mainText,
        fontSize: 16,
        fontWeight: FontWeight.w200,
      ),
      headlineSmall: GoogleFonts.poppins(
        color: ColorsManegerLightMode.darkBlue,
      ),
      titleLarge: GoogleFonts.poppins(color: ColorsManegerLightMode.mainText),
      titleMedium: GoogleFonts.poppins(color: ColorsManegerLightMode.darkBlue),
      titleSmall: GoogleFonts.poppins(
        color: ColorsManegerLightMode.secText,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: ColorsManegerLightMode.mainText,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: ColorsManegerLightMode.mainText,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.poppins(
        color: ColorsManegerLightMode.secText,
      ),
      labelLarge: GoogleFonts.poppins(color: ColorsManegerLightMode.mainText),
      labelMedium: GoogleFonts.poppins(
        color: ColorsManegerLightMode.mainText,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.poppins(
        color: ColorsManegerLightMode.darkBlue,
        fontWeight: FontWeight.w300,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManegerLightMode.input,
      hintStyle: GoogleFonts.poppins(
        color: ColorsManegerLightMode.secText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: ColorsManegerLightMode.storke, width: 1.5),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: ColorsManegerLightMode.darkBlue, width: 2),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: ColorsManegerLightMode.red, width: 1.5),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: ColorsManegerLightMode.red, width: 2),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManegerLightMode.backGround,
      selectedItemColor: ColorsManegerLightMode.darkBlue,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: ColorsManegerLightMode.secText,
    ),
    cardColor: ColorsManegerLightMode.input,
    cardTheme: CardThemeData(
      color: ColorsManegerLightMode.input,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    dividerTheme: const DividerThemeData(color: ColorsManegerLightMode.storke),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorsManegerDark.mainBackground,
    primaryColor: ColorsManegerDark.primaryBlue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        backgroundColor: ColorsManegerDark.primaryBlue,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManegerDark.mainBackground,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: ColorsManegerDark.input),
      titleTextStyle: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(color: ColorsManegerDark.input),
      displayMedium: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: GoogleFonts.poppins(color: ColorsManegerDark.input),
      headlineMedium: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontSize: 16,
        fontWeight: FontWeight.w200,
      ),
      headlineSmall: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
      ),
      titleLarge: GoogleFonts.poppins(color: ColorsManegerDark.input),
      titleMedium: GoogleFonts.poppins(color: ColorsManegerDark.input),
      titleSmall: GoogleFonts.poppins(
        color: ColorsManegerDark.secColor,
        fontWeight: FontWeight.w100,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.poppins(
        color: ColorsManegerDark.secColor,
      ),
      labelLarge: GoogleFonts.poppins(color: ColorsManegerDark.input),
      labelMedium: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.poppins(
        color: ColorsManegerDark.input,
        fontWeight: FontWeight.w300,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManegerDark.surfaceColor,
      hintStyle: GoogleFonts.poppins(
        color: ColorsManegerDark.secColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: ColorsManegerDark.storke, width: 1.5),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: ColorsManegerDark.primaryBlue, width: 2),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: ColorsManegerDark.red, width: 1.5),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: ColorsManegerDark.red, width: 2),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManegerDark.mainBackground,
      selectedItemColor: ColorsManegerDark.input,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: ColorsManegerDark.secColor,
    ),
    cardColor: ColorsManegerDark.surfaceColor,
    cardTheme: CardThemeData(
      color: ColorsManegerDark.surfaceColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    dividerTheme: const DividerThemeData(color: ColorsManegerDark.storke),
  );
}
