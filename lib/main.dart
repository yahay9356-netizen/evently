import 'package:enntly/core/theme_maneger.dart';
import 'package:enntly/mainlayout.dart';
import 'package:enntly/onboarding/First_screen.dart';
import 'package:enntly/onboarding/fourth_screen.dart';
import 'package:enntly/onboarding/onbording.dart';
import 'package:enntly/onboarding/scound_screen.dart';
import 'package:enntly/onboarding/third_screen.dart';
import 'package:enntly/prefce_maneger/prefs_maneger.dart';
import 'package:enntly/provider/config_provider.dart';
import 'package:enntly/screens/add_event.dart';
import 'package:enntly/tabs/favorit_screen.dart';
import 'package:enntly/tabs/home_screen.dart';
import 'package:enntly/screens/login_screan.dart';
import 'package:enntly/screens/resister.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prefsManager.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ConfigProvider(),
      child: Eventlyapp(),
    ),
  );
}

class Eventlyapp extends StatelessWidget {
  const Eventlyapp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ConfigProvider>(context);
    return ScreenUtilPlusInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Onbording.name,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.currentLanguage),
        routes: {
          Loginscreean.name: (context) => Loginscreean(),
          Resisterscreen.name: (context) => Resisterscreen(),
          AddEvent.name: (context) => AddEvent(),
          Homescreen.name: (context) => Homescreen(),
          FirstScreen.name: (context) => FirstScreen(),
          ScoundScreen.name: (context) => ScoundScreen(),
          ThirdScreen.name: (context) => ThirdScreen(),
          FourthScreen.name: (context) => FourthScreen(),
          Onbording.name: (context) => Onbording(),
        },
        theme: ThemeManeger.lightTheme,
        darkTheme: ThemeManeger.darkTheme,
        themeMode: provider.currentTheme,
      ),
    );
  }
}
