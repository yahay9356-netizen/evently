import 'package:enntly/core/Theme_maneger.dart';
import 'package:enntly/screens/login_screan.dart';
import 'package:enntly/screens/resister.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

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
        initialRoute: Loginscreean.name,
        routes: {
          Loginscreean.name: (context) => Loginscreean(),
          Resisterscreen.name: (context) => Resisterscreen(),
        },
        theme: ThemeManeger.lightTheme,
        darkTheme: ThemeManeger.darkTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
