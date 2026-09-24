import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/elvatet_boutton.dart';
import 'package:enntly/onboarding/onbording.dart';
import 'package:enntly/tabs/home_screen.dart';
import 'package:flutter/material.dart';

import '../mainlayout.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});
  static const String name = "fourth screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Image.asset("assets/logo.png"),
              Image.asset("assets/being-creative (3).png"),
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Connect with Friends & Share Moments",
                        style: TextStyle(
                          color: ColorsManegerLightMode.mainText,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
                  style: TextStyle(
                    color: ColorsManegerLightMode.secText,
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Boutton(
                  name: "Get started",
                  color: ColorsManegerLightMode.darkBlue,
                  image: "",
                  textColor: ColorsManegerLightMode.input,
                  onDo: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Mainlayout()));
                    // Navigator.pushNamed(context, Mainlayout.name_main);
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
