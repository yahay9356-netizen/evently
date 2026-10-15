import 'package:enntly/core/Theme_maneger.dart';
import 'package:enntly/firebase_options.dart';
import 'package:enntly/l10n/app_localizations.dart';
import 'package:enntly/mainlayout.dart';
import 'package:enntly/onboarding/first_screen.dart';
import 'package:enntly/onboarding/fourth_screen.dart';
import 'package:enntly/onboarding/onbording.dart';
import 'package:enntly/onboarding/scound_screen.dart';
import 'package:enntly/onboarding/third_screen.dart';
import 'package:enntly/prefce_maneger/prefs_maneger.dart';
import 'package:enntly/provider/config_provider.dart';
import 'package:enntly/screens/add_event.dart';
import 'package:enntly/screens/login_screan.dart';
import 'package:enntly/screens/resister.dart';
import 'package:enntly/tabs/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await prefsManager.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ConfigProvider(),
      child: const Eventlyapp(),
    ),
  );
}

class Eventlyapp extends StatelessWidget {
  const Eventlyapp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ConfigProvider>(context);
    return ScreenUtilPlusInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Mainlayout.name_main,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.currentLanguage),
        routes: {
          Loginscreean.name: (context) => Loginscreean(),
          Resisterscreen.name: (context) => const Resisterscreen(),
          AddEvent.name: (context) => const AddEvent(),
          Homescreen.name: (context) => Homescreen(),
          FirstScreen.name: (context) => FirstScreen(),
          ScoundScreen.name: (context) => const ScoundScreen(),
          ThirdScreen.name: (context) => const ThirdScreen(),
          FourthScreen.name: (context) => const FourthScreen(),
          Onbording.name: (context) => Onbording(),
          Mainlayout.name_main: (context) => const Mainlayout(),
        },
        theme: ThemeManeger.lightTheme,
        darkTheme: ThemeManeger.darkTheme,
        themeMode: provider.currentTheme,
      ),
    );
  }
}
