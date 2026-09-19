import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/elvatet_boutton.dart';
import 'package:enntly/core/widght/text_button.dart';
import 'package:enntly/core/widght/text_filed.dart';
import 'package:enntly/l10n/app_localizations.dart';
import 'package:enntly/screens/reset_password.dart';
import 'package:enntly/screens/resister.dart';
import 'package:flutter/material.dart';

import '../mainlayout.dart';

class Loginscreean extends StatelessWidget {
  static const String name = "LoginScreen";
  const Loginscreean({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              Image.asset("assets/logo.png"),
              const SizedBox(height: 50),
              Text(
                AppLocalizations.of(context)!.log_in_to_your_account,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 24),
              Textfiled(
                hintText: AppLocalizations.of(context)!.enter_your_email,
                prefixIcon: null,
                suffixIcon: Icons.email,
                controller: TextEditingController(),
                validator: (input) => null,
              ),
              const SizedBox(height: 16),
              Textfiled(
                hintText: AppLocalizations.of(context)!.enter_your_password,
                prefixIcon: Icons.visibility,
                suffixIcon: Icons.lock,
                controller: TextEditingController(),
                validator: (input) => null,
              ),
              Row(
                children: [
                  const Spacer(),
                  Textbutton(
                    nameOFText: AppLocalizations.of(context)!.forgot_password,
                    onDo: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Resetpassword(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Boutton(
                name: AppLocalizations.of(context)!.login,
                color: ColorsManegerLightMode.darkBlue,
                textColor: ColorsManegerLightMode.backGround,
                image: "",
                onDo: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mainlayout()),
                  );
                },
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  AppLocalizations.of(context)!.dont_have_an_account,
                    style: TextStyle(
                      color: ColorsManegerLightMode.secText,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Textbutton(
                    nameOFText: AppLocalizations.of(context)!.sing_up,
                    onDo: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Resisterscreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   "Or",
                  //   style: TextStyle(
                  //     color: ColorsManegerLightMode.darkBlue,
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
