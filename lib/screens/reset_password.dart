import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/elvatet_boutton.dart';
import 'package:enntly/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});
  static const String name = "RestThePassword";
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManegerLightMode.backGround,
      ),
      body: Column(
        children: [
          const SizedBox(height: 200),
          Image.asset("assets/rest.png"),
          const SizedBox(height: 50),
          Boutton(
            name: l10n?.forgotPassword ?? "",
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
