import 'package:enntly/core/colors_maneger_light.dart';
import 'package:enntly/core/elvatet_boutton.dart';
import 'package:enntly/core/text_button.dart';
import 'package:enntly/core/text_filed.dart';
import 'package:flutter/material.dart';

class Resisterscreen extends StatelessWidget {
  const Resisterscreen({super.key});
  static const String name = "First screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManegerLightMode.backGround,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 50),
          Image.asset("assets/logo.png"),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Create your account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorsManegerLightMode.darkBlue,
              ),
            ),
          ),
          Textfiled(
            hintText: "Enter the name",
            name2ofiocn: Icons.person,
            nameoficon: null,

          ),
          SizedBox(height: 16),
          Textfiled(
            hintText: "Enter the eamil",
            nameoficon: null,
            name2ofiocn: Icons.email,
            // controller: TextEditingController(),
          ),
          SizedBox(height: 16),

          Textfiled(
            hintText: "Enter your password",
            nameoficon: Icons.visibility_off,
            name2ofiocn: Icons.lock,
            // controller:  TextEditingController(),
          ),
          SizedBox(height: 16),
          Textfiled(
            hintText: "Confirm your password",
            nameoficon: Icons.visibility_off,
            name2ofiocn: Icons.lock,
            // controller: TextEditingController(),
          ),
          SizedBox(height: 52),
          Boutton(
            name: "Sign up",
            color: ColorsManegerLightMode.darkBlue,
            image: "",
            textColor: ColorsManegerLightMode.backGround,
            onDo: () {},
          ),
          SizedBox(height: 42),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                  color: ColorsManegerLightMode.secText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Textbutton(nameOFText: "Login", onDo: () {}),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Or",
                style: TextStyle(
                  color: ColorsManegerLightMode.darkBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Boutton(
            name: "Sign up with Google",
            color: ColorsManegerLightMode.storke,
            textColor: ColorsManegerLightMode.darkBlue,
            image: "assets/logo of Google.png",
            onDo: () {},
          ),
        ],
      ),
    );
  }
}
