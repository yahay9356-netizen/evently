import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/onboarding/first_screen.dart';
import 'package:enntly/onboarding/fourth_screen.dart';
import 'package:enntly/onboarding/scound_screen.dart';
import 'package:enntly/onboarding/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';


int index = 0;

class Onbording extends StatefulWidget {
  @override
  State<Onbording> createState() => _OnbordingState();
  static const String name = "onbording";
}
class _OnbordingState extends State<Onbording> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              controller: _controller,
              children: [
                ScoundScreen(),
                ThirdScreen(),
                FourthScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.active});
  final bool active;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active
            ? ColorsManegerLightMode.darkBlue
            : ColorsManegerLightMode.secText,
      ),
      width: active ? 30 : 10,
      height: 10,
    );
  }
}