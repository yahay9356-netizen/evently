import 'package:enntly/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Eventlyapp());
}

class Eventlyapp extends StatelessWidget {
  const Eventlyapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.name,
      routes: {LoginScreen.name: (context) => LoginScreen()},
    );
  }
}
