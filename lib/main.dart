import 'package:enntly/core/theme_maneger.dart';
import 'package:enntly/mainlayout.dart';
import 'package:enntly/screens/add_event.dart';
import 'package:enntly/tabs/favorit_screen.dart';
import 'package:enntly/tabs/home_screen.dart';
import 'package:enntly/screens/login_screan.dart';
import 'package:enntly/screens/resister.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import 'l10n/app_localizations.dart';

void main() {
  runApp(Eventlyapp());
}

class Eventlyapp extends StatelessWidget {
  const Eventlyapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: Size(375, 812),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:Loginscreean.name,
        localizationsDelegates:  [
          AppLocalizations.delegate,

          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("en"),
          Locale("ar"),
        ],
        locale:Locale("en"),
        routes: {
          Loginscreean.name: (context) => Loginscreean(),
          Resisterscreen.name: (context) => Resisterscreen(),
          AddEvent.name: (context) => AddEvent(),
          Homescreen.name: (context) => Homescreen(),
        },
        theme: ThemeManeger.lightTheme,
        darkTheme: ThemeManeger.darkTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
