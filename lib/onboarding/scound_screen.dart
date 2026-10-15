import 'package:enntly/core/Colors/colors_maneger_dark.dart';
import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/elvatet_boutton.dart';
import 'package:enntly/l10n/app_localizations.dart';
import 'package:enntly/onboarding/onbording.dart';
import 'package:enntly/onboarding/third_screen.dart';
import 'package:enntly/provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoundScreen extends StatelessWidget {
  const ScoundScreen({super.key});
  static const String name = "Scound screen";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ConfigProvider>(context);
    bool isDark = provider.currentTheme == ThemeMode.dark;
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/logo.png"),
              Image.asset("assets/hot-trending.png"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIndicator(active: index == 0),
                  const SizedBox(width: 5),
                  CustomIndicator(active: index == 1),
                  const SizedBox(width: 5),
                  CustomIndicator(active: index == 2),
                ],
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        l10n?.findEventsThatInspireYou ?? "Find Events That Inspire You",
                        style: TextStyle(
                          color: isDark ? Colors.white : ColorsManegerLightMode.mainText,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Expanded(
                  child: Text(
                    l10n?.findEventsDesc ??
                        "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
                    style: TextStyle(
                      color: isDark ? Colors.white70 : ColorsManegerLightMode.secText,
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Boutton(
                  name: l10n?.next ?? "Next",
                  color: ColorsManegerLightMode.darkBlue,
                  image: "",
                  textColor: ColorsManegerLightMode.input,
                  onDo: () {
                    index = 1;
                    Navigator.pushNamed(context, ThirdScreen.name);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
