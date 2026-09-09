import 'package:enntly/core/colors_maneger.dart';
import 'package:enntly/core/elvatet_boutton.dart';
import 'package:flutter/material.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});
  static const String name = "RestThePassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          Image.asset("assets/rest.png"),
          SizedBox(height: 50),
          Boutton(
            name: "Reset password",
            color: ColorsManegerLightMode.darkBlue,
            image: "",
            textColor: ColorsManegerLightMode.backGround,
            onDo: () {},
          ),
        ],
      ),
    );
  }
}
