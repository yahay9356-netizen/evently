import 'package:enntly/core/Colors/colors_maneger_dark.dart';
import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/elvatet_boutton.dart';
import 'package:enntly/onboarding/fourth_screen.dart';
import 'package:enntly/onboarding/onbording.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});
  static const String name = "Third screen";
  @override
  Widget build(BuildContext context) {
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
                  SizedBox(width: 5),
                  CustomIndicator(active: index == 1),
                  SizedBox(width: 5),
                  CustomIndicator(active: index == 2),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      "Effortless Event Planning",
                      style: TextStyle(
                        color: ColorsManegerLightMode.mainText,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
                    style: TextStyle(
                      color: ColorsManegerLightMode.secText,
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
                  name: "Next",
                  color: ColorsManegerLightMode.darkBlue,
                  image: "",
                  textColor: ColorsManegerLightMode.input,
                  onDo: () {
                    index=2;
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
