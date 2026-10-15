import 'package:enntly/auth/auth_provider.dart';
import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/elvatet_boutton.dart';
import 'package:enntly/core/widght/text_button.dart';
import 'package:enntly/core/widght/text_filed.dart';
import 'package:enntly/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mainlayout.dart';

class Resisterscreen extends StatefulWidget {
  const Resisterscreen({super.key});

  static const String name = "First screen";

  @override
  State<Resisterscreen> createState() => _ResisterscreenState();
}

class _ResisterscreenState extends State<Resisterscreen> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        backgroundColor: ColorsManegerLightMode.backGround,
        body: SingleChildScrollView(
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 50),
                    Image.asset("assets/logo.png"),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        l10n?.createAccount ?? "",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: ColorsManegerLightMode.darkBlue,
                        ),
                      ),
                    ),
                    Textfiled(
                      hintText: l10n?.enterYourName ?? "",
                      prefixIcon: Icons.person,
                      suffixIcon: null,
                      controller: namecontroller,
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return "name is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Textfiled(
                      hintText: l10n?.enterYourEmail ?? "",
                      suffixIcon: null,
                      prefixIcon: Icons.email,
                      controller: emailcontroller,
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return "Email is required";
                        } else if (!isvalidEmail(input)) {
                          return "Bad format";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Textfiled(
                      hintText: l10n?.enterYourPassword ?? "",
                      suffixIcon: Icons.visibility_off,
                      prefixIcon: Icons.lock,
                      controller: passwordcontroller,
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return "the password is required";
                        }
                        if (isValidPassword(input)) {
                          return null;
                        } else {
                          return "The password should be at least 8 characters and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    Textfiled(
                      hintText: l10n?. confirmPassword ?? "",
                      suffixIcon: Icons.visibility_off,
                      prefixIcon: Icons.lock,
                      controller: confirmpasswordcontroller,
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return "Please confirm your password";
                        }

                        if (input != passwordcontroller.text) {
                          return "Passwords do not match";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 52),
                    provider.isloading
                        ? const Center(child: CircularProgressIndicator())
                        : Boutton(
                            name: l10n?.sprts ?? "",
                            color: ColorsManegerLightMode.darkBlue,
                            image: "",
                            textColor: ColorsManegerLightMode.backGround,
                            onDo: () async {
                              if (formkey.currentState!.validate()) {
                                await provider.createAccount(
                                  emailAddress: emailcontroller.text,
                                  password: passwordcontroller.text,
                                  name: namecontroller.text,
                                  context: context,
                                );
                                if (provider.user != null && context.mounted) {
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
                    const SizedBox(height: 42),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          l10n?.alreadyHaveAnAccount ?? "",
                          style: TextStyle(
                            color: ColorsManegerLightMode.secText,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Textbutton(
                          nameOFText: "Login",
                          onDo: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
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
}
