import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/elvatet_boutton.dart';
import 'package:enntly/core/widght/text_button.dart';
import 'package:enntly/core/widght/text_filed.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: ColorsManegerLightMode.backGround,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
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
              SizedBox(height: 16),
              Textfiled(
                hintText: "Enter the eamil",
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
              SizedBox(height: 16),

              Textfiled(
                hintText: "Enter your password",
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
                    return "The password should be at least 6  characters and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
                  }
                },
              ),
              SizedBox(height: 16),
              Textfiled(
                hintText: "Confirm your password",
                suffixIcon: Icons.visibility_off,
                prefixIcon: Icons.lock,
                controller: TextEditingController(),
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
              SizedBox(height: 52),
              Boutton(
                name: "Sign up",
                color: ColorsManegerLightMode.darkBlue,
                image: "",
                textColor: ColorsManegerLightMode.backGround,
                onDo: () {
                  createAccount();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Homescreen()),
                  // );
                },
              ),
              SizedBox(height: 42),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: ColorsManegerLightMode.secText,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Textbutton(nameOFText: "Login", onDo: () {}),
                ],
              ),
              SizedBox(height: 30),
            ],
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

  void createAccount() {
    if (formkey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Mainlayout()),
      );
    }
  }
}
