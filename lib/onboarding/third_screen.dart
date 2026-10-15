import 'package:enntly/core/Colors/colors_maneger_dark.dart';
import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/elvatet_boutton.dart';
import 'package:enntly/l10n/app_localizations.dart';
import 'package:enntly/onboarding/fourth_screen.dart';
import 'package:enntly/onboarding/onbording.dart';
import 'package:enntly/provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});
  static const String name = "Third screen";

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
              Image.asset("assets/being-creative (2).png"),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      l10n?.effortlessEventPlanning ?? "Effortless Event Planning",
                      style: TextStyle(
                        color: isDark ? Colors.white : ColorsManegerLightMode.mainText,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    l10n?.effortlessEventPlanningDesc ??
                        "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
                    style: TextStyle(
                      color: isDark ? Colors.white70 : ColorsManegerLightMode.secText,
                      fontSize: 21,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
                child: Boutton(
                  name: l10n?.next ?? "Next",
                  color: ColorsManegerLightMode.darkBlue,
                  image: "",
                  textColor: ColorsManegerLightMode.input,
                  onDo: () {
                    index = 2;
                    Navigator.pushNamed(context, FourthScreen.name);
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
