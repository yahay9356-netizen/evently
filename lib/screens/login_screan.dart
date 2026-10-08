// ignore_for_file: must_be_immutable

import 'package:enntly/auth/auth_provider.dart';
import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/elvatet_boutton.dart';
import 'package:enntly/core/widght/text_button.dart';
import 'package:enntly/core/widght/text_filed.dart';
import 'package:enntly/l10n/app_localizations.dart';
import 'package:enntly/screens/reset_password.dart';
import 'package:enntly/screens/resister.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mainlayout.dart';

class Loginscreean extends StatelessWidget {
  static const String name = "LoginScreen";
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  Loginscreean({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return Scaffold(
            body: Form(
              key: formkey,
              child: Padding(
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
                        hintText: AppLocalizations.of(
                          context,
                        )!.enter_your_email,
                        prefixIcon: Icons.email,
                        suffixIcon: null,
                        controller: emailcontroller,
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return "Email is required";
                          } else if (!isvalidEmail(input)) {
                            return "Invalid email format";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Textfiled(
                        hintText: AppLocalizations.of(
                          context,
                        )!.enter_your_password,
                        prefixIcon: Icons.visibility,
                        suffixIcon: Icons.lock,
                        controller: passwordcontroller,
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return "Password is required";
                          } else if (!isValidPassword(input)) {
                            return "Invalid password format";
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Textbutton(
                            nameOFText: AppLocalizations.of(
                              context,
                            )!.forgot_password,
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
                      authProvider.isloading
                          ? const Center(child: CircularProgressIndicator())
                          : Boutton(
                              name: AppLocalizations.of(context)!.login,
                              color: ColorsManegerLightMode.darkBlue,
                              textColor: ColorsManegerLightMode.backGround,
                              image: "",
                              onDo: () async {
                                if (formkey.currentState!.validate()) {
                                  await authProvider.login(
                                    emailAddress: emailcontroller.text,
                                    password: passwordcontroller.text,
                                    context: context,
                                  );
                                  if (authProvider.user != null &&
                                      context.mounted) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Mainlayout(),
                                      ),
                                    );
                                  }
                                }
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
                      const SizedBox(height: 40),
                      Text(
                        "Or",
                        style: TextStyle(
                          color: ColorsManegerLightMode.darkBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: authProvider.isloading
                            ? null
                            : () async {
                                await authProvider.loginWithGoogle(
                                  context: context,
                                );

                                if (authProvider.user != null &&
                                    context.mounted) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Mainlayout(),
                                    ),
                                  );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManegerLightMode.storke,
                        ),
                        child: authProvider.isloading
                            ? const CircularProgressIndicator()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/logo of Google.png"),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Sign in with Google",
                                    style: TextStyle(
                                      color: ColorsManegerLightMode.darkBlue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

bool isvalidEmail(String email) {
  return RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email);
}

bool isValidPassword(String password) {
  return RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  ).hasMatch(password);
}
