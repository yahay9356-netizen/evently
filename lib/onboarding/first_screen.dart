import 'package:enntly/core/Colors/colors_maneger_dark.dart';
import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/elvatet_boutton.dart';
import 'package:enntly/provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  static const String name = "Fisrst screen ";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ConfigProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/logo.png"),
              Image.asset("assets/being-creative (1).png"),
              SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      "Personalize Your Experience",
                      style: TextStyle(
                        color: ColorsManegerDark.mainColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Expanded(
                  child: Text(
                    "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                    style: TextStyle(
                      color: ColorsManegerDark.secColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      "Language",
                      style: TextStyle(
                        color: ColorsManegerDark.mainBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Boutton(
                      name: "English",
                      color: ColorsManegerLightMode.darkBlue,
                      image: "",
                      textColor: ColorsManegerLightMode.backGround,
                      onDo: () {
                        provider.changeLanguage("en");
                      },
                    ),
                    SizedBox(width: 10),
                    Boutton(
                      name: "Arabic",
                      color: ColorsManegerLightMode.darkBlue,
                      image: "",
                      textColor: ColorsManegerDark.input,
                      onDo: () {
                        provider.changeLanguage("Ar");
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      "Theme",
                      style: TextStyle(
                        color: ColorsManegerLightMode.darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Boutton(
                      name: "",
                      color: ColorsManegerLightMode.darkBlue,
                      image: "assets/sun.png",
                      textColor: Colors.black,
                      onDo: () {},
                    ),
                    SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Image.asset("assets/moon.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Boutton(
                  name: "Let’s start",
                  color: ColorsManegerLightMode.darkBlue,
                  image: "",
                  textColor: ColorsManegerLightMode.storke,
                  onDo: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}